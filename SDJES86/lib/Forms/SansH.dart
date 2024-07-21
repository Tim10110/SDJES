// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Forms/SansH/sansh_data.dart';
import 'package:flutter_application_2/Forms/SansH/sansh_data_model.dart';
import 'package:flutter_application_2/Menus/FormsList.dart';
import 'package:flutter_application_2/Menus/Home.dart';
import 'package:flutter_application_2/components/my_textfields.dart';
import 'package:flutter_application_2/objectbox/controller.dart';
import 'package:flutter_application_2/objectbox_core.dart' as objectbox;
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';
import 'dart:async';
import 'package:flutter_application_2/DB/Db_manager.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SansH extends StatefulWidget {
  const SansH({super.key});

  @override
  _SansHState createState() => _SansHState();
}

class _SansHState extends State<SansH> {
  final SansHModel _sansHData = SansHModel();

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grille ICE ALSH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPageSH(sansHData: _sansHData), // Passer _sansHData à FirstPageSH
    );
  }
}

class MyFormContent {
  final List<String> sectionTitles;

  SansHModel sansHData;

  MyFormContent(this.sectionTitles, this.sansHData);

  Widget buildFormContent(int currentStep) {
    // Vérifier si currentStep est dans la plage valide
    if (currentStep < 0 || currentStep >= sectionTitles.length) {
      return const SizedBox(); // Retourne un widget vide si currentStep est invalide
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LinearProgressIndicator(
          value: (currentStep + 1) / sectionTitles.length,
          minHeight: 10,
        ),

        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            sectionTitles[currentStep],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),

        // Contenu de la section
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Affichage du contenu de la section correspondant à currentStep
                if (currentStep == 0) FirstSection(sansHData),
                if (currentStep == 1) SecondSection(sansHData),
                if (currentStep == 2) ThirdSection(sansHData),
                if (currentStep == 3) FourthSection(sansHData),
                if (currentStep == 4) FifthSection(sansHData),
                if (currentStep == 5) MiniBusSection(sansHData),
                if (currentStep == 6) SixthSection(sansHData),
                if (currentStep == 7) SeventhSection(sansHData),
                if (currentStep == 8) EighthSection(sansHData),
                if (currentStep == 9) NinthSection(sansHData),
                if (currentStep == 10) TenthSection(sansHData),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FirstPageSH extends StatefulWidget {
  final SansHModel sansHData; 

  const FirstPageSH({super.key, required this.sansHData}); 

  @override
  State<FirstPageSH> createState() => _FirstPageSHState();
}

class _FirstPageSHState extends State<FirstPageSH> {

  final ScrollController _scrollController = ScrollController();
  int _currentStep = 0;
  List<String> sectionTitles = [
    'Information relatives à la visite',
    'Renseignement sur l\'accueil (Articles R. 227-1 et suivant et R. 227-27 et suivants du CASF)',
    'Effectif de mineurs (Art. R. 227-2, R. 227-7 du CASF, arrêté du 22.9.2006 et art. L. 2324-1 du CSP)',
    'Equipe d\'encadrants (Art. R. 227-12 et suivants du CASF)',
    'Education et pédagogie (Art. R. 227-23 à R227-26 du CASF et circulaire n° DJEPVA/DJEPVAA3/2011/236)',
    'Sécurité des déplacements en minibus (Instruction du 21 juin 2024)',
    'Sanitaire (Art. R.227-6 et suivants du CASF et arrêté du 20 février 2003 relatif au suivi sanitaire des mineurs mentionnés à l’art. L.227-4 du CASF)',
    'Locaux  (Art. R. 227 – 5 du CASF)',
    'Restauration (Règlement CE n°178/2002)',
    'Mesures en cas de canicule',
    'Fin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rapport de contrôle et d'évaluation d'un accueil collectif de mineurs \nSans Hebergement"),
      ),
      body: SingleChildScrollView(
        //gérer le controller de scroll
        child: MyFormContent(sectionTitles, widget.sansHData).buildFormContent(_currentStep),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_currentStep > 0)
            FloatingActionButton.extended(
              heroTag: null,
              onPressed: () {
                setState(() {
                  _currentStep--; // Passer à la section précédente
                });
              },
              label: const Text('Retour'),
              icon: const Icon(Icons.arrow_back),
            ),
          const SizedBox(width: 10),
          if (_currentStep < sectionTitles.length - 1)
            FloatingActionButton.extended(
              heroTag: null,
              onPressed: () {
                setState(() {
                  _currentStep++; // Passer à la section suivante
                });
              },
              label: const Text('Suivant'),
              icon: const Icon(Icons.arrow_forward),
            ),
          if (_currentStep == sectionTitles.length - 1)
            FloatingActionButton.extended(
              heroTag: null,
              onPressed: () async {
                print(" inserting data .. ");
                final _ = await handleSignature();
                insert();
              // Insert les data dans la db et revenir au menu data
              },
                //ACTION TERMINER
              
              label: const Text('Terminer'),
              icon: const Icon(Icons.check),
            ),
        ],
      ),
                  bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home), 
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.data_usage),
      label: 'Data',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Options',
    ),
  ],
  currentIndex: 0, 
  selectedItemColor: Colors.blue, 
  onTap: (int index) {
    switch (index) {
      case 0:
        // Rediriger vers la page Home.dart
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 1:
              Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Data()));
        // Action à effectuer lorsque l'utilisateur sélectionne "Data"
        break;
      case 2:
        // Action à effectuer lorsque l'utilisateur sélectionne "Options"
        break;
    }
  },
),
    );
  }

  Future<void> handleSignature() async {
    widget.sansHData.signatureAuthorite = widget.sansHData.prescriptionAuthoritySignatureController.points;
    widget.sansHData.signature = Uint8List.fromList(await widget.sansHData.prescriptionAuthoritySignatureController.toPngBytes() ?? []);
    widget.sansHData.signatureAuthoriteJSON = widget.sansHData.signatureAuthorite.map((e) => widget.sansHData.pointToJSON(e)).toList();
  }

  void insert() async {
    final int id = await widget.sansHData.insertToDB();
    for(int i = 0; i < widget.sansHData.activitesSecu.length; i++) {
      widget.sansHData.activitesSecu[i].formSHID = id;
      await objectBox.storeActivite(widget.sansHData.activitesSecu[i]);
    }
    /*
    final id = await DatabaseHelper().insertSH(row);

    for (var compteur = 0; compteur <= widget.sansHData.activitesSecu!.length-1 ; compteur++){ // Boucle ajout DB des activités
    Map<String, dynamic> rowactivite = {
      DatabaseHelper.formSHId: id,
      DatabaseHelper.nomActivite: widget.sansHData.activitesSecu![compteur].nomActivite,
      DatabaseHelper.categorie: widget.sansHData.activitesSecu![compteur].categorie,
      DatabaseHelper.typeActivite: widget.sansHData.activitesSecu![compteur].typeActivite.join('|'),
      DatabaseHelper.encadrantNomPrenom: widget.sansHData.activitesSecu![compteur].encadrantNomPrenom,
      DatabaseHelper.encadrantQualif: widget.sansHData.activitesSecu![compteur].encadrantQualif,
      DatabaseHelper.numCartePro: widget.sansHData.activitesSecu![compteur].numCartePro
    };
     try {
     print("Attempting to insert: $rowactivite");
      final activites = await DatabaseHelper().insertActivite(rowactivite);
     print('Inserted row id: $activites');
    } catch (err) {
      print("Error during insert: $err");
    }
    }
    */
    Navigator.push(context, MaterialPageRoute(builder: (_) => const Data()));
  }

}

//___________________________SECTIONS______________________________________//

class FirstSection extends StatefulWidget {
  final SansHModel sansHData;
  const FirstSection(this.sansHData, {super.key});

