// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Menus/FormsList.dart';
import 'package:flutter_application_2/Menus/Home.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_application_2/components/my_textfields.dart';


void main() {
  runApp(const Scout());
}

class Scout extends StatefulWidget {
  const Scout({super.key});

  @override
  _ScoutState createState() => _ScoutState();
}

class _ScoutState extends State<Scout> {
  // Créez une instance de ScoutData
  final ScoutData _scoutData = ScoutData();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulaire à 10 sections',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(scoutData: _scoutData), // Passez _scoutData à FirstPage
    );
  }
}

class ScoutData {
  //1ere section
  String visiteRealiseePar = '',enPresenceDe = '',
    //Section 2
// Section 2
  typeSejour = '',
  mouvementOrganisateur = '',
  nomCoordonnees = '',
  lieuVisiteNomAdresse = '',
  lieuVisiteTel = '',
  lieuVisitePointsEtape = '',
  copieDeclaration = '',
  diplomesEncadrement = '',
  attestationsVaccination = '',
  attestationAssurance = '',
  registrePresence = '',
  autorisationParents = '',
  affichageUrgence = '',
  fichesSanitaires = '',
  radioTypeSejour = '',
  radioMouvementOrganisateur = '',
  radioCopieDeclaration = '',
  radioDiplomesEncadrement = '',
  radioAttestationsVaccination = '',
  radioAttestationAssurance = '',
  radioRegistrePresence = '',
  radioAutorisationParents = '',
  radioAffichageUrgence = '',
  radioFichesSanitaires = '',




  denomination = '',adresse = '',lieu = '',
  numeroDeclaration = '',radioTypeAccueil = '',radio227_5 = '',radio227_29 = '',
  observations227_5 = '',observations227_29 = '',
  capaciteAccueil = '',
  radioMixite = '', radioPatrouilles = '',
  entre6_8AnsPresents = '',entre8_11AnsPresents = '',entre12_14AnsPresents = '',
  entre14_17AnsPresents = '',entre17_19AnsPresents = '',
  entre6_8AnsHandi = '',entre8_11AnsHandi = '',entre12_14AnsHandi = '',
  entre14_17AnsHandi = '',entre17_19AnsHandi = '',
  effectifs6_13 = '', effectifs14_17 = '',

  totalPresents = '',totalHandi = '',
  radio2324_13 = '',radio2324_14  = '',
  observations2324_13 = '',observations2324_14  = '',
  radioRegistreMineur = '', observationsRegistreMineur = '',




  directeurNom = '',directeurPrenom = '',directeurQualification = '',
  radioTitulaireStagiaire = '',
  nombreAnimQualif = '',nombreAnimStagiaires = '', nombreAnimNonQualif = '',totalAnim = '',
  encadrementRequisMoinsDe6 = '',encadrementRequisPlusDe6 = '', totalAnimRequis = '',
  radio227_2 = '', observations227_2 = '', 
  radioArrete3_5 = '', observationsArrete3_5 = '',
  radio9_02_07 = '', observations9_02_07 = '',
  radio227_8 = '', observations227_8 = '',
  observationsCommunicationOrganisateur = '', observationsSavoirComportement = '',
  observationsQualifPersonnel = '', observationsTempsDePrep = '', observationsReuBilan = '',
  observationsEvalStg = '', 
  
  radioProjEdu = '',observationsProjEdu = '',
  radioProjPeda = '',observationsProjPeda = '',radioRepresentant = '',
  observationsRepresentant = '',observationsPE = '',observationsMoyens = '',
  observationsMoyensEquipe = '',observationsBudget = '',observationsOrientation = '',
  observationsDiagnostic = '',
  observationsPolitique = '',observationsReorientation = '',
  observationsPPCoherence = '',
  observationsPPCara = '',observationsPPConcertation = '',
  observationsPPModalite = '',observationsPPNature = '',observationsPPRepartition = '',
  observationsSecuriteNuit = '',observationsPPSanteHandi = '',
  observationsPPFonctEquipe = '',observationsPPEvalAccueil = '',observationsActivitesType = '',
  observationsPrestataire = '',
  observationsActiviteMineur = '',observationsRisques = '',observationsEchange = '',
  observationsFormation = '',
  radioEtape1 = '', 
  radioEape2 = '',
  nomPrenomEncadrantACM = '', qualifACM = '',
  nomPrenomEncadrantGratuit = '', qualifgratuit = '', 
  numeroCartePro = '',
  radioAqua = '',
  radioAutorisations = '',

  //SECTION 5 
  identificationRisques = '',
  moyensPrevention = '',
  identificationlieu ='',

    //SECTION 6

ordonnancesTraitements = '',
registreInfirmerie = '',
contenuTrousseSecours = '',
troussesPremierSecours = '',
lieuIsolement = '',
assistantSanitaire = '',
douchesCommentaires = '',
douches = '',
toilettesCommentaires = '',
toilettes = '',
respectMarcheAvant = '',
traitementDechets = '',
conservationRepas = '',
releveTemperatures = '',
refrigerateur = '',
conservationDenrees = '',
tableFeu = '',
cuisine = '',
couchagesDetails = '',
couchages = '',


  //Section 7
modalitesMiseOeuvre = '',
modalitesPreparationEquipe = '',
lienProjetEducatif = '',
modalitesParticipation = '',
repartitionTemps = '',
activitesPhysiques = '',
activitesSportives = '',
observations = '',




  //Section 8
modalitesPreparationAutonomie = '',
coordinationCommunication = '',
modalitesKeyPoints = '',
commentairesExplo = '',
radioExplo = '',
  
  //Section 9
preparationAutonomie = '',
pointsEtape = '',

bilan = '';




  DateTime dateVisite = DateTime(2001, 1, 1), startDate = DateTime(2001, 1, 1),endDate = DateTime(2001, 1, 1), dateRenouvellement = DateTime(2001, 1, 1),dateDebutFormation = DateTime(2001, 1, 1),dateStartDerogation = DateTime(2001, 1, 1),dateEndDerogation = DateTime(2001, 1, 1), dateDebutSejour = DateTime(2001, 1, 1), dateFinSejour = DateTime(2001, 1, 1);
  List<String> copyTo = [], copieA = [],destinataireRapport = [], suitesRapport = [];
  List<Point> signatureAuthorite = [];

}

class MyFormContent {
  final List<String> sectionTitles;

  ScoutData  scoutData;

  MyFormContent(this.sectionTitles, this.scoutData);

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
          minHeight: 9,
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
                if (currentStep == 0) FirstSection(scoutData),
                if (currentStep == 1) SecondSection(scoutData),
                if (currentStep == 2) ThirdSection(scoutData),
                if (currentStep == 3) FourthSection(scoutData),
                if (currentStep == 4) FifthSection(scoutData),
                if (currentStep == 5) SixthSection(scoutData),
                if (currentStep == 6) SeventhSection(scoutData),
                if (currentStep == 7) EighthSection(scoutData),
                if (currentStep == 8) NinthSection(scoutData),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FirstPage extends StatefulWidget {
  final ScoutData scoutData; // Ajoutez une référence à ScoutData

  const FirstPage({super.key, required this.scoutData}); // Ajoutez un constructeur

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentStep = 0;
  List<String> sectionTitles = [
    'Information relatives à la visite',
    'Identification du séjour',
    'Effectif de mineurs',
    'Equipe d\'encadrants',
    'Hygiène et sécurité',
    'Gestion Matérielle',
    'Education et pédagogie',
    'Exploration',
    'Bilan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FICHE DE VISITE D’UN  ACCUEIL DE SCOUTISME"),
      ),
      body: SingleChildScrollView(
        child: MyFormContent(sectionTitles, widget.scoutData).buildFormContent(_currentStep),
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
              onPressed: () {
                // Logique à exécuter lorsque l'utilisateur termine le formulaire
                // Par exemple, sauvegardez les données du formulaire ou naviguez vers une autre page
                DataSaver dataSaver = DataSaver();
                dataSaver.saveDataToFile(widget.scoutData);
                //print(widget.scoutData.visiteRealiseePar);
                //print(widget.scoutData.directeurQualification);
                //print(widget.scoutData.totalAnim);
              },
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
}

//___________________________SECTIONS______________________________________//

class FirstSection extends StatefulWidget {
  final ScoutData scoutData;
  const FirstSection(this.scoutData, {super.key});

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
    _visiteRealiseeParController.text = widget.scoutData.visiteRealiseePar; // Affiche la valeur initiale
    _enPresenceDeController.text = widget.scoutData.enPresenceDe;
    _dateVisiteController.text = DateFormat('dd/MM/yyyy').format(widget.scoutData.dateVisite);
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
                widget.scoutData.visiteRealiseePar = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'En présence de :',
            controller: _enPresenceDeController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.enPresenceDe = value;
              });            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Date de la visite :',
            controller: _dateVisiteController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.scoutData.dateVisite = selectedDate;
              });            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SecondSection extends StatefulWidget {
  final ScoutData scoutData;
  const SecondSection(this.scoutData, {super.key});
  
  @override
  _SecondSectionState createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  final _typeSejourController = TextEditingController();
  final _mouvementOrganisateurController = TextEditingController();
  final _nomCoordonneesController = TextEditingController();
  final _lieuVisiteNomAdresseController = TextEditingController();
  final _lieuVisiteTelController = TextEditingController();
  final _lieuVisitePointsEtapeController = TextEditingController();
  final _copieDeclarationController = TextEditingController();
  final _diplomesEncadrementController = TextEditingController();
  final _attestationsVaccinationController = TextEditingController();
  final _attestationAssuranceController = TextEditingController();
  final _registrePresenceController = TextEditingController();
  final _autorisationParentsController = TextEditingController();
  final _affichageUrgenceController = TextEditingController();
  final _fichesSanitairesController = TextEditingController();
  final _dateDebutSejourController = TextEditingController();
  final _numeroDeclarationController =TextEditingController();
  final _dateFinSejourController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _typeSejourController.text = widget.scoutData.typeSejour;
    _mouvementOrganisateurController.text = widget.scoutData.mouvementOrganisateur;
    _nomCoordonneesController.text = widget.scoutData.nomCoordonnees;
    _lieuVisiteNomAdresseController.text = widget.scoutData.lieuVisiteNomAdresse;
    _lieuVisiteTelController.text = widget.scoutData.lieuVisiteTel;
    _lieuVisitePointsEtapeController.text = widget.scoutData.lieuVisitePointsEtape;
    _copieDeclarationController.text = widget.scoutData.copieDeclaration;
    _diplomesEncadrementController.text = widget.scoutData.diplomesEncadrement;
    _attestationsVaccinationController.text = widget.scoutData.attestationsVaccination;
    _attestationAssuranceController.text = widget.scoutData.attestationAssurance;
    _registrePresenceController.text = widget.scoutData.registrePresence;
    _autorisationParentsController.text = widget.scoutData.autorisationParents;
    _affichageUrgenceController.text = widget.scoutData.affichageUrgence;
    _fichesSanitairesController.text = widget.scoutData.fichesSanitaires;
    _dateDebutSejourController.text = DateFormat('dd/MM/yyyy').format(widget.scoutData.dateDebutSejour);
    _dateFinSejourController.text = DateFormat('dd/MM/yyyy').format(widget.scoutData.dateFinSejour);
  }

  @override
  void dispose() {
    _typeSejourController.dispose();
    _mouvementOrganisateurController.dispose();
    _nomCoordonneesController.dispose();
    _lieuVisiteNomAdresseController.dispose();
    _lieuVisiteTelController.dispose();
    _lieuVisitePointsEtapeController.dispose();
    _copieDeclarationController.dispose();
    _diplomesEncadrementController.dispose();
    _attestationsVaccinationController.dispose();
    _attestationAssuranceController.dispose();
    _registrePresenceController.dispose();
    _autorisationParentsController.dispose();
    _affichageUrgenceController.dispose();
    _fichesSanitairesController.dispose();
    _dateDebutSejourController.dispose();
    _numeroDeclarationController.dispose();
    _dateFinSejourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RadioGroup(
            title: 'Type de séjour :',
            //controller: _typeSejourController,
            defaultChoice : widget.scoutData.typeSejour,
            choices: const ['Accueil de scoutisme','Séjour de vacances (association non affiliée)'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.typeSejour = value;
              });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Date de début de séjour :',
            controller: _dateDebutSejourController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.scoutData.dateDebutSejour = selectedDate;
              });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Date de fin de séjour :',
            controller: _dateFinSejourController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.scoutData.dateFinSejour = selectedDate;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Numéro de déclaration :',
            controller: _numeroDeclarationController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.numeroDeclaration = value;
              });
            },
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Mouvement organisateur de l\'accueil :',
            defaultChoice: widget.scoutData.radioMouvementOrganisateur,
            choices: const [
              'Éclaireuses et éclaireurs de la nature (EDLN)',
              'Éclaireuses et éclaireurs de France (EEDF)',
              'Éclaireuses et éclaireurs israélites de France (EEIF)',
              'Éclaireuses et éclaireurs unionistes de France (EEUDF)',
              'Éclaireurs neutres de France (ENF)',
              'Fédération des éclaireuses et éclaireurs (FEE)',
              'Guides et scouts d\'Europe (GSE)',
              'Scouts et guides de France (SGDF)',
              'Scouts musulmans de France (SMF)',
              'Scouts unitaires de France (SUF)'
            ],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioMouvementOrganisateur = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Nom et coordonnées du groupe rencontré :',
            controller: _nomCoordonneesController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.nomCoordonnees = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Nom et adresse :',
            controller: _lieuVisiteNomAdresseController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.lieuVisiteNomAdresse = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Tél lieu d\'accueil :',
            controller: _lieuVisiteTelController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.lieuVisiteTel = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Points d\'étape si séjour itinérant :',
            controller: _lieuVisitePointsEtapeController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.lieuVisitePointsEtape = value;
              });
            },
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Copie du récépissé de déclaration de séjour',
            defaultChoice: widget.scoutData.radioCopieDeclaration,
            choices: const ['OUI', 'NON', 'A transmettre'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioCopieDeclaration = value;
              });
            },
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Diplômes de l\'équipe d\'encadrement',
            defaultChoice: widget.scoutData.radioDiplomesEncadrement,
            choices: const ['OUI', 'NON', 'A transmettre'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioDiplomesEncadrement = value;
              });
            },
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Attestations de vaccination de l\'équipe d\'encadrement',
            defaultChoice: widget.scoutData.radioAttestationsVaccination,
            choices: const ['OUI', 'NON', 'A transmettre'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioAttestationsVaccination = value;
              });
            },
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Attestation d\'assurance (Responsabilité civile)',
            defaultChoice: widget.scoutData.radioAttestationAssurance,
            choices: const ['OUI', 'NON', 'A transmettre'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioAttestationAssurance = value;
              });
            },
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Registre de présence des enfants présents',
            defaultChoice: widget.scoutData.radioRegistrePresence,
            choices: const ['OUI', 'NON', 'A transmettre'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioRegistrePresence = value;
              });
            },
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Autorisation des parents pour l\'autonomie',
            defaultChoice: widget.scoutData.radioAutorisationParents,
            choices: const ['OUI', 'NON', 'A transmettre'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioAutorisationParents = value;
              });
            },
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Affichage des numéros d\'urgence',
            defaultChoice: widget.scoutData.radioAffichageUrgence,
            choices: const ['OUI', 'NON', 'A transmettre'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioAffichageUrgence = value;
              });
            },
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Fiches sanitaires complètes',
            defaultChoice: widget.scoutData.radioFichesSanitaires,
            choices: const ['OUI', 'NON', 'A transmettre'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioFichesSanitaires = value;
              });
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ThirdSection extends StatefulWidget {
  final ScoutData scoutData;
  const ThirdSection(this.scoutData, {super.key});
  
  @override
  _ThirdSectionState createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection> {
  final _effectifs6_13Controller = TextEditingController();
  final _effectifs14_17Controller = TextEditingController();

  final _entre6_8AnsPresentsController = TextEditingController();
  final _entre8_11AnsPresentsController = TextEditingController();
  final _entre12_14AnsPresentsController = TextEditingController();
  final _entre14_17AnsPresentsController = TextEditingController();
  final _entre17_19AnsPresentsController = TextEditingController();

  final _entre6_8AnsHandiController = TextEditingController();
  final _entre8_11AnsHandiController = TextEditingController();
  final _entre12_14AnsHandiController = TextEditingController();
  final _entre14_17AnsHandiController = TextEditingController();

  final _entre17_19AnsHandiController = TextEditingController();
  final _totalPresentsController = TextEditingController();
  final _totalHandiController = TextEditingController();
  final _observations2324_13Controller = TextEditingController();
  final _observations2324_14Controller = TextEditingController();
  final _observationsRegistreMineursController = TextEditingController();
  //int totalDeclares;
  //int totalPresents;
  //int totalHandi;  
  
  int _num6_8Presents = 0;
  int _num8_11Presents = 0;
  int _num12_14Presents= 0;
  int _num14_17Presents= 0;
  int _num17_19Presents= 0;
  int _totalPresents = 0;
  int _num6_8Handi= 0;
  int _num8_11Handi = 0;
  int _num12_14Handi = 0;
  int _num14_17Handi = 0;
  int _num17_19Handi = 0;
  int _totalHandi = 0;

  @override
  void initState() {
    super.initState();
    
    _effectifs6_13Controller.text = widget.scoutData.effectifs6_13;
    _effectifs14_17Controller.text = widget.scoutData.effectifs14_17;
    
    _entre6_8AnsPresentsController.text = widget.scoutData.entre6_8AnsPresents;
    _entre8_11AnsPresentsController.text = widget.scoutData.entre8_11AnsPresents;
    _entre12_14AnsPresentsController.text = widget.scoutData.entre12_14AnsPresents;
    _entre14_17AnsPresentsController.text = widget.scoutData.entre14_17AnsPresents;
    _entre17_19AnsPresentsController.text = widget.scoutData.entre17_19AnsPresents;

    _entre6_8AnsHandiController.text = widget.scoutData.entre6_8AnsHandi;
    _entre8_11AnsHandiController.text = widget.scoutData.entre8_11AnsHandi;
    _entre12_14AnsHandiController.text = widget.scoutData.entre12_14AnsHandi;
    _entre14_17AnsHandiController.text = widget.scoutData.entre14_17AnsHandi;
    _entre17_19AnsHandiController.text = widget.scoutData.entre17_19AnsHandi;


    _totalPresentsController.text = widget.scoutData.totalPresents;
    _totalHandiController.text = widget.scoutData.totalHandi;    


    //totalController = TextEditingController();
    _observations2324_13Controller.text = widget.scoutData.totalHandi;
    _observations2324_14Controller.text = widget.scoutData.totalHandi;
    _observationsRegistreMineursController.text = widget.scoutData.totalHandi;
  }

  @override
  void dispose() {
    _effectifs6_13Controller.dispose();
    _effectifs14_17Controller.dispose();
    _entre6_8AnsPresentsController.dispose();
    _entre8_11AnsPresentsController.dispose();
    _entre12_14AnsPresentsController.dispose();
    _entre14_17AnsPresentsController.dispose();
    _entre17_19AnsPresentsController.dispose();
    _entre6_8AnsHandiController.dispose();
    _entre8_11AnsHandiController.dispose();
    _entre12_14AnsHandiController.dispose();
    _entre14_17AnsHandiController.dispose();
    _entre17_19AnsHandiController.dispose();
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
          RadioGroup(
            title: 'Mixité du groupe',
            defaultChoice: widget.scoutData.radioMixite,
            choices: const ['OUI', 'NON'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioMixite = value;
              });
            },
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Mixité des patrouilles',
            defaultChoice: widget.scoutData.radioPatrouilles,
            choices: const ['OUI', 'NON'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioPatrouilles = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(labelText: 'Effectifs déclarés : 6 - 13 ans :', 
          controller: _effectifs6_13Controller,
          onChanged: (value) {
            setState(() {
              widget.scoutData.effectifs6_13 = value;
            });
          }),
          const SizedBox(height: 20),
          CustomTextField(labelText: 'Effectifs déclarés : 14 - 17 ans :', 
          controller: _effectifs14_17Controller,
          onChanged: (value) {
            setState(() {
              widget.scoutData.effectifs14_17 = value;
            });
          }),
        const SizedBox(height: 20),
        
        const Text(
          'Présents',
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomNumberField(
                labelText: '6 - 8 ans',
                controller: _entre6_8AnsPresentsController,
                onChanged: (value) {
                  setState(() {
                    _num6_8Presents = value;
                    widget.scoutData.entre6_8AnsPresents = value.toString();
                    _calculateTotalPresents();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '8 - 11 ans',
                controller: _entre8_11AnsPresentsController,
                onChanged: (value) {
                  setState(() {
                    _num8_11Presents = value;
                    widget.scoutData.entre8_11AnsPresents = value.toString();
                    _calculateTotalPresents();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '12 - 14 ans',
                controller: _entre12_14AnsPresentsController,
                onChanged: (value) {
                  setState(() {
                    _num12_14Presents = value;
                    widget.scoutData.entre12_14AnsPresents = value.toString();
                    _calculateTotalPresents();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '14 -17 ans',
                controller: _entre14_17AnsPresentsController,
                onChanged: (value) {
                  setState(() {
                    _num14_17Presents = value;
                    widget.scoutData.entre14_17AnsPresents = value.toString();
                    _calculateTotalPresents();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '17 - 19 ans',
                controller: _entre17_19AnsPresentsController,
                onChanged: (value) {
                  setState(() {
                    _num17_19Presents = value;
                    widget.scoutData.entre17_19AnsPresents = value.toString();
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
          'Dont enfant(s) porteur(s) de handicap',
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomNumberField(
                labelText: '6 - 8 ans',
                controller: _entre6_8AnsHandiController,
                onChanged: (value) {
                  setState(() {
                    _num6_8Handi = value;
                    widget.scoutData.entre6_8AnsHandi = value.toString();
                    _calculateTotalHandi();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '8 - 11 ans',
                controller: _entre8_11AnsHandiController,
                onChanged: (value) {
                  setState(() {
                    _num8_11Handi = value;
                    widget.scoutData.entre8_11AnsHandi = value.toString();
                    _calculateTotalHandi();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '12 - 14 ans',
                controller: _entre12_14AnsHandiController,
                onChanged: (value) {
                  setState(() {
                    _num12_14Handi = value;
                    widget.scoutData.entre12_14AnsHandi = value.toString();
                    _calculateTotalHandi();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '14 - 17 ans',
                controller: _entre14_17AnsHandiController,
                onChanged: (value) {
                  setState(() {
                    _num14_17Handi = value;
                    widget.scoutData.entre14_17AnsHandi = value.toString();
                    _calculateTotalHandi();
                  });
                },
              ),
            ),
            Expanded(
              child: CustomNumberField(
                labelText: '17 - 19 ans',
                controller: _entre17_19AnsHandiController,
                onChanged: (value) {
                  setState(() {
                    _num17_19Handi = value;
                    widget.scoutData.entre17_19AnsHandi = value.toString();
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
        ],
      ),
    );
  }

  
  void _calculateTotalPresents() {
    setState(() {
      _totalPresents= _num6_8Presents + _num8_11Presents + _num12_14Presents + _num14_17Presents + _num17_19Presents;
      _totalPresentsController.text = _totalPresents.toString();
      widget.scoutData.totalPresents = _totalPresents.toString();

    });
  }

  void _calculateTotalHandi() {
    setState(() {
      _totalHandi =  _num6_8Handi + _num8_11Handi + _num12_14Handi + _num14_17Handi + _num17_19Handi;
      _totalHandiController.text = _totalHandi.toString();
      widget.scoutData.totalHandi = _totalHandi.toString();

    });
  }
}

class FourthSection extends StatefulWidget {
  final ScoutData scoutData;
  
  const FourthSection(this.scoutData, {super.key});
  
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

  int _numQualifiedAnimators = 0;
  int _numTraineeAnimators = 0;
  int _numUnqualifiedAnimators = 0;
  int _totalAnimators = 0;
  int _requiredQualifiedAnimators = 0;
  int _requiredTraineeAnimators = 0;
  int _totalRequiredAnimators = 0;

  @override
  void initState() {
    super.initState();
      _directeurNomController.text = widget.scoutData.directeurNom;
      _directeurPrenomController.text = widget.scoutData.directeurPrenom;
      _directeurQualifController.text = widget.scoutData.directeurQualification;
      _dateRenouvellementController.text = widget.scoutData.dateRenouvellement.toString();
      _dateDebutFormationController.text = widget.scoutData.dateDebutFormation.toString();
      _dateStartDerogationController.text = widget.scoutData.dateStartDerogation .toString();
      _dateEndDerogationController.text = widget.scoutData.dateEndDerogation .toString();
      _nombreAnimQualifController.text = widget.scoutData.nombreAnimQualif;
      _nombreAnimStagiairesController.text = widget.scoutData.nombreAnimStagiaires;
      _nombreAnimNonQualifController.text = widget.scoutData.nombreAnimNonQualif;
      _totalAnimController.text = widget.scoutData.totalAnim;
      _encadrementRequisMoinsDe6Controller.text = widget.scoutData.encadrementRequisMoinsDe6;
      _encadrementRequisPlusDe6Controller.text = widget.scoutData.encadrementRequisPlusDe6;
      _totalAnimRequisController.text = widget.scoutData.totalAnimRequis;
      _observations227_2Controller.text = widget.scoutData.observations227_2;
      _observations3_8Controller.text = widget.scoutData.observationsArrete3_5;
      _observations9_02_07Controller.text = widget.scoutData.observations9_02_07;
      _observations227_8Controller.text = widget.scoutData.observations227_8;
      _observationsCommunicationOrganisateurController.text = widget.scoutData.observationsCommunicationOrganisateur;
      _observationsSavoirComportementController.text = widget.scoutData.observationsSavoirComportement;
      _observationsQualifPersonnelController.text = widget.scoutData.observationsQualifPersonnel;
      _observationsTempsDePrepController.text = widget.scoutData.observationsTempsDePrep;
      _observationsReuBilan.text = widget.scoutData.observationsReuBilan;
      _observationsEvalStg.text = widget.scoutData.observationsEvalStg;
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
              widget.scoutData.directeurNom = value;
            });
          }),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Prénom', controller: _directeurPrenomController,
          onChanged: (value) {
            setState(() {
              widget.scoutData.directeurPrenom = value;
            });
          }),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Qualification', controller: _directeurQualifController,
          onChanged: (value) {
            setState(() {
              widget.scoutData.directeurQualification = value;
            });
          }),
          const SizedBox(height: 10),
          RadioGroup(
            title: '',
            defaultChoice: widget.scoutData.radioTitulaireStagiaire,
            choices: const ['Titulaire', 'Stagiaire'],
            onChanged: (value) {
            setState(() {
              widget.scoutData.radioTitulaireStagiaire = value;
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
              widget.scoutData.dateRenouvellement = selectedDate;
            });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Stagiaire BAFD, date de début de formation',
            controller: _dateDebutFormationController,
            onDateSelected: (DateTime selectedDate) {
            setState(() {
              widget.scoutData.dateDebutFormation = selectedDate;
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
              widget.scoutData.dateStartDerogation = selectedDate;
            });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Fin de la période',
            controller: _dateEndDerogationController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
              widget.scoutData.dateEndDerogation = selectedDate;
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
                _numQualifiedAnimators = value;
                widget.scoutData.nombreAnimQualif= value.toString();
                _calculateTotalAnimators();
              });
            },
            
          ),
          const SizedBox(height: 10),
          CustomNumberField(
            labelText: 'Nombre d\'animateurs stagiaires',
            onChanged: (value) {
              setState(() {
                _numTraineeAnimators = value;
                widget.scoutData.nombreAnimStagiaires= value.toString();
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
                _numUnqualifiedAnimators = value;
                widget.scoutData.nombreAnimNonQualif= value.toString();
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
                _requiredQualifiedAnimators = value;
                widget.scoutData.encadrementRequisMoinsDe6= value.toString();
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
                _requiredTraineeAnimators = value;
                widget.scoutData.encadrementRequisPlusDe6= value.toString();                
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
            defaultChoice: widget.scoutData.radio227_2,
            referenceText: 'Art. R. 227-2 CASF : " Toute personne organisant [un ACM] doit en faire préalablement la déclaration au représentant de l\'Etat dans le département ".',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radio227_2= value;                
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations227_2Controller,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observations227_2 = value;
            });
          }),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Sincérité de la déclaration (nombre de mineurs, encadrement, période, lieu, etc.):',
            defaultChoice: widget.scoutData.radioArrete3_5,
            referenceText:  'Réf. :\n'
            'Arreté du 3 novembre 2014, article 8 : " L\'organisateur porte immédiatement par écrit à la connaissance du préfet qui a reçu la déclaration toute modification intervenue dans les éléments de la fiche initiale ou des fiches complémentaires ".\n'
            'NB :\n'
            '- Noter le nom de tout animateur, personnel, intervenant ou prestataire (en contact avec les mineurs) qui ne serait pas sur la déclaration.\n'
            '- La sincérité est controlée par rapport à la déclaration sur Gam-Tam (et non le récépissé).',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioArrete3_5= value;                
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations3_8Controller,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observationsArrete3_5 = value;
            });
          }),
          const SizedBox(height: 20),
                    
          RadioGroup(
            title: 'Diplôme de l\'équipe:',
            referenceText: 'NB :\n'
            '- Noter le nom de tout animateur, personnel, intervenant ou prestataire (en contact avec les mineurs) qui ne serait pas sur la déclaration.\n'
            '- La sincérité est controlée par rapport à la déclaration sur Gam-Tam (et non le récépissé).',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.scoutData.radio9_02_07,
            onChanged: (value) {
              setState(() {
                widget.scoutData.radio9_02_07= value;
              });
            }
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations9_02_07Controller,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observations9_02_07 = value;
            });
          }),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Attestation de vaccination de chacun des membres de l\'équipe:',
            referenceText: 'Réf. :\n'
            'Art. R. 227-8 CASF : " Les personnes qui participent à [un ACM] doivent produire, avant leur entrée en fonction, un document attestant qu\'elles ont satisfait aux obligations légales en matière de vaccination. "',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.scoutData.radio227_8,
            onChanged: (value) {
              setState(() {
                widget.scoutData.radio227_8 = value;
              });
            }
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations227_8Controller,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observations227_8 = value;
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
          LongTextField(labelText: 'Présenté:', controller: _observationsCommunicationOrganisateurController,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observationsCommunicationOrganisateur = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'Le personnel possède-t-il des savoirs comportementaux adaptés (relations aux familles, aux enfants, aux autres acteurs, etc.) ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Présenté:', controller: _observationsSavoirComportementController,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observationsSavoirComportement = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'Les qualifications du personnel sont-elles adaptées aux projets développés et aux publics accueillis ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Présenté:', controller: _observationsQualifPersonnelController,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observationsQualifPersonnel = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'L\'animation de l\'équipe fait-elle l\'objet de temps de préparation et d\'évaluation (modalités d\'information de l\'équipe, modalités de repos de l\'équipe, etc.) ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Présenté:', controller: _observationsTempsDePrepController,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observationsTempsDePrep = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'Y a-t-il des réunions de bilan entre le directeur et l\'équipe ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Présenté', controller: _observationsReuBilan,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observationsReuBilan = value;
            });
          }),
          const SizedBox(height: 20),
          
          const Text(
            'L\'évaluation des stagiaires s\'appuie-t-elle sur des critères connus et des temps d\'échange ?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          LongTextField(labelText: 'Presenté:', controller: _observationsEvalStg,
          onChanged: (value) {
            setState(() {
              widget.scoutData.observationsEvalStg = value;
            });
          }),
        ],
      ),
    );
  }

  void _calculateTotalAnimators() {
    setState(() {
      _totalAnimators = _numQualifiedAnimators + _numTraineeAnimators + _numUnqualifiedAnimators;
      _totalAnimController.text = _totalAnimators.toString();
      widget.scoutData.totalAnim = _totalAnimators.toString();
    });
  }

  void _calculateTotalRequiredAnimators() {
    setState(() {
      _totalRequiredAnimators = _requiredQualifiedAnimators + _requiredTraineeAnimators ;
      _totalAnimRequisController.text = _totalRequiredAnimators.toString();
      widget.scoutData.totalAnimRequis = _totalRequiredAnimators.toString();

    });
  }

  void _updateTotalControllers() {
    _totalAnimController.text = _totalAnimators.toString();
    _totalAnimRequisController.text = _totalRequiredAnimators.toString();
  }
}

class FifthSection extends StatefulWidget {
  final ScoutData scoutData;

 const FifthSection(this.scoutData, {super.key});

  @override
  _FifthSectionState createState() =>  _FifthSectionState();
}

class _FifthSectionState extends State<FifthSection> {
  final _identificationRisquesController = TextEditingController();
  final _moyensPreventionController = TextEditingController();
  final _identificationlieuController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _identificationRisquesController.text = widget.scoutData.identificationRisques;
    _moyensPreventionController.text = widget.scoutData.moyensPrevention;
    _identificationlieuController.text = widget.scoutData.identificationlieu;
  }

  @override
  void dispose() {
    _identificationRisquesController.dispose();
    _moyensPreventionController.dispose();
    _identificationlieuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          CustomTextField(
            labelText: 'Identification des risques :',
            controller: _identificationlieuController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.identificationlieu = value;
              });
            },
          ),

          const SizedBox(height: 10),

          CustomTextField(
            labelText: 'Identification des risques :',
            controller: _identificationRisquesController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.identificationRisques = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Moyens de prévention mis en place :',
            controller: _moyensPreventionController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.moyensPrevention = value;
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
  final ScoutData scoutData;
  const SixthSection(this.scoutData, {super.key});

  @override
  _SixthSectionState createState() => _SixthSectionState();
}

class _SixthSectionState extends State<SixthSection> {
  final TextEditingController _couchagesController = TextEditingController();
  final TextEditingController _sanitairesController = TextEditingController();
  final TextEditingController _infirmerieController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _couchagesController.text = widget.scoutData.couchagesDetails;
    _sanitairesController.text = widget.scoutData.toilettesCommentaires;
    _infirmerieController.text = widget.scoutData.douchesCommentaires;
  }

  @override
  void dispose() {
    _couchagesController.dispose();
    _sanitairesController.dispose();
    _infirmerieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Couchages',
            defaultChoice: widget.scoutData.couchages,
            choices: const ['Tentes', 'Constructions', 'Bivouac sans protection'],
            onChanged: (value) {
              widget.scoutData.couchages = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Nombre - État - Solidité - Hauteur - Rangement des effets personnels',
            controller: _couchagesController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.couchagesDetails = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Alimentation',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Cuisine (vaisselier, table à manger)',
            defaultChoice: widget.scoutData.cuisine,
            choices: const ['Satisfaisant', 'A améliorer', 'Insatisfaisant'],
            onChanged: (value) {
              widget.scoutData.cuisine = value;
            },
          ),
          RadioGroup(
            title: 'Table à feu (distance des arbres, matériau isolant, hauteur du sol)',
            defaultChoice: widget.scoutData.tableFeu,
            choices: const ['Satisfaisant', 'A améliorer', 'Insatisfaisant'],
            onChanged: (value) {
              widget.scoutData.tableFeu = value;
            },
          ),
          RadioGroup(
            title: 'Conservation des denrées alimentaires',
            defaultChoice: widget.scoutData.conservationDenrees,
            choices: const ['Satisfaisant', 'A améliorer', 'Insatisfaisant'],
            onChanged: (value) {
              widget.scoutData.conservationDenrees = value;
            },
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Présence d\'un réfrigérateur',
            defaultChoice: widget.scoutData.refrigerateur,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.refrigerateur = value;
            },
          ),
          RadioGroup(
            title: 'Relevé des températures régulier',
            defaultChoice: widget.scoutData.releveTemperatures,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.releveTemperatures = value;
            },
          ),
          RadioGroup(
            title: 'Conservation des repas témoins (5 derniers jours min.)',
            defaultChoice: widget.scoutData.conservationRepas,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.conservationRepas = value;
            },
          ),
          RadioGroup(
            title: 'Traitement des déchets (lieu de stockage, tri des déchets)',
            defaultChoice: widget.scoutData.traitementDechets,
            choices: const ['Satisfaisant', 'A améliorer', 'Insatisfaisant'],
            onChanged: (value) {
              widget.scoutData.traitementDechets = value;
            },
          ),
          RadioGroup(
            title: 'Respect de la marche en avant',
            defaultChoice: widget.scoutData.respectMarcheAvant,
            choices: const ['Satisfaisant', 'A améliorer', 'Insatisfaisant'],
            onChanged: (value) {
              widget.scoutData.respectMarcheAvant = value;
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Sanitaires',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Toilettes / Feuillées (matériel, nombre, hygiène, entretien, intimité)',
            defaultChoice: widget.scoutData.toilettes,
            choices: const ['Satisfaisant', 'A améliorer', 'Insatisfaisant'],
            onChanged: (value) {
              widget.scoutData.toilettes = value;
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Commentaires',
            controller: _sanitairesController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.toilettesCommentaires = value;
              });
            },
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Douches (matériel, nombre, hygiène, entretien, intimité)',
            defaultChoice: widget.scoutData.douches,
            choices: const ['Satisfaisant', 'A améliorer', 'Insatisfaisant'],
            onChanged: (value) {
              widget.scoutData.douches = value;
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Commentaires',
            controller: _infirmerieController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.douchesCommentaires = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Infirmerie',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RadioGroup(
            title: 'Présence d\'un assistant sanitaire qualifié sur le séjour',
            defaultChoice: widget.scoutData.assistantSanitaire,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.assistantSanitaire = value;
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Qualification',
            controller: _infirmerieController,
            onChanged: (value) {
              setState(() {
                // Mettre à jour les données en fonction de la qualification de l'assistant sanitaire
              });
            },
          ),
          const SizedBox(height: 20),

            RadioGroup(
            title: 'Existe-t-il un lieu d\'isolement spécifique (pièce/tente)?',
            defaultChoice: widget.scoutData.lieuIsolement,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.lieuIsolement = value;
            },
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Existe-t-il des trousses de premier secours?',
            defaultChoice: widget.scoutData.troussesPremierSecours,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.troussesPremierSecours = value;
            },
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Le contenu est-il satisfaisant (matériel, tire-tique, dates de péremption produits, etc.)?',
            defaultChoice: widget.scoutData.contenuTrousseSecours,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.contenuTrousseSecours = value;
            },
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Existe-t-il un registre d\'infirmerie ?',
            defaultChoice: widget.scoutData.registreInfirmerie,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.registreInfirmerie = value;
            },
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'L\'AS dispose-t-il des fiches sanitaires des jeunes?',
            defaultChoice: widget.scoutData.fichesSanitaires,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.fichesSanitaires = value;
            },
          ),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les ordonnances et traitements sont-ils différenciés?',
            defaultChoice: widget.scoutData.ordonnancesTraitements,
            choices: const ['Oui', 'Non'],
            onChanged: (value) {
              widget.scoutData.ordonnancesTraitements = value;
            },
          ),
        ],
      ),
    );
  }
}