  @override
  _FirstSectionState createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  final _visiteRealiseeParController = TextEditingController();
  final _enPresenceDeController = TextEditingController();
  final _dateVisiteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _visiteRealiseeParController.text = widget.sansHData.visiteRealiseePar; // Affiche la valeur initiale
    _enPresenceDeController.text = widget.sansHData.enPresenceDe;
    _dateVisiteController.text = DateFormat('dd/MM/yyyy').format(widget.sansHData.dateVisite);
  }

  @override
  void dispose() {
    _visiteRealiseeParController.dispose();
    _enPresenceDeController.dispose();
    _dateVisiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            labelText: 'Visite réalisée par :',
            controller: _visiteRealiseeParController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.visiteRealiseePar = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'En présence de :',
            controller: _enPresenceDeController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.enPresenceDe = value;
              });            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Date de la visite :',
            controller: _dateVisiteController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.sansHData.dateVisite = selectedDate;
              });            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SecondSection extends StatefulWidget {
  final SansHModel sansHData;
  const SecondSection(this.sansHData, {super.key});
  
  @override
  _SecondSectionState createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  final _denominationController = TextEditingController();
  final _adresseController = TextEditingController();
  final _lieuController = TextEditingController();
  final _numeroDeclarationController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _observationsController227_5 = TextEditingController();
  final _observationsController227_29 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _denominationController.text = widget.sansHData.denomination;// Affiche la valeur initiale
    _adresseController.text = widget.sansHData.adresse;
    _lieuController.text = widget.sansHData.lieu;
    _numeroDeclarationController.text = widget.sansHData.numeroDeclaration;
    _startDateController.text = DateFormat('dd/MM/yyyy').format(widget.sansHData.startDate);
    _endDateController.text = DateFormat('dd/MM/yyyy').format(widget.sansHData.endDate);
    
    _observationsController227_5.text = widget.sansHData.observations227_5;
    _observationsController227_29.text = widget.sansHData.observations227_29;
  }

  @override
  void dispose() {
    _denominationController.dispose();
    _adresseController.dispose();
    _lieuController.dispose();
    _numeroDeclarationController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _observationsController227_5.dispose();
    _observationsController227_29.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Champs de texte
          CustomTextField(labelText: 'Dénomination de l\'organisateur', 
          controller: _denominationController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.denomination = value;
            });
          },),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Adresse du siège ou du domicile de l\'organisateur', 
          controller: _adresseController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.adresse = value;
            });
          },),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Lieu et adresse du déroulement de l\'ACM', 
          controller: _lieuController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.lieu = value;
            });
          },),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'N° de déclaration', 
          controller: _numeroDeclarationController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.numeroDeclaration = value;
            });            
          },),
          const SizedBox(height: 20),

          // Champs de date
          DateField(
            labelText: 'Date du début de l\'ACM',
            controller: _startDateController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.sansHData.startDate = selectedDate;
              });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Date de fin de l\'ACM',
            controller: _endDateController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.sansHData.endDate = selectedDate;
              });
            },
          ),
          const SizedBox(height: 20),

          // Groupes de boutons radio
          RadioGroup(
            title: "Type d'accueil:",
            defaultChoice: widget.sansHData.radioTypeAccueil,
            choices: const ['ASLH extrascolaire', 'ASLH périscolaire', 'Accueil de scoutisme sans hébergement'],
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioTypeAccueil = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Textes
          const Text(
            'Document à vérifier',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Attestation de souscription aux contrats d’assurance délivrée par l’assureur',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
        
          // Groupes de boutons radio
          RadioGroup(
            title: 'Présenté:',
            defaultChoice: widget.sansHData.radio227_5,
            referenceText: 'Réf. :\n     Art. L. 227-5 CASF : « Les personnes organisant [des ACM et exploitant des locaux d’ACM] '
            'sont tenues de souscrire un contrat d’assurance garantissant les conséquences pécuniaires de leur responsabilité civile, '
            'ainsi que de celle de leurs préposés et des participants aux activités qu’elles proposent. Les assurés sont tiers entre eux ».',
            choices: const ['Oui', 'Non', 'Non vérifié'],
            onChanged: (value) {
              setState(() {
                widget.sansHData.radio227_5 = value;
              });
            },
          ),
          const SizedBox(height: 10),

          // Champ de texte long
          LongTextField(labelText: 'Observations', controller: _observationsController227_5,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observations227_5 = value;
            });            
          },),
          const SizedBox(height: 20),
          

          // Groupes de boutons radio
          RadioGroup(
            title: 'Présenté:',
            defaultChoice: widget.sansHData.radio227_29,
            referenceText: 'Réf. :\n     Art. R. 227-29 CASF : « L’attestation délivrée par l\'assureur doit comporter nécessairement les mentions suivantes :'
            '1º La référence aux dispositions légales et réglementaires.'
            '2º La raison sociale de la ou des entreprises d\'assurances concernées'
            '3º Le numéro du contrat d\'assurance souscrit'
            '4º La période de validité du contrat'
            '5º Le nom et l\'adresse du souscripteur'
            '6º L\'étendue et le montant des garanties'
            '7º La nature des activités couvertes ».',
            choices: const ['Oui', 'Non', 'Non vérifié'],
            onChanged: (value) {
              setState(() {
                widget.sansHData.radio227_29 = value;
              });
            },
          ),
          const SizedBox(height: 10),

          // Champ de texte long
          LongTextField(labelText: 'Observations', controller: _observationsController227_29,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observations227_29 = value;
            });            
          },),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ThirdSection extends StatefulWidget {
  final SansHModel sansHData;
  const ThirdSection(this.sansHData, {super.key});
  
  @override
  _ThirdSectionState createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {
  final _capaciteAccueilController = TextEditingController();
  final _moinsDe6AnsDeclaresController = TextEditingController();
  final _entre6et13AnsDeclaresController = TextEditingController();
  final _entre14et17AnsDeclaresController = TextEditingController();
  final _moinsDe6AnsPresentsController = TextEditingController();
  final _entre6et13AnsPresentsController = TextEditingController();
  final _entre14et17AnsPresentsController = TextEditingController();
  final _moinsDe6AnsHandiController = TextEditingController();
  final _entre6et13AnsHandiController = TextEditingController();
  final _entre14et17AnsHandiController = TextEditingController();
  final _totalDeclaresController = TextEditingController();
  final _totalPresentsController = TextEditingController();
  final _totalHandiController = TextEditingController();
  final _observations2324_13Controller = TextEditingController();
  final _observations2324_14Controller = TextEditingController();
  final _observationsRegistreMineursController = TextEditingController();
  int _totalDeclares = 0;
  int _totalPresents = 0;
  int _totalHandi = 0;

  @override
  void initState() {
    super.initState();
    _capaciteAccueilController.text = widget.sansHData.capaciteAccueil;
    _moinsDe6AnsDeclaresController.text = widget.sansHData.moinsDe6AnsDeclares;
    _entre6et13AnsDeclaresController.text = widget.sansHData.entre6et13AnsDeclares;
    _entre14et17AnsDeclaresController.text = widget.sansHData.entre14et17AnsDeclares;
    _moinsDe6AnsPresentsController.text = widget.sansHData.moinsDe6AnsPresents;
    _entre6et13AnsPresentsController.text = widget.sansHData.entre6et13AnsPresents;
    _entre14et17AnsPresentsController.text = widget.sansHData.entre14et17AnsPresents;
    _moinsDe6AnsHandiController.text = widget.sansHData.moinsDe6AnsHandi;
    _entre6et13AnsHandiController.text = widget.sansHData.entre6et13AnsHandi;
    _entre14et17AnsHandiController.text = widget.sansHData.entre14et17AnsHandi;
    _totalDeclaresController.text = widget.sansHData.totalDeclares;
    _totalPresentsController.text = widget.sansHData.totalPresents;
    _totalHandiController.text = widget.sansHData.totalHandi;
    _capaciteAccueilController.text = widget.sansHData.capaciteAccueil;
    


    //totalController = TextEditingController();
    _observations2324_13Controller.text = widget.sansHData.observations2324_13;
    _observations2324_14Controller.text = widget.sansHData.observations2324_14;
    _observationsRegistreMineursController.text = widget.sansHData.observationsRegistreMineur;
    _calculateTotalDeclares();
    _calculateTotalHandi();
    _calculateTotalPresents();
    _updateTotalEnfantsControllers();
  }

  @override
  void dispose() {
    _capaciteAccueilController.dispose();
    _moinsDe6AnsDeclaresController.dispose();
    _entre6et13AnsDeclaresController.dispose();
    _entre14et17AnsDeclaresController.dispose();
    _moinsDe6AnsPresentsController.dispose();
    _entre6et13AnsPresentsController.dispose();
    _entre14et17AnsPresentsController.dispose();
    _moinsDe6AnsHandiController.dispose();
    _entre6et13AnsHandiController.dispose();
    _entre14et17AnsHandiController.dispose();
    _totalDeclaresController.dispose();
    _totalPresentsController.dispose();
    _totalHandiController.dispose();
    _observations2324_13Controller.dispose();
    _observations2324_14Controller.dispose();
    _observationsRegistreMineursController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(labelText: 'N° de déclaration', 
          controller: _capaciteAccueilController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.capaciteAccueil = value;
            });
          }),
          const SizedBox(height: 20),
          const Text(
            'Effectifs',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            'Déclarés sur la fiche complémentaire',
          ),
          const SizedBox(height: 10),
          Row(
          children: [
            Expanded(
              child: CustomNumberField(
                labelText: '- de 6 ans',
                controller: _moinsDe6AnsDeclaresController,
                onChanged: (value) {
                  setState(() {
                    widget.sansHData.moinsDe6AnsDeclares = value.toString();
                    _calculateTotalDeclares();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '6 - 13 ans',
                controller: _entre6et13AnsDeclaresController,
                onChanged: (value) {
                  setState(() {
                    widget.sansHData.entre6et13AnsDeclares = value.toString();
                    _calculateTotalDeclares();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '14 - 17 ans',
                controller: _entre14et17AnsDeclaresController,
                onChanged: (value) {
                  setState(() {
                    widget.sansHData.entre14et17AnsDeclares = value.toString();
                    _calculateTotalDeclares();
                  });
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: _totalDeclaresController,
                decoration: const InputDecoration(
                  labelText: 'Total',
                ),    
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Présents',
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomNumberField(
                labelText: '- de 6 ans',
                controller: _moinsDe6AnsPresentsController,
                onChanged: (value) {
                  setState(() {
                    widget.sansHData.moinsDe6AnsPresents = value.toString();
                    _calculateTotalPresents();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '6 - 13 ans',
                controller: _entre6et13AnsPresentsController,
                onChanged: (value) {
                  setState(() {
                    widget.sansHData.entre6et13AnsPresents = value.toString();
                    _calculateTotalPresents();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '14 - 17 ans',
                controller: _entre14et17AnsPresentsController,
                onChanged: (value) {
                  setState(() {
                    widget.sansHData.entre14et17AnsPresents = value.toString();
                    _calculateTotalPresents();
                  });
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: _totalPresentsController,
                decoration: const InputDecoration(
                  labelText: 'Total',
                ),    
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Présence de mineurs en situation de handicap',
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomNumberField(
                labelText: '- de 6 ans',
                controller: _moinsDe6AnsHandiController,
                onChanged: (value) {
                  setState(() {
                    widget.sansHData.moinsDe6AnsHandi = value.toString();
                    _calculateTotalHandi();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '6 - 13 ans',
                controller: _entre6et13AnsHandiController,
                onChanged: (value) {
                  setState(() {
                    widget.sansHData.entre6et13AnsHandi = value.toString();
                    _calculateTotalHandi();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '14 - 17 ans',
                controller: _entre14et17AnsHandiController,
                onChanged: (value) {
                  setState(() {
                    widget.sansHData.entre14et17AnsHandi = value.toString();
                    _calculateTotalHandi();
                  });
                },
              ),
            ),
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: _totalHandiController,
                decoration: const InputDecoration(
                  labelText: 'Total',
                ),    
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        const Text(
            'Avis de la PMI (en cas d\'accueil de mineurs de moins de 6 ans)',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Groupement de boutons radio
          RadioGroup(
            title: 'Réf. : Art. R. 2324-13 CASF',
            defaultChoice: widget.sansHData.radio2324_13,
            choices: const ['Oui', 'Non', 'Non vérifié'],
            onChanged: (value) {
              setState(() {
                widget.sansHData.radio2324_13 = value;
              });
            },
          ),
          const SizedBox(height: 20),

          LongTextField(labelText: 'Observations', controller: _observations2324_13Controller,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observations2324_13= value;
              });           
          },),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Réf. : Art. R. 2324-14 CASF',
            defaultChoice: widget.sansHData.radio2324_14,
            choices: const ['Oui', 'Non', 'Non vérifié'],
            onChanged: (value) {
              setState(() {
                widget.sansHData.radio2324_14 = value;
              });
            },
          ),
          const SizedBox(height: 20),
          // Champ de texte long
          LongTextField(labelText: 'Observations', controller: _observations2324_14Controller,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observations2324_14= value;
              });           
          },),

          const SizedBox(height: 20),
          // Groupement de boutons radio
          RadioGroup(
            title: 'Registre de présence des mineurs',
            defaultChoice: widget.sansHData.radioRegistreMineur,
            choices: const ['Oui', 'Non', 'Non vérifié'],
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioRegistreMineur = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Champ de texte long
          LongTextField(labelText: 'Observations', controller: _observationsRegistreMineursController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsRegistreMineur= value;
              });           
          },),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  
  void _calculateTotalDeclares() {
    setState(() {
      _totalDeclares = _parseOrZero(widget.sansHData.moinsDe6AnsDeclares) 
                     + _parseOrZero(widget.sansHData.entre6et13AnsDeclares) 
                     + _parseOrZero(widget.sansHData.entre14et17AnsDeclares);
      _totalDeclaresController.text = _totalDeclares.toString();
      widget.sansHData.totalDeclares = _totalDeclares.toString();
    });
  }

  void _calculateTotalPresents() {
    setState(() {
      _totalPresents = _parseOrZero(widget.sansHData.moinsDe6AnsPresents) 
                     + _parseOrZero(widget.sansHData.entre6et13AnsPresents) 
                     + _parseOrZero(widget.sansHData.entre14et17AnsPresents);
      _totalPresentsController.text = _totalPresents.toString();
      widget.sansHData.totalPresents = _totalPresents.toString();
    });
  }

  void _calculateTotalHandi() {
    setState(() {
      _totalHandi = _parseOrZero(widget.sansHData.moinsDe6AnsHandi) 
                  + _parseOrZero(widget.sansHData.entre6et13AnsHandi) 
                  + _parseOrZero(widget.sansHData.entre14et17AnsHandi);
      _totalHandiController.text = _totalHandi.toString();
      widget.sansHData.totalHandi = _totalHandi.toString();
    });
  }

  void _updateTotalEnfantsControllers() {
    _totalDeclaresController.text = _totalDeclares.toString();
    _totalPresentsController.text = _totalPresents.toString();
    _totalHandiController.text = _totalHandi.toString();
  }

  int _parseOrZero(String value) {
    return int.tryParse(value) ?? 0;
  }
} 

class FourthSection extends StatefulWidget {
  final SansHModel sansHData;
  
  const FourthSection(this.sansHData, {super.key});
  
  @override
  _FourthSectionState createState() => _FourthSectionState();
}

class _FourthSectionState extends State<FourthSection> {
  final _directeurNomController = TextEditingController();
  final _directeurPrenomController = TextEditingController();
  final _directeurQualifController = TextEditingController();
  // Radio
  final _dateRenouvellementController = TextEditingController();
  final _dateDebutFormationController = TextEditingController();
  final _dateStartDerogationController = TextEditingController();
  final _dateEndDerogationController = TextEditingController();
  final _nombreAnimQualifController = TextEditingController();
  final _nombreAnimStagiairesController = TextEditingController();
  final _nombreAnimNonQualifController = TextEditingController();
  final _totalAnimController= TextEditingController();
  final _encadrementRequisMoinsDe6Controller = TextEditingController();
  final _encadrementRequisPlusDe6Controller = TextEditingController();
  final _totalAnimRequisController = TextEditingController();
  //final _capaciteAccueilController = TextEditingController();
  //final _capaciteAccueilController = TextEditingController();
  final _observations227_2Controller = TextEditingController();
  final _observations3_8Controller = TextEditingController();
  final _observations9_02_07Controller = TextEditingController();
  final _observations227_8Controller = TextEditingController();
  final _observationsCommunicationOrganisateurController = TextEditingController();
  final _observationsSavoirComportementController = TextEditingController();
  final _observationsQualifPersonnelController = TextEditingController();
  final _observationsTempsDePrepController = TextEditingController();
  final _observationsReuBilan = TextEditingController();
  final _observationsEvalStg = TextEditingController();

  int _totalAnimators = 0;
  int _totalRequiredAnimators = 0;

  @override
  void initState() {
    super.initState();
      _directeurNomController.text = widget.sansHData.directeurNom;
      _directeurPrenomController.text = widget.sansHData.directeurPrenom;
      _directeurQualifController.text = widget.sansHData.directeurQualification;
      _dateRenouvellementController.text = widget.sansHData.dateRenouvellement.toString();
      _dateDebutFormationController.text = widget.sansHData.dateDebutFormation.toString();
      _dateStartDerogationController.text = widget.sansHData.dateStartDerogation .toString();
      _dateEndDerogationController.text = widget.sansHData.dateEndDerogation .toString();
      _nombreAnimQualifController.text = widget.sansHData.nombreAnimQualif;
      _nombreAnimStagiairesController.text = widget.sansHData.nombreAnimStagiaires;
      _nombreAnimNonQualifController.text = widget.sansHData.nombreAnimNonQualif;
      _totalAnimController.text = widget.sansHData.totalAnim;
      _encadrementRequisMoinsDe6Controller.text = widget.sansHData.encadrementRequisMoinsDe6;
      _encadrementRequisPlusDe6Controller.text = widget.sansHData.encadrementRequisPlusDe6;
      _totalAnimRequisController.text = widget.sansHData.totalAnimRequis;
      _observations227_2Controller.text = widget.sansHData.observations227_2;
      _observations3_8Controller.text = widget.sansHData.observationsArrete3_5;
      _observations9_02_07Controller.text = widget.sansHData.observations9_02_07;
      _observations227_8Controller.text = widget.sansHData.observations227_8;
      _observationsCommunicationOrganisateurController.text = widget.sansHData.observationsCommunicationOrganisateur;
      _observationsSavoirComportementController.text = widget.sansHData.observationsSavoirComportement;
      _observationsQualifPersonnelController.text = widget.sansHData.observationsQualifPersonnel;
      _observationsTempsDePrepController.text = widget.sansHData.observationsTempsDePrep;
      _observationsReuBilan.text = widget.sansHData.observationsReuBilan;
      _observationsEvalStg.text = widget.sansHData.observationsEvalStg;
      _calculateTotalAnimators();
      _calculateTotalRequiredAnimators();
      _updateTotalControllers();
  }

  @override
  void dispose() {
    _directeurNomController.dispose();
    _directeurPrenomController.dispose();
    _directeurQualifController.dispose();
    _dateRenouvellementController.dispose();
    _dateDebutFormationController.dispose();
    _dateStartDerogationController.dispose();
    _dateEndDerogationController.dispose();
    _nombreAnimQualifController.dispose();
    _nombreAnimStagiairesController.dispose();
    _nombreAnimNonQualifController.dispose();
    _totalAnimController.dispose();
    _encadrementRequisMoinsDe6Controller.dispose();
    _encadrementRequisPlusDe6Controller.dispose();
    _totalAnimRequisController.dispose();
    _observations227_2Controller.dispose();
    _observations3_8Controller.dispose();
    _observations9_02_07Controller.dispose();
    _observations227_8Controller.dispose();
    _observationsCommunicationOrganisateurController.dispose();
    _observationsSavoirComportementController.dispose();
    _observationsQualifPersonnelController.dispose();
    _observationsTempsDePrepController.dispose();
    _observationsReuBilan.dispose();
    _observationsEvalStg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Directeur',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'NOM', controller: _directeurNomController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.directeurNom = value;
            });
          }),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Prénom', controller: _directeurPrenomController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.directeurPrenom = value;
            });
          }),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Qualification', controller: _directeurQualifController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.directeurQualification = value;
            });
          }),
          const SizedBox(height: 10),
          RadioGroup(
            title: '',
            defaultChoice: widget.sansHData.radioTitulaireStagiaire,
            choices: const ['Titulaire', 'Stagiaire'],
            onChanged: (value) {
            setState(() {
              widget.sansHData.radioTitulaireStagiaire = value;
            });
          }
          ),
          const SizedBox(height: 20),
          const Text('Si BAFD :'),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Date de renouvellement (à renouveler tous les 5 ans)',
            controller: _dateRenouvellementController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
              widget.sansHData.dateRenouvellement = selectedDate;
            });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Stagiaire BAFD, date de début de formation',
            controller: _dateDebutFormationController,
            onDateSelected: (DateTime selectedDate) {
            setState(() {
              widget.sansHData.dateDebutFormation = selectedDate;
            });
            },
          ),
          const SizedBox(height: 20),
          const Text('Si directeur non qualifié bénéficiant d\'une dérogation, période de dérogation'),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Début de la période',
            controller: _dateStartDerogationController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
              widget.sansHData.dateStartDerogation = selectedDate;
            });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Fin de la période',
            controller: _dateEndDerogationController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
              widget.sansHData.dateEndDerogation = selectedDate;
            });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Taux de qualification de l\'équipe d\'animation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'En cas d’effectif de moins de 50 mineurs, le directeur peut être inclus dans l’encadrement.',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          CustomNumberField(
            labelText: 'Nombre d\'animateurs qualifiés(50% minimum)',
            controller: _nombreAnimQualifController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.nombreAnimQualif= value.toString();
                _calculateTotalAnimators();
              });
            },
            
          ),
          const SizedBox(height: 10),
          CustomNumberField(
            labelText: 'Nombre d\'animateurs stagiaires',
            onChanged: (value) {
              setState(() {
                widget.sansHData.nombreAnimStagiaires= value.toString();
                _calculateTotalAnimators();
              });
            },
            controller: _nombreAnimStagiairesController,
          ),
          const SizedBox(height: 10),
          CustomNumberField(
            labelText: 'Nombre d\'animateurs non qualifiés',
            onChanged: (value) {
              setState(() {
                widget.sansHData.nombreAnimNonQualif= value.toString();
                _calculateTotalAnimators();
              });
            },
            controller: _nombreAnimNonQualifController,
          ),
          const SizedBox(height: 10),
          TextFormField(
            readOnly: true,
            controller: _totalAnimController,
            decoration: const InputDecoration(
              labelText: 'TOTAL d\'animateurs en activité',
            ),
          ),
          const SizedBox(height: 20),


          const Text(
            'Taux d\'encadrement requis',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CustomNumberField(
            labelText: 'Encadrement requis pour les mineurs de moins de 6 ans (1 encadrant pour 8 mineurs)',
            onChanged: (value) {
              setState(() {
                widget.sansHData.encadrementRequisMoinsDe6= value.toString();
                _calculateTotalRequiredAnimators();
              });
            },
            controller: _encadrementRequisMoinsDe6Controller,
          ),
          const SizedBox(height: 10),
          CustomNumberField(
            labelText: 'Encadrement requis pour les mineurs de plus de 6 ans (1 encadrant pour 12 mineurs)',
            onChanged: (value) {
              setState(() {
                widget.sansHData.encadrementRequisPlusDe6= value.toString();                
                _calculateTotalRequiredAnimators();
              });
            },
            controller: _encadrementRequisPlusDe6Controller,
          ),  

          const SizedBox(height: 10),
          TextFormField(
            readOnly: true,
            controller: _totalAnimRequisController,
            decoration: const InputDecoration(
              labelText: 'TOTAL d\'animateurs requis',
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Documents ou éléments à vérifier',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
          ),
          const SizedBox(height: 20),

          RadioGroup(
            title: 'Récépissé de déclaration de l\'accueil:',
            defaultChoice: widget.sansHData.radio227_2,
            referenceText: 'Art. R. 227-2 CASF : " Toute personne organisant [un ACM] doit en faire préalablement la déclaration au représentant de l\'Etat dans le département ".',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            onChanged: (value) {
              setState(() {
                widget.sansHData.radio227_2= value;                
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations227_2Controller,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observations227_2 = value;
            });
          }),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Sincérité de la déclaration (nombre de mineurs, encadrement, période, lieu, etc.):',
            defaultChoice: widget.sansHData.radioArrete3_5,
            referenceText:  'Réf. :\n'
            'Arreté du 3 novembre 2014, article 8 : " L\'organisateur porte immédiatement par écrit à la connaissance du préfet qui a reçu la déclaration toute modification intervenue dans les éléments de la fiche initiale ou des fiches complémentaires ".\n'
            'NB :\n'
            '- Noter le nom de tout animateur, personnel, intervenant ou prestataire (en contact avec les mineurs) qui ne serait pas sur la déclaration.\n'
            '- La sincérité est controlée par rapport à la déclaration sur Gam-Tam (et non le récépissé).',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioArrete3_5= value;                
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations3_8Controller,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observationsArrete3_5 = value;
            });
          }),
          const SizedBox(height: 20),
                    
          RadioGroup(
            title: 'Diplôme de l\'équipe:',
            referenceText: 'NB :\n'
            '- Noter le nom de tout animateur, personnel, intervenant ou prestataire (en contact avec les mineurs) qui ne serait pas sur la déclaration.\n'
            '- La sincérité est controlée par rapport à la déclaration sur Gam-Tam (et non le récépissé).',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radio9_02_07,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radio9_02_07= value;
              });
            }
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations9_02_07Controller,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observations9_02_07 = value;
            });
          }),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Attestation de vaccination de chacun des membres de l\'équipe:',
            referenceText: 'Réf. :\n'
            'Art. R. 227-8 CASF : " Les personnes qui participent à [un ACM] doivent produire, avant leur entrée en fonction, un document attestant qu\'elles ont satisfait aux obligations légales en matière de vaccination. "',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radio227_8,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radio227_8 = value;
              });
            }
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations227_8Controller,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observations227_8 = value;
            });
          }),
          const SizedBox(height: 20),
          const Text(
            'Encadrement et animation de l\'équipe',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          
          const Text(
            'Le directeur connait-il les modalités de communication avec l\'organisateur pour l\'informer des conditions de déroulement de l\'accueil ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Observations:', controller: _observationsCommunicationOrganisateurController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observationsCommunicationOrganisateur = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'Le personnel possède-t-il des savoirs comportementaux adaptés (relations aux familles, aux enfants, aux autres acteurs, etc.) ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Observations:', controller: _observationsSavoirComportementController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observationsSavoirComportement = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'Les qualifications du personnel sont-elles adaptées aux projets développés et aux publics accueillis ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Observations:', controller: _observationsQualifPersonnelController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observationsQualifPersonnel = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'L\'animation de l\'équipe fait-elle l\'objet de temps de préparation et d\'évaluation (modalités d\'information de l\'équipe, modalités de repos de l\'équipe, etc.) ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Observations:', controller: _observationsTempsDePrepController,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observationsTempsDePrep = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'Y a-t-il des réunions de bilan entre le directeur et l\'équipe ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Observations', controller: _observationsReuBilan,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observationsReuBilan = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'L\'évaluation des stagiaires s\'appuie-t-elle sur des critères connus et des temps d\'échange ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Observations:', controller: _observationsEvalStg,
          onChanged: (value) {
            setState(() {
              widget.sansHData.observationsEvalStg = value;
            });
          }),
        ],
      ),
    );
  }

  void _calculateTotalAnimators() {
    setState(() {
      _totalAnimators = _parseOrZero(widget.sansHData.nombreAnimQualif) 
                        + _parseOrZero(widget.sansHData.nombreAnimStagiaires) 
                        + _parseOrZero(widget.sansHData.nombreAnimNonQualif);
      _totalAnimController.text = _totalAnimators.toString();
      widget.sansHData.totalAnim = _totalAnimators.toString();
    });
  }

  void _calculateTotalRequiredAnimators() {
    setState(() {
      _totalRequiredAnimators = _parseOrZero(widget.sansHData.encadrementRequisPlusDe6) 
                                + _parseOrZero(widget.sansHData.encadrementRequisMoinsDe6) ;
      _totalAnimRequisController.text = _totalRequiredAnimators.toString();
      widget.sansHData.totalAnimRequis = _totalRequiredAnimators.toString();

    });
  }

  void _updateTotalControllers() {
    _totalAnimController.text = _totalAnimators.toString();
    _totalAnimRequisController.text = _totalRequiredAnimators.toString();
  }
  
  int _parseOrZero(String value) {
    return int.tryParse(value) ?? 0;
  }
}

class FifthSection extends StatefulWidget {
  final SansHModel sansHData;
  
  const FifthSection(this.sansHData, {super.key});
  
  @override
  _FifthSectionState createState() => _FifthSectionState();
}

class _FifthSectionState extends State<FifthSection> {
  final _educationalProjectController = TextEditingController();
  final _pedagogicalProjectController = TextEditingController();
  final _projectsCommunicatedController = TextEditingController();
  final _directorKnowledgeOfPEController = TextEditingController();
  final _directorKnowledgeOfResourcesController = TextEditingController();
  final _teamResourcesAdequateController = TextEditingController();
  final _directorBudgetAutonomyController = TextEditingController();
  final _preciseEducationalOrientationController = TextEditingController();
  final _PEFromDiagnosticController = TextEditingController();
  final _PEInYouthPolicyController = TextEditingController();
  final _PERevisionDetailsController = TextEditingController();
  final _ppCoherenceController = TextEditingController();
  final _ppCharacteristicsController = TextEditingController();
  final _ppElaborationController = TextEditingController();
  final _ppAccommodationController = TextEditingController();
  final _ppActivityDetailsController = TextEditingController();
  final _ppActivityDistributionController = TextEditingController();
  final _nightSecurityController = TextEditingController();
  final _ppHealthMeasuresController = TextEditingController();
  final _ppTeamFunctioningController = TextEditingController();
  final _ppEvaluationMethodsController = TextEditingController();
  final _observationsCoherenceController = TextEditingController();
  final _activitiesPreparationController = TextEditingController();
  final _activitiesChoiceController = TextEditingController();
  final _activitiesRisksAnalysisController = TextEditingController();
  final _activitiesExchangeController = TextEditingController();
  final _activitiesTrainingNeedsController = TextEditingController();