class SeventhSection extends StatefulWidget {
  final ScoutData scoutData;
  const SeventhSection(this.scoutData, {super.key});

  @override
  _SeventhSectionState createState() => _SeventhSectionState();
}

class _SeventhSectionState extends State<SeventhSection> {
  final TextEditingController _modalitesMiseOeuvreController = TextEditingController();
  final TextEditingController _modalitesPreparationEquipeController = TextEditingController();
  final TextEditingController _lienProjetEducatifController = TextEditingController();
  final TextEditingController _modalitesParticipationController = TextEditingController();
  final TextEditingController _repartitionTempsController = TextEditingController();
  final TextEditingController _activitesPhysiquesController = TextEditingController();
  final TextEditingController _activitesSportivesController = TextEditingController();
  final TextEditingController _observationsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _modalitesMiseOeuvreController.text = widget.scoutData.modalitesMiseOeuvre;
    _modalitesPreparationEquipeController.text = widget.scoutData.modalitesPreparationEquipe;
    _lienProjetEducatifController.text = widget.scoutData.lienProjetEducatif;
    _modalitesParticipationController.text = widget.scoutData.modalitesParticipation;
    _repartitionTempsController.text = widget.scoutData.repartitionTemps;
    _activitesPhysiquesController.text = widget.scoutData.activitesPhysiques;
    _activitesSportivesController.text = widget.scoutData.activitesSportives;
    _observationsController.text = widget.scoutData.observations;
  }

  @override
  void dispose() {
    _modalitesMiseOeuvreController.dispose();
    _modalitesPreparationEquipeController.dispose();
    _lienProjetEducatifController.dispose();
    _modalitesParticipationController.dispose();
    _repartitionTempsController.dispose();
    _activitesPhysiquesController.dispose();
    _activitesSportivesController.dispose();
    _observationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Projet éducatif',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Modalités de mise en œuvre de la méthode scoute durant le séjour (orientations éducatives)',
            controller: _modalitesMiseOeuvreController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.modalitesMiseOeuvre = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Modalités de préparation de l’équipe (Temps de préparation, évaluation, fréquence des réunions, suivi des stagiaires)',
            controller: _modalitesPreparationEquipeController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.modalitesPreparationEquipe = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Projet pédagogique',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Lien avec le projet éducatif, nature des activités, diversité, adaptation aux tranches d’âge des enfants',
            controller: _lienProjetEducatifController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.lienProjetEducatif = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Modalités de participation des mineurs (choix des activités, règles de vie)',
            controller: _modalitesParticipationController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.modalitesParticipation = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Répartition des temps d’activités et de repos (respect des rythmes de l’enfant, temps calmes, etc.)',
            controller: _repartitionTempsController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.repartitionTemps = value;
              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Organisation d\'activités spécifiques',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Activités physiques ludiques et récréatives (encadrement par l\'équipe ACM)',
            controller: _activitesPhysiquesController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.activitesPhysiques = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Activités sportives nécessitant un encadrement par une personne majeure qualifiée en référence à l’article R227-13 du code de l’action sociale et des familles et/ou à l’arrêté du 25 avril 2012 (type, prestataires, encadrants, tarifs…)',
            controller: _activitesSportivesController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.activitesSportives = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Observations',
            controller: _observationsController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.observations = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class EighthSection extends StatefulWidget {
  final ScoutData scoutData;
  const EighthSection(this.scoutData, {super.key});

  @override
  _EighthSectionState createState() => _EighthSectionState();
}

class _EighthSectionState extends State<EighthSection> {
  final  _preparationAutonomieController = TextEditingController();
  final  _coordinationCommunicationController = TextEditingController();
  final  _modaliteKeyPointsController = TextEditingController();
  final  _commentairesController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _preparationAutonomieController.text = widget.scoutData.modalitesPreparationAutonomie ;
    _coordinationCommunicationController.text = widget.scoutData.coordinationCommunication ;
    _modaliteKeyPointsController.text = widget.scoutData.modalitesKeyPoints ;
    _commentairesController.text = widget.scoutData.commentairesExplo ;
  }

  @override
  void dispose() {
    _preparationAutonomieController.dispose();
    _coordinationCommunicationController.dispose();
    _commentairesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            labelText: 'Modalités de préparation à l\'autonomie et de reconnaissance de l\'itinéraire',
            controller: _preparationAutonomieController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.modalitesPreparationAutonomie = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText: 'Moyens de coordination et de communication (existence de zones blanches téléphoniques)',
            controller: _coordinationCommunicationController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.coordinationCommunication = value;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelText:'Modalités des points d\'étape et des traces de passage :',
            controller:_modaliteKeyPointsController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.modalitesKeyPoints = value;
              });
            },
            ),
          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Sécurité et adaptation du matériel d’exploration (cartes, boussoles) :     ',
            defaultChoice: widget.scoutData.radioExplo,
            choices: const ['Satisfaisant', 'Moyen', 'Insatisfaisant'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.radioExplo = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'Commentaires:',
            controller: _commentairesController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.commentairesExplo = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class NinthSection extends StatefulWidget {
  final ScoutData scoutData;
  const NinthSection(this.scoutData, {super.key});

  @override
  _NinthSectionState createState() => _NinthSectionState();
}

class _NinthSectionState extends State<NinthSection> {
  final TextEditingController _bilanController = TextEditingController();
  final _prescriptionAuthoritySignatureController = SignatureController();

  @override
  void initState() {
    super.initState();
    _bilanController.text = widget.scoutData.bilan;
    _prescriptionAuthoritySignatureController.points = widget.scoutData.signatureAuthorite;
  }

  @override
  void dispose() {
    _bilanController.dispose();
    _prescriptionAuthoritySignatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            labelText: 'Bilan de la visite, recommandations:',
            controller: _bilanController,
            onChanged: (value) {
              setState(() {
                widget.scoutData.bilan = value;

              });
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Destinataires du rapport',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          
          const SizedBox(height: 10),
          CheckboxGroup(
            title: 'Original:',
            defaultChoices: widget.scoutData.destinataireRapport,
            choices: const ['Organisateur', 'Directeur stagiaire (rapport joint)'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.destinataireRapport = value;
              });
            },
          ),
          
          const SizedBox(height: 10),
          CheckboxGroup(
            title: 'Copie à:',
            defaultChoices: widget.scoutData.copieA,
            choices: const ['DRJSCS du lieu de gestion du directeur stagiaire', 'DDPP', 'Autres (mairies, fédération nationale...)'],
            onChanged: (value) {
              setState(() {
                widget.scoutData.copieA = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CheckboxGroup(
            title: 'Suites éventuelles:',
            defaultChoices: widget.scoutData.suitesRapport,
            choices: const ['Courrier au directeur ', 'Lettre d’injonction', 'Courrier à l’organisateur '],
            onChanged: (value) {
              setState(() {
                widget.scoutData.copieA = value;
              });
            },
          ),
          const Text(
            'Signature de l\'inspecteur de la jeunesse et des sports:',
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
                    controller: _prescriptionAuthoritySignatureController,
                    backgroundColor: Colors.white,
                    // Ajoutez d'autres propriétés selon vos besoins
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    _prescriptionAuthoritySignatureController.clear();
                    widget.scoutData.signatureAuthorite = [];
                  },
                  child: const Icon(Icons.clear),
                ),
              ],
            ),
          ),
          const PhotoPickerWidget(),
        ],
      ),
    );
  }
}