  @override
  void initState() {
    super.initState();
      _educationalProjectController.text = widget.sansHData.observationsProjEdu;
      _pedagogicalProjectController.text = widget.sansHData.observationsProjPeda;
      _projectsCommunicatedController.text = widget.sansHData.observationsRepresentant;
      _directorKnowledgeOfPEController.text = widget.sansHData.observationsPE;
      _directorKnowledgeOfResourcesController.text = widget.sansHData.observationsMoyens;
      _teamResourcesAdequateController.text = widget.sansHData.observationsMoyensEquipe;
      _directorBudgetAutonomyController.text = widget.sansHData.observationsBudget;
      _preciseEducationalOrientationController.text = widget.sansHData.observationsOrientation;
      _PEFromDiagnosticController.text = widget.sansHData.observationsDiagnostic;
      _PEInYouthPolicyController.text = widget.sansHData.observationsPolitique;
      _PERevisionDetailsController.text = widget.sansHData.observationsReorientation;
      _ppCoherenceController.text = widget.sansHData.observationsPPCoherence;
      _ppCharacteristicsController.text = widget.sansHData.observationsPPCara;
      _ppElaborationController.text = widget.sansHData.observationsPPConcertation;
      _ppAccommodationController.text = widget.sansHData.observationsPPModalite;
      _ppActivityDetailsController.text = widget.sansHData.observationsPPNature;
      _ppActivityDistributionController.text = widget.sansHData.observationsPPRepartition;
      _nightSecurityController.text = widget.sansHData.observationsSecuriteNuit;
      _ppHealthMeasuresController.text = widget.sansHData.observationsPPSanteHandi;
      _ppTeamFunctioningController.text = widget.sansHData.observationsPPFonctEquipe;
      _ppEvaluationMethodsController.text = widget.sansHData.observationsPPEvalAccueil;
      _observationsCoherenceController.text = widget.sansHData.observationsPPCoherence;
      _activitiesPreparationController.text = widget.sansHData.observationsPPConcertation;
      _activitiesChoiceController.text = widget.sansHData.observationsActiviteMineur;
      _activitiesRisksAnalysisController.text = widget.sansHData.observationsRisques;
      _activitiesExchangeController.text = widget.sansHData.observationsEchange;
      _activitiesTrainingNeedsController.text = widget.sansHData.observationsFormation;

  }

  @override
  void dispose() {
    _educationalProjectController.dispose();
    _pedagogicalProjectController.dispose();
    _projectsCommunicatedController.dispose();
    _directorKnowledgeOfPEController.dispose();
    _directorKnowledgeOfResourcesController.dispose();
    _teamResourcesAdequateController.dispose();
    _directorBudgetAutonomyController.dispose();
    _preciseEducationalOrientationController.dispose();
    _PEFromDiagnosticController.dispose();
    _PEInYouthPolicyController.dispose();
    _PERevisionDetailsController.dispose();
    _ppCoherenceController.dispose();
    _ppCharacteristicsController.dispose();
    _ppElaborationController.dispose();
    _ppAccommodationController.dispose();
    _ppActivityDetailsController.dispose();
    _ppActivityDistributionController.dispose();
    _nightSecurityController.dispose();
    _ppHealthMeasuresController.dispose();
    _ppTeamFunctioningController.dispose();
    _ppEvaluationMethodsController.dispose();
    _observationsCoherenceController.dispose();
    _activitiesPreparationController.dispose();
    _activitiesChoiceController.dispose();
    _activitiesRisksAnalysisController.dispose();
    _activitiesExchangeController.dispose();
    _activitiesTrainingNeedsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Documents ou éléments à vérifier',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
          ),
          const Text(
            'Le projet éducatif',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Le projet éducatif:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioProjEdu,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioProjEdu = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _educationalProjectController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsProjEdu = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Le projet pédagogique:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioProjPeda,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioProjPeda = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _pedagogicalProjectController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsProjPeda = value;
              });
            },),
          const SizedBox(height: 20),
          const Text(
            'Le projet éducatif et le projet pédagogique ont été communiqués aux représentants légaux des mineurs',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Présenté:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioRepresentant,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioRepresentant = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _projectsCommunicatedController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsRepresentant = value;
              });
            },),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          const Text(
            'Le projet éducatif',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Projet éducatif (PE) (Articles R 227-23 et R 227-24 du CASF)\n'
            'Il est décrit dans un document élaboré par la personne physique ou morale organisant l\'accueil.\n'
            'Il prend en compte, dans l\'organisation de la vie collective et lors de la pratique des diverses activités, et notamment des activités physiques et sportives, les besoins psychologiques et physiologiques des mineurs.\n'
            'Lorsque l\'organisateur accueille des mineurs valides et des mineurs atteints de troubles de la santé ou de handicaps, le projet éducatif prend en compte les spécificités de cet accueil.\n'
            'Il définit les objectifs de l\'action éducative des personnes qui assurent la direction ou l\'animation des accueils et précise les mesures prises par la personne physique ou morale organisation l\'accueil pour être informée des conditions de déroulement.\n'
            'Les personnes qui assurent la direction ou l\'animation de l\'un de ces accueils prennent connaissance du projet éducatif avant leur entrée en fonction. Elles sont informées des moyens matériels et financiers mis à leur disposition.',
          ),
          const SizedBox(height: 20),
          const Text(
            'Le directeur a-t-il connaissance du PE de l\'organisateur ?',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _directorKnowledgeOfPEController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsPE = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Le directeur a-t-il connaissance des moyens matériels et financiers mis à disposition ? Quels sont-ils ?',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _directorKnowledgeOfResourcesController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsMoyens = value;
              });
            },),
          const SizedBox(height: 20),
          const Text(
            'Les moyens dont dispose l\'équipe pédagogique sont-ils de nature à permettre les objectifs visés (matériel pédagogique, etc.) ?',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _teamResourcesAdequateController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsMoyensEquipe = value;
              });
            },),
          const SizedBox(height: 20),
          const Text(
            'Le directeur gère-t-il le budget de manière autonome ?',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _directorBudgetAutonomyController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsBudget = value;
              });
            },),
          const SizedBox(height: 20),
          const Text(
            'Le PE propose-t-il des orientations éducatives précises ?',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _preciseEducationalOrientationController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsOrientation = value;
              });
            },),
          const SizedBox(height: 20),
          const Text(
            'Le PE a-t-il été établi à partir d\'un diagnostic (social, territorial, etc.) ?',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _PEFromDiagnosticController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsDiagnostic = value;
              });
            },),
          const SizedBox(height: 20),
          const Text(
            'Le PE s\'inscrit-il dans une politique de jeunesse sur le territoire ?',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _PEInYouthPolicyController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsPolitique = value;
              });
            },),
          const SizedBox(height: 20),
          const Text(
            'Le PE a-t-il été révisé, actualisé en fonction d\'une réorientation des objectifs de l\'organisateur ? Le cas échéant, quand l\'a-t-il été ?',
            style: TextStyle(fontWeight: FontWeight.bold)
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _PERevisionDetailsController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsReorientation = value;
              });
            },),
          const SizedBox(height: 20),


                    const Divider(),
          const SizedBox(height: 20),


          const Text(
            'Projet pédagogique',
            style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Projet pédagogique (PP) (Article R227-25 du CASF)\n'
          'Le directeur de l\'accueil de mineurs met en oeuvre le projet éducatif dans un document élaboré en concertation avec les personnes qui assurent l\'animation de cet accueil. Il prend en considération l\'âge des mineurs accueillis. --accent\n'
          'Il précise notamment :\n'
          '- La nature des activités proposées, et, les conditions de mises en oeuvres des APS ;\n'
          '- La répartition des temps d\'activité et de repos ;\n'
          '- Les modalités de participation des mineurs ;\n'
          '- Le cas échéant, les mesures envisagées pour les mineurs atteints de troubles de la santé ou de handicaps ;\n'
          '- Les modalités de fonctionnement de l\'équipe ;\n'
          '- Les modalités d\'évaluation de l\'accueil ;\n'
          '- Les caractéristiques des locaux et des espaces utilisés.',
        ),
        const SizedBox(height: 10),
        const Text(
          'Le PP est-il en cohérence avec le projet éducatif ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _ppCoherenceController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPPCoherence = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Le PP prend-il en compte les caractéristiques des jeunes accueillis (âge, difficultés, fragilités, etc.) ? --accent',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _ppCharacteristicsController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPPCara = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Le PP a-il été élaboré en concertation avec les animateurs ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _ppElaborationController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPPConcertation = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Le PP indique-t-il les modalités d\'accueil (programme d\'activité, horaires coordonnés, restauration, tarifs, transports, locaux) ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _ppAccommodationController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPPModalite = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Le PP précise-t-il la nature des activités proposées ? Précise-t-il les conditions de mise en oeuvre des activités physiques et sportives ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _ppActivityDetailsController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPPNature = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Le PP précise-t-il la répartition respective des temps d\'activités et de repos des mineurs, notamment les temps de sommeil ? Comment les temps de repos sont-ils organisés ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _ppActivityDistributionController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPPRepartition = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Le directeur a-t-il pris des mesures pour assurer la sécurité la nuit ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _nightSecurityController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsSecuriteNuit = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Le PP précise-t-il les mesures envisagées pour les mineurs atteints de troubles de la santé ou de handicaps ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _ppHealthMeasuresController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPPSanteHandi = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Le PP intègre-t-il les modalités de fonctionnement de l\'équipe ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _ppTeamFunctioningController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPPFonctEquipe = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Le PP indique-t-il les modalités d\'évaluation de l\'accueil ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _ppEvaluationMethodsController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPPEvalAccueil = value;
                      });
                    },),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        const Text(
          'Activités',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Quelles sont les activités ? Sont-elles conduites en cohérence avec le projet éducatif et le projet pédagogique ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _observationsCoherenceController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsActivitesType = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Les activités sont-elles préparées en concertation avec l\'équipe d\'encadrement de l\'accueil lorsqu\'elles sont mises en oeuvre par des prestataires ne faisant pas partie de l\'équipe ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _activitiesPreparationController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsPrestataire = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Comment le choix des activités proposées est-il fait pour les mineurs ? Leur participation est-elle obligatoire ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _activitiesChoiceController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsActiviteMineur = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Les risques sont-ils systématiquement analysés ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _activitiesRisksAnalysisController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsRisques = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Des temps formalisés d\'échange entre les mineurs et les animateurs sont-ils organisés ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _activitiesExchangeController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsEchange = value;
                      });
                    },),
        const SizedBox(height: 10),
        const Text(
          'Des besoins de formations sont-ils exprimés ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        LongTextField(labelText: 'Observations', controller: _activitiesTrainingNeedsController,
                  onChanged: (value) {
                      setState(() {
                        widget.sansHData.observationsFormation = value;
                      });
                    },),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        SecuriteActivitesPhysiques(widget.sansHData),
        const SizedBox(height: 20),
        const Text(
          'Activités aquatiques (dans l’eau) et nautiques (sur l’eau)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        
        RadioGroup(
          title: 'Le test préalable a-t-il été ou sera-t-il réalisé préalablement aux éventuelles activités aquatiques et nautiques ?',
          referenceText:'Le test peut être réalisé par le titulaire d’une qualification pour l’encadrement dans les domaines du canoë-kayak et disciplines associées, nage en eau vive, voile, canyonisme, surf de mer et natation ou par une personne titulaire du BNSSA. Il peut également s’agir d’un test réalisé au sein d’une fédération ou de l’attestation scolaire « savoir-nager ». Le test peut être réalisé immédiatement avant l’activité nécessitant le test',
          choices: const ['OUI', 'NON', 'Ces activités ne sont pas organisées'],
          defaultChoice: widget.sansHData.radioAqua,
          onChanged: (value) {
            setState(() {
                        widget.sansHData.radioAqua = value;
                      });
          },
        ),
        
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        const Text(
          'Activités de plongée subaquatique, de vol libre ou de sport aérien',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
         // Séparateur horizontal
        const SizedBox(height: 20),

        RadioGroup(
          title: 'Le directeur dispose-t-il de l\'autorisation parentale et du certificat médical (non contre-indication) pour ces activités ?',
          choices: const ['OUI', 'NON', 'Ces activités ne sont pas organisées'],
          defaultChoice: widget.sansHData.radioAutorisations,
          onChanged: (value) {
            setState(() {
              widget.sansHData.radioAutorisations = value;
            });
          },
        ), 
        ],
      ),
    );
  }
}

class MiniBusSection extends StatefulWidget {
  final SansHModel sansHData;

  const MiniBusSection (this.sansHData, {super.key});

  @override
  _MiniBusSectionState createState() => _MiniBusSectionState();
}