//___________________________GESTION_IMAGE___________________________________/


class PhotoPickerWidget extends StatefulWidget {
  const PhotoPickerWidget({super.key});

  @override
  _PhotoPickerWidgetState createState() => _PhotoPickerWidgetState();
}

class _PhotoPickerWidgetState extends State<PhotoPickerWidget> {
  final List<Uint8List> _uploadedImages = [];

  Future<void> _handleImageUpload() async {
    final picker = ImagePicker();
    final pickedFiles =
        await picker.pickMultiImage(); // Sélectionnez plusieurs images

    for (var file in pickedFiles) {
      final bytes = await file.readAsBytes();
      setState(() {
        _uploadedImages.add(bytes);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _uploadedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _uploadedImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Stack(
                  children: [
                    Image.memory(
                      _uploadedImages[index],
                      height: 150,
                      width: 150,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            _removeImage(index);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: _handleImageUpload,
          child: const Text('Sélectionner des photos'),
        ),
      ],
    );
  }
}


class DataSaver {
  Future<void> saveDataToFile(ScoutData scoutData) async {
    // Obtenir le répertoire de stockage externe
    Directory? directory = await getExternalStorageDirectory();
    String fileName = 'Rapport_Controle_Scoutisme_${scoutData.dateVisite}_${scoutData.visiteRealiseePar}.txt';
    // Vérifier si le répertoire n'est pas nul
    if (directory != null) {
      // Créer un fichier dans le répertoire de stockage externe
      final file = File('${directory.path}/$fileName');

      // Ouvrir le fichier en mode écriture
      IOSink sink = file.openWrite();

      // Écrire le contenu de chaque variable dans le fichier
      sink.writeln('Visite réalisée par: ${scoutData.visiteRealiseePar}');
      sink.writeln('En présence de: ${scoutData.enPresenceDe}');
      sink.writeln('Type de séjour: ${scoutData.typeSejour}');
      // Ajoutez ici d'autres lignes pour chaque variable que vous souhaitez sauvegarder
      // Fermer le fichier
      await sink.flush();
      await sink.close();
    } else {
      // Gérer le cas où le répertoire est nul
      print('Impossible d\'obtenir le répertoire de stockage externe.');
    }
  }
}