class _MiniBusSectionState extends State<MiniBusSection > {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Préparation des déplacement en minibus',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
          ),

          const SizedBox(height: 20),  

          RadioGroup(
            title: "Les modalités d'utilisation du minibus apparaissent dans le projet pédagogique",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.sansHData.radioUtilisationMinibus,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioUtilisationMinibus = value;
              });
            },
          ),

          const SizedBox(height: 20),
          
          RadioGroup(
            title: "Les transports en commun sont privilégiés",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.sansHData.radioTransportsCommuns,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioTransportsCommuns = value;
              });
            },
          ),
         
          const SizedBox(height: 20),

          RadioGroup(
            title: "Pour les longs trajets des carnets de routes sont prévus",
            referenceText: "(itinéraire, temps de trajet, temps de pause, rotation des conducteurs). \n"
            "Pauses: impératives au moins toutes les deux heures et doivent durer minimum 15 minutes.",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.sansHData.radioCarnetsRoute,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioCarnetsRoute = value;
              });
            },
          ),

          const SizedBox(height: 20),

          RadioGroup(
            title: "Un temps est prévu pour s'assurer que les conducteurs connaissent les consignes de sécurité",
            referenceText: "Le conducteur doit s’assurer que tout passager âgé de moins de 18 ans qu'il transporte est maintenu soit par un système \n"
            "homologué de retenue pour enfant (UN R129 aussi appelé « i-Size »), soit par une ceinture de sécurité. \n"
            "Le transport sur un siège avant d’un enfant de moins de 10 ans est interdit sauf exceptions.",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.sansHData.radioConnaissanceSecurite,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioConnaissanceSecurite = value;
              });
            },
          ),

          const SizedBox(height: 20),

          RadioGroup(
            title: "S'assurer que le conducteur présente des qualités de conduite en sécurité",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.sansHData.radioQualiteConduite,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioQualiteConduite = value;
              });
            },
          ),

          const SizedBox(height: 20),

          RadioGroup(
            title: "L'organisateur et le directeur sont attentifs aux conditions de travail et à l'état de fatigue des animateurs.",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.sansHData.radioConditionsTravail,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioConditionsTravail = value;
              });
            },
          ),

          const SizedBox(height: 20),

        ],
      ),
    );
  }
}


class SixthSection extends StatefulWidget {
  final SansHModel sansHData;
  
  const SixthSection(this.sansHData, {super.key});
  
  @override
  _SixthSectionState createState() => _SixthSectionState();
}

class _SixthSectionState extends State<SixthSection> {
  final _vaccinationCertificateObservationsController = TextEditingController();
  final _medicalHistoryDocumentsObservationsController = TextEditingController();
  final _medicalTreatmentIdentificationObservationsController = TextEditingController();
  final _teamInformedAllergiesObservationsController = TextEditingController();
  final _medicinesStoredSecurelyObservationsController = TextEditingController();
  
  final _careRegisterUpdatedObservationsController = TextEditingController();
  final _firstAidKitsCompleteObservationsController = TextEditingController();
  final _emergencyCommunicationMeansObservationsController = TextEditingController();
  final _emergencyContactListAvailableObservationsController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
      _vaccinationCertificateObservationsController.text = widget.sansHData.observationsVaccination;
      _medicalHistoryDocumentsObservationsController.text = widget.sansHData.observationsAntecedents;
      _medicalTreatmentIdentificationObservationsController.text = widget.sansHData.observationsMineurTraitement;
      _teamInformedAllergiesObservationsController.text = widget.sansHData.observationsAllergies;
      _medicinesStoredSecurelyObservationsController.text = widget.sansHData.observationsOrdonnances;
      _careRegisterUpdatedObservationsController.text = widget.sansHData.observationsRegistreSoins;
      _firstAidKitsCompleteObservationsController.text = widget.sansHData.observationsPremierSoins;
      _emergencyCommunicationMeansObservationsController.text = widget.sansHData.observationsCommSecours;
      _emergencyContactListAvailableObservationsController.text = widget.sansHData.observationsNumUrgence;
  }

  @override
  void dispose() {
    _vaccinationCertificateObservationsController.dispose();
    _medicalHistoryDocumentsObservationsController.dispose();
    _medicalTreatmentIdentificationObservationsController.dispose();
    _teamInformedAllergiesObservationsController.dispose();
    _medicinesStoredSecurelyObservationsController.dispose();
    _careRegisterUpdatedObservationsController.dispose();
    _firstAidKitsCompleteObservationsController.dispose();
    _emergencyCommunicationMeansObservationsController.dispose();
    _emergencyContactListAvailableObservationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Documents ou éléments à vérifier',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
          ),
          const SizedBox(height: 20),          
          RadioGroup(
            title: 'Attestation de vaccination de chaque mineur',
            referenceText:'Réf. : Art. R. 227-8 CASF : « Les personnes qui participent à [un ACM] doivent produire, avant leur entrée en fonction, un document attestant qu\'elles ont satisfait aux obligations légales en matière de vaccination ». Il peut s’agir d’une copie des pages du carnet de santé relatives aux vaccinations, d’une copie du carnet de vaccinations, ou de l’attestation d\'un médecin.\n'
            'NB : les vaccinations obligatoires pour les mineurs nés jusqu’en 2017 sont la diphtérie, le tétanos et la poliomyélite (tous 3 réalisés à 2, 4 et 11 mois).NB : les vaccinations obligatoires pour les mineurs nés jusqu’en 2017 sont la diphtérie, le tétanos et la poliomyélite (tous 3 réalisés à 2, 4 et 11 mois).',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioVaccination,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioVaccination = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _vaccinationCertificateObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsVaccination = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Des documents justifient des antécédents médicaux ou chirurgicaux et des pathologies chroniques ou aigues en cours:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioAntecedents,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioAntecedents = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _medicalHistoryDocumentsObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsAntecedents = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Les mineurs faisant l\'objet d\'un traitement médical sont identifiés :',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioMineurTraitement,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioMineurTraitement = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _medicalTreatmentIdentificationObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsMineurTraitement = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'L\'équipe d\'animation est informée des éventuelles allergies :',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioAllergies,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioAllergies = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _teamInformedAllergiesObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsAllergies = value;
              });
            },),
          const SizedBox(height: 20),
          // Répéter la même structure pour les autres sous-titres
         
          RadioGroup(
            title: 'Les médicaments sont conservés avec les ordonnances dans un contenant fermé à clef (Sauf lorsque la nature du traitement impose que le médicament soit en permanence à la disposition de l’enfant):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioOrdonnances,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioOrdonnances = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _medicinesStoredSecurelyObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsOrdonnances = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Le registre des soins est tenu à jour:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioRegistreSoins,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioRegistreSoins = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _careRegisterUpdatedObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsRegistreSoins = value;
              });
            },),
          const SizedBox(height: 20),         
          
          RadioGroup(
            title: 'Les trousses de premiers soins sont complètes et à jour:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioPremierSoins,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioPremierSoins = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _firstAidKitsCompleteObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsPremierSoins = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Des moyens de communication permettant d\'alerter rapidement les secours sont mis à disposition du directeur et de l\'équipe:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioCommSecours,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioCommSecours = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _emergencyCommunicationMeansObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsCommSecours = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'La liste des numéros d\'urgence, des personnes et des organismes susceptibles d\'intervenir en cas d\'urgence est mise à disposition du directeur et de l\'équipe:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioNumUrgence,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioNumUrgence = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _emergencyContactListAvailableObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsNumUrgence = value;
              });
            },),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SeventhSection extends StatefulWidget {
  final SansHModel sansHData;
  
  const SeventhSection(this.sansHData, {super.key});
  
  @override
  _SeventhSectionState createState() => _SeventhSectionState();
}

class _SeventhSectionState extends State<SeventhSection> {

  final _lastSecurityCommissionOpinionObservationsController = TextEditingController();
  final _insuranceCertificateObservationsController = TextEditingController();
  final _effectiveSignageObservationsController = TextEditingController();
  final _evacuationExerciseObservationsController = TextEditingController();
  final _extinguishersUpToDateObservationsController = TextEditingController();
  final _smokeDetectorsPresentObservationsController = TextEditingController();
  final _intrusionExerciseObservationsController = TextEditingController();
  final _weatherAdaptedSpacesObservationsController = TextEditingController();
  final _generalHygieneConditionsObservationsController = TextEditingController();
  final _genderSeparateSanitaryFacilitiesObservationsController = TextEditingController();
  final _quietTimeAndNapAreaObservationsController = TextEditingController();
  final _adaptedIndoorOutdoorSpacesObservationsController = TextEditingController();

  @override
  void initState() {
    super.initState();
      _lastSecurityCommissionOpinionObservationsController.text = widget.sansHData.observationsCommissionSecu;
      _insuranceCertificateObservationsController.text = widget.sansHData.observationsAssurance;
      _effectiveSignageObservationsController.text = widget.sansHData.observationsSignaletique;
      _evacuationExerciseObservationsController.text = widget.sansHData.observationsEvacuation;
      _extinguishersUpToDateObservationsController.text = widget.sansHData.observationsExtincteur;
      _smokeDetectorsPresentObservationsController.text = widget.sansHData.observationsDetecteur;
      _intrusionExerciseObservationsController.text = widget.sansHData.observationsExercice;
      _weatherAdaptedSpacesObservationsController.text = widget.sansHData.observationsConditionsMeteo;
      _generalHygieneConditionsObservationsController.text = widget.sansHData.observationsHygiene;
      _genderSeparateSanitaryFacilitiesObservationsController.text = widget.sansHData.observationsSanitaire;
      _quietTimeAndNapAreaObservationsController.text = widget.sansHData.observationsSieste;
      _adaptedIndoorOutdoorSpacesObservationsController.text = widget.sansHData.observationsEspacesAdapte;
  }

  @override
  void dispose() {
    _lastSecurityCommissionOpinionObservationsController.dispose();
    _insuranceCertificateObservationsController.dispose();
    _effectiveSignageObservationsController.dispose();
    _evacuationExerciseObservationsController.dispose();
    _extinguishersUpToDateObservationsController.dispose();
    _smokeDetectorsPresentObservationsController.dispose();
    _intrusionExerciseObservationsController.dispose();
    _weatherAdaptedSpacesObservationsController.dispose();
    _generalHygieneConditionsObservationsController.dispose();
    _genderSeparateSanitaryFacilitiesObservationsController.dispose();
    _quietTimeAndNapAreaObservationsController.dispose();
    _adaptedIndoorOutdoorSpacesObservationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Documents ou éléments à vérifier',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Le directeur dispose du dernier avis de la commission de sécurité ou l\'attestation du maire certifiant de la conformité des locaux (incendie, accessibilité, etc.):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioCommissionSecu,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioCommissionSecu = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _lastSecurityCommissionOpinionObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsCommissionSecu = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Le directeur dispose de l\'attestation d\'assurance des locaux:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioAssurance,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioAssurance = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _insuranceCertificateObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsAssurance = value;
              });
            },),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Il existe une signalétique efficace pour renforcer la sécurité (éclairage de sécurité, plan d\'évacuation, etc.):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioSignaletique,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioSignaletique = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _effectiveSignageObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsSignaletique = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Un exercice d\'évacuation a été réalisé:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioEvacuation,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioEvacuation = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _evacuationExerciseObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsEvacuation = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les extincteurs sont à jour de leurs visites périodiques obligatoires:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioExtincteur,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioExtincteur = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _extinguishersUpToDateObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsExtincteur = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Des détecteurs avertisseurs autonomes de fumées ou un système d\'alarme sont présents:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioDetecteur,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioDetecteur = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _smokeDetectorsPresentObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsDetecteur = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Un exercice attentat-intrusion a été réalisé:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioExercice,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioExercice = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _intrusionExerciseObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsExercice = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les lieux d\'activités sont adaptés aux conditions climatiques:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioConditionsMeteo,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioConditionsMeteo = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _weatherAdaptedSpacesObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsConditionsMeteo = value;
              });
            },),

         
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les conditions générales d\'hygiène et de sécurité des locaux sont satisfaisantes:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioHygiene,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioHygiene = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _generalHygieneConditionsObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsHygiene = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Il y a suffisamment de sanitaires pour permettre une utilisation distincte entre garçons et filles:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioSanitaire
            ,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioSanitaire = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _genderSeparateSanitaryFacilitiesObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsSanitaire = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les locaux permettent l\'organisation de temps calmes et, le cas échéant, de la sieste (notamment pour les moins de 6 ans):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioSieste,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioSieste = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _quietTimeAndNapAreaObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsSieste = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les espaces intérieurs et extérieurs sont adaptés et aménagés (zones ombragées, zones d\'activités et zones calmes, etc):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioEspacesAdapte,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioEspacesAdapte = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _adaptedIndoorOutdoorSpacesObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsEspacesAdapte = value;
              });
            },),
        ],
      ),
    );
  }
}

class EighthSection extends StatefulWidget {
  final SansHModel sansHData;
  
  const EighthSection(this.sansHData, {super.key});
  
  @override
  _EighthSectionState createState() => _EighthSectionState();
}

class _EighthSectionState extends State<EighthSection> {
  final _cleanKitchenObservationsController = TextEditingController();
  final _cleanDiningRoomObservationsController = TextEditingController();
  final _foodSamplesRetentionObservationsController = TextEditingController();
  final _productTraceabilityObservationsController = TextEditingController();
  final _foodStorageObservationsController = TextEditingController();
  final _refrigeratorWithThermometerObservationsController = TextEditingController();
  final _picnicEquipmentObservationsController = TextEditingController();

  @override
  void initState() {
    super.initState();
      _cleanKitchenObservationsController.text = widget.sansHData.observationsCuisine;
      _cleanDiningRoomObservationsController.text = widget.sansHData.observationsSalleResto;
      _foodSamplesRetentionObservationsController.text = widget.sansHData.observationsPlatsTemoins;
      _productTraceabilityObservationsController.text = widget.sansHData.observationsTracabilite;
      _foodStorageObservationsController.text = widget.sansHData.observationsStockage;
      _refrigeratorWithThermometerObservationsController.text = widget.sansHData.observationsRefrigerateur;
      _picnicEquipmentObservationsController.text = widget.sansHData.observationsPiqueNique;
  }

  @override
  void dispose() {
    _cleanKitchenObservationsController.dispose();
    _cleanDiningRoomObservationsController.dispose();
    _foodSamplesRetentionObservationsController.dispose();
    _productTraceabilityObservationsController.dispose();
    _foodStorageObservationsController.dispose();
    _refrigeratorWithThermometerObservationsController.dispose();
    _picnicEquipmentObservationsController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Cuisine en état et propre:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioCuisine,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioCuisine = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _cleanKitchenObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsCuisine = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Salle de restauration entretenue et propre:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioSalleResto,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioSalleResto = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _cleanDiningRoomObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsSalleResto = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Conservation des plats témoins (minimum 100g par plat) pendant 5 jours:',
            referenceText: 'NB :\n'
            '•	Les plats témoins doivent être représentatifs des repas servis.\n'
            '•	Ce doit être réalisé systématiquement pour les cuisines autonomes et facultativement pour les cuisines satellites.',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioPlatsTemoins,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioPlatsTemoins = value;
              });
            },
          ),
          const SizedBox(height: 20),
          LongTextField(labelText: 'Observations', controller: _foodSamplesRetentionObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsPlatsTemoins = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Conservation de la traçabilité des produits consommés (type de produit, n° de lot, lieux d\'achat, date de consommation, type de préparation, etc.):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioTracabilite,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioTracabilite = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _productTraceabilityObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsTracabilite = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Stockage des denrées (à l\'abri de la chaleur et de l\'humidité dans des contenants fermés):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioStockage,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioStockage = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _foodStorageObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsStockage = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Réfrigérateur avec thermomètre (de 0° à +4°):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioRefrigerateur,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioRefrigerateur = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _refrigeratorWithThermometerObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsRefrigerateur = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Si pique-nique à l\'extérieur : glaciaire avec plaques eutectiques (ou bouteilles d\'eau congelées):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioPiqueNique,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioPiqueNique = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _picnicEquipmentObservationsController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.observationsPiqueNique = value;
              });
            },),
        ],
      ),
    );
  }
}

class NinthSection extends StatefulWidget {
  final SansHModel sansHData;
  
  const NinthSection(this.sansHData, {super.key});
  
  @override
  _NinthSectionState createState() => _NinthSectionState();
}

class _NinthSectionState extends State<NinthSection> {
  final _internalManagementPlanController = TextEditingController();
  final  _weatherForecastMonitoringController = TextEditingController();
  final _heatStrokePreventionController = TextEditingController();
  final _buildingAndEquipmentCheckController = TextEditingController();
  final _coolRoomSetUpController = TextEditingController();
  final _ventilatorsOrMistersController = TextEditingController();
  final _thermometersInEachRoomController = TextEditingController();
  final _hydrationAndAdaptedMenusController = TextEditingController();
  final _potableWaterReservesCheckController = TextEditingController();
  final _shadeAndAdaptedActivitiesController = TextEditingController();
  final _refreshmentMethodsController = TextEditingController();
  final _covid19BarriersCompatibilityController = TextEditingController();
  final _postEventAnalysisController = TextEditingController();

  @override
  void initState() {
    super.initState();
      _internalManagementPlanController.text = widget.sansHData.observationsGestion;
      _weatherForecastMonitoringController.text = widget.sansHData.observationsVeille;
      _heatStrokePreventionController.text = widget.sansHData.observationsPreventionChaleur;
      _buildingAndEquipmentCheckController.text = widget.sansHData.observationsEquipement;
      _coolRoomSetUpController.text = widget.sansHData.observationsPieceFraiche;
      _ventilatorsOrMistersController.text = widget.sansHData.observationsVentilateurs;
      _thermometersInEachRoomController.text = widget.sansHData.observationsThermo;
      _hydrationAndAdaptedMenusController.text = widget.sansHData.observationsEauMenus;
      _potableWaterReservesCheckController.text = widget.sansHData.observationsReserves;
      _shadeAndAdaptedActivitiesController.text = widget.sansHData.observationsOmbre;
      _refreshmentMethodsController.text = widget.sansHData.observationsRafraichissement;
      _covid19BarriersCompatibilityController.text = widget.sansHData.observationsGesteBarriere;
      _postEventAnalysisController.text = widget.sansHData.observationsGestionPosteriori;
  }

  @override
  void dispose() {
    _internalManagementPlanController.dispose();
    _weatherForecastMonitoringController.dispose();
    _heatStrokePreventionController.dispose();
    _buildingAndEquipmentCheckController.dispose();
    _coolRoomSetUpController.dispose();
    _ventilatorsOrMistersController.dispose();
    _thermometersInEachRoomController.dispose();
    _hydrationAndAdaptedMenusController.dispose();
    _potableWaterReservesCheckController.dispose();
    _shadeAndAdaptedActivitiesController.dispose();
    _refreshmentMethodsController.dispose();
    _covid19BarriersCompatibilityController.dispose();
    _postEventAnalysisController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          RadioGroup(
            title: 'Un plan de gestion interne et d\'adaptation de l\'organisation a été élaboré préalablement. Un responsable est désigné:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioGestion,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioGestion = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _internalManagementPlanController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsGestion = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Une veille des prévisions météorologiques et des courriels est assurée:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioVeille,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioVeille = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _weatherForecastMonitoringController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsVeille = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les mesures de prévention et les symptômes de coup de chaleur sont connus des membres de l\'équip:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioPreventionChaleur,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioPreventionChaleur = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _heatStrokePreventionController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsPreventionChaleur = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les bâtiments et équipements (stores, volets, dispositifs occultants, système de rafraîchissement, réfrigérateur, congélateur) ont été vérifiés:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioEquipement,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioEquipement = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _buildingAndEquipmentCheckController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsEquipement = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'L\'aménagement spécifique d\'une pièce plus fraîche a été envisagé et mis en place si possible:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioPieceFraiche,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioPieceFraiche = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _coolRoomSetUpController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.observationsPieceFraiche = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'L\'accueil dispose de ventilateurs ou brumisateurs:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioVentilateurs,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioVentilateurs = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _ventilatorsOrMistersController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsVentilateurs = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Un thermomètre a été placé dans chaque pièce:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioThermo,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioThermo = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _thermometersInEachRoomController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsThermo = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les mineurs boivent régulièrement et les menus sont adaptés (eau, fruits frais, légumes verts, yaourts, etc.):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioEauMenus,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioEauMenus = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _hydrationAndAdaptedMenusController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsEauMenus = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les réserves d\'eau potable ont été vérifiées:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioReserves,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioReserves = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _potableWaterReservesCheckController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsReserves = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les mineurs sont à l\'ombre aux heures les plus chaudes de la journée. Les sorties (intérieur/extérieur) et les activités sont adaptées en évitant les efforts intenses:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioOmbre,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioOmbre = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _shadeAndAdaptedActivitiesController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsOmbre = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les mineurs sont rafraîchis (douches, aspersions, etc.) en évitant les eaux trop froides. Les brumisateurs collectifs qui émettent un flux ascendant depuis le sol et/ou un flux latéral sont interdits temporairement, pendant la période de circulation de la Covid-19:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioRafraichissement,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioRafraichissement = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _refreshmentMethodsController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsRafraichissement = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Le directeur et l\'équipe d\'animation ont connaissance que les gestes barrières liés à la Covid-19 ne sont pas incompatibles avec les actions recommandées en cas de canicule:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioGesteBarriere,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioGesteBarriere = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _covid19BarriersCompatibilityController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsGesteBarriere = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'A postériori, analyser la gestion de l\'évènement et améliorer le plan de gestion interne:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.sansHData.radioGestionPosteriori,
            onChanged: (value) {
              setState(() {
                widget.sansHData.radioGestionPosteriori = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _postEventAnalysisController,onChanged: (value) {
              setState(() {
                widget.sansHData.observationsGestionPosteriori = value;
              });
            },),
        ],
      ),
    );
  }
}

class TenthSection extends StatefulWidget {
  final SansHModel sansHData;
  
  const TenthSection(this.sansHData, {super.key});
  
  @override
  _TenthSectionState createState() => _TenthSectionState();
}

class _TenthSectionState extends State<TenthSection> {


  final _generalAppreciationController = TextEditingController();
  final _prescriptionsEcheancesController = TextEditingController();
  final _nameOfControllerController = TextEditingController();
  final _prescriptionDateController = TextEditingController();
  

  @override
  void initState() {
    super.initState();
      _generalAppreciationController.text = widget.sansHData.appreciationGenerale;
      _prescriptionsEcheancesController.text = widget.sansHData.prescriptionsEcheances;
      _nameOfControllerController.text = widget.sansHData.controllerName;
      _prescriptionDateController.text = widget.sansHData.dateDuControle.toString();
      widget.sansHData.prescriptionAuthoritySignatureController.points = widget.sansHData.signatureAuthorite;
  }

  @override
  void dispose() {
    _generalAppreciationController.dispose();
    _prescriptionsEcheancesController.dispose();
    _nameOfControllerController.dispose();
    _prescriptionDateController.dispose();
    widget.sansHData.prescriptionAuthoritySignatureController.dispose();
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          const SizedBox(height: 20),
          LongTextField(labelText: 'Appréciation Générale', controller: _generalAppreciationController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.appreciationGenerale = value;
              });
            },),

          const SizedBox(height: 20),
          LongTextField(labelText:'PRESCRIPTIONS ET ECHEANCES LAISSEES POUR LEUR MISE EN OEUVRE',
          controller: _prescriptionsEcheancesController,
          onChanged: (value) {
              setState(() {
                widget.sansHData.prescriptionsEcheances = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CheckboxGroup(
            title: 'Copie transmise:',
            choices: const [
              'à la caisse d\'allocations familiales (Caf) de la Vienne',
              'au service PMI du conseil départemental de la Vienne',
              'à la DDPP de la Vienne',
              'au SDJES du département d\'origine'
            ],
            defaultChoices: widget.sansHData.copyToTest.split(','),
            onChanged: (value) {
              setState(() {
                widget.sansHData.copyToTest = value.join(',');
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(labelText: 'Contrôle effectué par:', controller: _nameOfControllerController,
            onChanged: (value) {
              setState(() {
                widget.sansHData.controllerName = value;
              });
            },),
          const SizedBox(height: 20),
          DateField(
            labelText: 'A Poitiers, le ',
            controller: _prescriptionDateController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.sansHData.dateDuControle = selectedDate;
              });
            },
          ),
          const SizedBox(height: 20),
          //CustomTextField(labelText: 'Signature de l\'autorité', controller: widget.sansHData.prescriptionAuthoritySignatureController),
          const Text(
            'Signature de l\'autorité',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black), // Bordure noire
              borderRadius: BorderRadius.circular(10.0), // Bords ronds
            ),
            padding: const EdgeInsets.all(8.0),
            height: 200.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                Expanded(
                  child: Signature(
                    controller: widget.sansHData.prescriptionAuthoritySignatureController,
                    backgroundColor: Colors.white,
                    // Ajoutez d'autres propriétés selon vos besoins
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    widget.sansHData.prescriptionAuthoritySignatureController.clear();
                    widget.sansHData.signatureAuthorite = [];
                    widget.sansHData.signatureAuthoriteJSON = [];
                  },
                  child: const Icon(Icons.clear),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//___________________________GESTION_ACTIVITES____________________________________//


class SecuriteActivitesPhysiques extends StatefulWidget {
  final SansHModel sansHData;

  const SecuriteActivitesPhysiques(this.sansHData, {super.key});

  @override
  _SecuriteActivitesPhysiquesState createState() =>
      _SecuriteActivitesPhysiquesState();
}

class _SecuriteActivitesPhysiquesState extends State<SecuriteActivitesPhysiques> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Sécurité des activités physiques et sportives',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.sansHData.activitesSecu.length,
                itemBuilder: (context, index) {
                  return ActiviteItem(
                    activiteData: widget.sansHData.activitesSecu[index],
                    onDelete: () {
                      setState(() {
                        widget.sansHData.activitesSecu.removeAt(index);
                      });
                    },
                    onUpdate: (updatedActivite) {
                      setState(() {
                        widget.sansHData.activitesSecu[index] = updatedActivite;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.sansHData.activitesSecu.add(objectbox.ActiviteData()); // Ajouter une nouvelle activité
                  });
                },
                child: const Text('Ajouter une activité'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ActiviteItem extends StatelessWidget {
  final objectbox.ActiviteData activiteData;
  final Function onDelete;
  final Function(objectbox.ActiviteData) onUpdate;

  const ActiviteItem({super.key, 
    required this.activiteData,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nom de l\'activité proposée'),
              initialValue: activiteData.nomActivite,
              onChanged: (value) {
                activiteData.nomActivite = value;
                onUpdate(activiteData);
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(labelText: 'Catégorie de l\'activité'),
              value: activiteData.categorie,
              items: const [
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Catégorie 1'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('Catégorie 2'),
                ),
                DropdownMenuItem<int>(
                  value: 3,
                  child: Text('Catégorie 3'),
                ),
              ],
              onChanged: (value) {
                //setState(() {
                  activiteData.categorie = value ?? 1;
                  onUpdate(activiteData);
                //});
              },
            ),
            const SizedBox(height: 20),
            // Catégorie 1
            if (activiteData.categorie == 1) ...[
            const Text('Etape 1',style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 20),
              CheckboxGroup(
                title: 'L’activité proposée est:',
                referenceText : 'NB : \n'
                '* seule une des 3 cases est à cocher\n'
                '* Il faut raisonner de la manière suivante : d’abord vérifier s’il s’agit d’une activité en annexe de l’arrêté de 2012 ; puis, si ce n’est pas le cas, vérifier s’il s’agit d’une activité physique ou sportive en fonction des critères ci-contre.',
                choices: const ['Une activité figurant en annexe de l’arrêté du 25 avril 2012', 
                'Une activité physique répondant aux critères cumulatifs suivants :\n'
                '* elle ne présente pas de risque spécifique ;\n'
                '* elle a une finalité ludique, récréative ou liée à la nécessité de se déplacer ;\n'
                '* elle est proposée sans objectif d’acquisition d’un niveau technique ni de performance ;\n'
                '* sa pratique n’est pas intensive ;\n'
                '* dans les accueils de loisirs, elle n’est pas exclusive d’autres activités ;\n'
                '* elle est accessible à l’ensemble des membres du groupe ;\n'
                '* elle est mise en œuvre dans des conditions de pratique et d’environnement adaptées au public en fonction de ses caractéristiques.',
                'Une activité sportive (ne répondant pas à l’un des critères permettant de qualificatif d’une activité physique)'],
                defaultChoices: activiteData.typeActivite,
                onChanged: (value) {
                  activiteData.typeActivite = value;
                  onUpdate(activiteData);
                },
                
              ),
            ],
            // Catégorie 2
            if (activiteData.categorie == 2) ...[
              const Text('Etape 2 (le cas échéant)',style: TextStyle(fontWeight: FontWeight.bold),),
              const Text('Dans le cas où il s’agit d’une activité figurant en annexe de l’arrêté de 2012 ou d’une activité sportive : ',style: TextStyle(fontWeight: FontWeight.bold),),
              const Text('NB :\n'
                   '* une activité figurant en annexe de l’arrêté de 2012 ou une activité sportive doit être encadrée par un animateur ou intervenant disposant d’une qualification idoine.\n'
                   '* une simple activité physique peut être encadrée par tout animateur titulaire.',style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 20),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Nom/prenom de l\'encadrant'),
                initialValue: activiteData.encadrantNomPrenom2 ?? '',
                onChanged: (value) {
                  activiteData.encadrantNomPrenom2 = value;
                  onUpdate(activiteData);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    labelText:
                        'Qualification permettant l’encadrement de l’activité'),
                initialValue: activiteData.encadrantQualif2 ?? '',
                onChanged: (value) {
                  activiteData.encadrantQualif2 = value;
                  onUpdate(activiteData);
                },
              ),
            ],
            // Catégorie 3
            if (activiteData.categorie == 3) ...[
              const Text('Etape 2 (le cas échéant)',style: TextStyle(fontWeight: FontWeight.bold),),
              const Text('Dans le cas où il s’agit d’une activité figurant en annexe de l’arrêté de 2012 ou d’une activité sportive : ',style: TextStyle(fontWeight: FontWeight.bold),),
              const Text('NB :\n'
                   '* une activité figurant en annexe de l’arrêté de 2012 ou une activité sportive doit être encadrée par un animateur ou intervenant disposant d’une qualification idoine.\n'
                   '* une simple activité physique peut être encadrée par tout animateur titulaire.',style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 20),
              const Text('Si l’activité est organisée via une prestation (à titre onéreux ou gratuit)',style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline,)),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Dénomination de l’établissement d’activité physique ou sportive réalisant la prestation:'),
                initialValue: activiteData.denominationPrestataire ?? '',
                onChanged: (value) {
                  activiteData.denominationPrestataire = value;
                  onUpdate(activiteData);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Nom/prenom de l\'encadrant'),
                initialValue: activiteData.encadrantNomPrenom3 ?? '',
                onChanged: (value) {
                  activiteData.encadrantNomPrenom3 = value;
                  onUpdate(activiteData);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    labelText:
                        'Qualification permettant l’encadrement de l’activité:'),
                initialValue: activiteData.encadrantQualif3 ?? '',
                onChanged: (value) {
                  activiteData.encadrantQualif3 = value;
                  onUpdate(activiteData);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Si vérification, numero de la carte professionnelle:'),
                initialValue: activiteData.numCartePro ?? '',
                onChanged: (value) {
                  activiteData.numCartePro = value;
                  onUpdate(activiteData);
                },
              ),
            ],
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                onDelete(); // Supprimer l'activité
              },
              child: const Text('Supprimer'),
            ),
          ],
        ),
      ),
    );
  }
}