// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Menus/FormsList.dart';
import 'package:flutter_application_2/Menus/Home.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter_application_2/DB/Db_manager.dart';
import 'package:flutter_application_2/components/my_textfields.dart';


void main() {
  //sqfliteFfiInit();
  //databaseFactory = databaseFactoryFfi;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AvecH());
}


class AvecH extends StatefulWidget {
  const AvecH({super.key});

  @override
  _AvecHState createState() => _AvecHState();
}

class _AvecHState extends State<AvecH> {
  AvecHData _avecHData = AvecHData();

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulaire à 10 sections',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(avecHData: _avecHData), // Passer _avecHData à FirstPage
    );
  }
}

class ActiviteData {
  String nomActivite = '';
  int categorie = 1; 
  List<String> typeActivite = []; // Type d'activité pour la catégorie 1
  String? encadrantNomPrenom; // Nom/prenom de l'encadrant pour catégorie 2 et 3
  String? encadrantQualif; // Qualification de l'encadrant pour catégorie 2 et 3
  String? numCartePro; // Numero de la carte professionnelle pour catégorie 3
}

class AvecHData {
  //Section 1
  String visiteRealiseePar = '';
  String enPresenceDe = '';

  //Section 2
  String denomination = '';
  String adresse = '';
  String lieu = '';
  String numeroDeclaration = '';
  String radio227_5 = '';
  String radio227_29 = '';
  String observations227_5 = '';
  String observations227_29 = '';

  //Section 3
  String capaciteAccueil = '';
  String moinsDe6AnsDeclares = '';
  String entre6et13AnsDeclares = '';
  String entre14et17AnsDeclares = '';
  String moinsDe6AnsPresents = '';
  String entre6et13AnsPresents = '';
  String entre14et17AnsPresents = '';
  String moinsDe6AnsHandi = '';
  String entre6et13AnsHandi = '';
  String entre14et17AnsHandi = '';
  String totalDeclares = '';
  String totalPresents = '';
  String totalHandi = '';
  String radio2324_13 = '';
  String radio2324_14 = '';
  String observations2324_13 = '';
  String observations2324_14 = '';
  String radioRegistreMineur = '';
  String observationsRegistreMineur = '';

  //Section 4
  String directeurNom = '';
  String directeurPrenom = '';
  String directeurQualification = '';
  String radioTitulaireStagiaire = '';
  String adjointNom = '';
  String adjointPrenom = '';
  String adjointQualif = ''; // Spécifique au ALAH
  String nombreAnimQualif = '';
  String nombreAnimStagiaires = '';
  String nombreAnimNonQualif = '';
  String totalAnim = '';
  String encadrementRequisMoinsDe6 = '';
  String encadrementRequisPlusDe6 = '';
  String totalAnimRequis = '';
  String radio227_2 = '';
  String observations227_2 = '';
  String radioArrete3_5 = '';
  String observationsArrete3_5 = '';
  String radio9_02_07 = '';
  String observations9_02_07 = '';
  String radio227_8 = '';
  String observations227_8 = '';
  String radioSuiviSanitaire = '';
  String observationsSuiviSanitaire = '';
  String observationsCommunicationOrganisateur = '';
  String observationsSavoirComportement = '';
  String observationsQualifPersonnel = '';
  String observationsTempsDePrep = '';
  String observationsReuBilan = '';
  String observationsEvalStg = '';

  //Section 5
  String radioProjEdu = '';
  String observationsProjEdu = '';
  String radioProjPeda = '';
  String observationsProjPeda = '';
  String radioRepresentant = '';
  String observationsRepresentant = '';
  String observationsPE = '';
  String observationsMoyens = '';
  String observationsMoyensEquipe = '';
  String observationsBudget = '';
  String observationsOrientation = '';
  String observationsDiagnostic = '';
  String observationsPolitique = '';
  String observationsReorientation = '';
  String observationsPPCoherence = '';
  String observationsPPCara = '';
  String observationsPPConcertation = '';
  String observationsPPModalite = '';
  String observationsPPNature = '';
  String observationsPPRepartition = '';
  String observationsSecuriteNuit = '';
  String observationsPPSanteHandi = '';
  String observationsPPFonctEquipe = '';
  String observationsPPEvalAccueil = '';
  String observationsActivitesType = '';
  String observationsPrestataire = '';
  String observationsActiviteMineur = '';
  String observationsRisques = '';
  String observationsEchange = '';
  String observationsFormation = '';
  String nomActivite = '';
  String encadrantNomPrenomACM = '';
  String encadrantQualifACM = '';
  String denomEtablissement = '';
  String encadrantNomPrenomPresta = '';
  String encadrantQualifPresta = '';
  String numCarteProPresta = '';
  String radioAqua = '';
  String radioAutorisations = '';

  // Section Minibus
  String radioUtilisationMinibus = '';
  String radioTransportsCommuns = '';
  String radioCarnetsRoute = '';
  String radioConnaissanceSecurite = '';
  String radioQualiteConduite = '';
  String radioConditionsTravail = '';

  //Section 6
  String observationsIsolation = '';
  String observationsVaccination = '';
  String observationsAntecedents = '';
  String observationsMineurTraitement = '';
  String observationsAllergies = '';
  String observationsOrdonnances = '';
  String observationsRegistreSoins = '';
  String observationsPremierSoins = '';
  String observationsCommSecours = '';
  String observationsNumUrgence = '';
  String radioIsolation = '';
  String radioVaccination = '';
  String radioAntecedents = '';
  String radioMineurTraitement = '';
  String radioAllergies = '';
  String radioOrdonnances = '';
  String radioRegistreSoins = '';
  String radioPremierSoins = '';
  String radioCommSecours = '';
  String radioNumUrgence = '';
  String radioCommissionSecu = '';
  String radioAssurance = '';
  String radioSignaletique = '';
  String radioEvacuation = '';
  String radioExtincteur = '';
  String radioDetecteur = '';
  String radioExercice = '';
  String radioConditionsMeteo = '';
  String radioHygiene = '';
  String radioCouchage = '';
  String radioHebergeDirection = '';
  String radioSanitaire = '';
  String radioSieste = '';
  String radioEspacesAdapte = '';
  String radioRepli = '';
  String observationsCommissionSecu = '';
  String observationsAssurance = '';
  String observationsSignaletique = '';
  String observationsEvacuation = '';
  String observationsExtincteur = '';
  String observationsDetecteur = '';
  String observationsExercice = '';
  String observationsConditionsMeteo = '';
  String observationsHygiene = '';
  String observationsCouchage = '';
  String observationsHebergeDirection = '';
  String observationsSanitaire = '';
  String observationsSieste = '';
  String observationsEspacesAdapte = '';
  String observationsRepli = '';
  String radioCuisine = '';
  String radioSalleResto = '';
  String radioPiqueNique = '';
  String radioPlatsTemoins = '';
  String radioTracabilite = '';
  String radioStockage = '';
  String radioRefrigerateur = '';
  String observationsCuisine = '';
  String observationsSalleResto = '';
  String observationsPlatsTemoins = '';
  String observationsTracabilite = '';
  String observationsStockage = '';
  String observationsRefrigerateur = '';
  String observationsPiqueNique = '';
  String radioGestion = '';
  String radioVeille = '';
  String radioPreventionChaleur = '';
  String radioEquipement = '';
  String radioPieceFraiche = '';
  String radioVentilateurs = '';
  String radioThermo = '';
  String radioEauMenus = '';
  String radioReserves = '';
  String radioOmbre = '';
  String radioRafraichissement = '';
  String radioGesteBarriere = '';
  String radioGestionPosteriori = '';
  String observationsGestion = '';
  String observationsVeille = '';
  String observationsPreventionChaleur = '';
  String observationsEquipement = '';
  String observationsPieceFraiche = '';
  String observationsVentilateurs = '';
  String observationsThermo = '';
  String observationsEauMenus = '';
  String observationsReserves = '';
  String observationsOmbre = '';
  String observationsRafraichissement = '';
  String observationsGesteBarriere = '';
  String observationsGestionPosteriori = '';
  String appreciationGenerale = '';
  String prescriptionsEcheances = '';
  String controllerName = '';
  DateTime dateVisite = DateTime(2001, 1, 1);
  DateTime startDate = DateTime(2001, 1, 1);
  DateTime endDate = DateTime(2001, 1, 1);
  DateTime dateRenouvellement = DateTime(2001, 1, 1);
  DateTime dateDebutFormation = DateTime(2001, 1, 1);
  DateTime dateStartDerogation = DateTime(2001, 1, 1);
  DateTime dateEndDerogation = DateTime(2001, 1, 1);
  DateTime dateDuControle = DateTime(2001, 1, 1);
  List<String> copyTo = [];
  List<String> radioTypeAccueil = [];
  List<String> checkEtape1ActiviteType = [];
  String CopyToTest = '';
  List<Point> signatureAuthorite = [];
  List<ActiviteData>? activitesSecu;

  }



class MyFormContent {
  final List<String> sectionTitles;
  AvecHData  avecHData;

  MyFormContent(this.sectionTitles, this.avecHData);

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
                if (currentStep == 0) FirstSection(avecHData),
                if (currentStep == 1) SecondSection(avecHData),
                if (currentStep == 2) ThirdSection(avecHData),
                if (currentStep == 3) FourthSection(avecHData),
                if (currentStep == 4) FifthSection(avecHData),
                if (currentStep == 5) MiniBusSection(avecHData),
                if (currentStep == 6) SixthSection(avecHData),
                if (currentStep == 7) SeventhSection(avecHData),
                if (currentStep == 8) EighthSection(avecHData),
                if (currentStep == 9) NinthSection(avecHData),
                if (currentStep == 10) TenthSection(avecHData),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FirstPage extends StatefulWidget {
  final AvecHData avecHData; 

  const FirstPage({super.key, required this.avecHData}); 

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  int _currentStep = 0;
  List<String> sectionTitles = [
    'Information relatives à la visite',
    'Renseignement sur l\'accueil \n(Articles R. 227-1 et suivant et R. 227-27 et suivants du CASF)',
    'Effectif de mineurs \n(Art. R. 227-2, R. 227-7 du CASF, arrêté du 22.9.2006 et art. L. 2324-1 du CSP)',
    'Equipe d\'encadrants \n(Art. R. 227-12 et suivants du CASF)',
    'Education et pédagogie \n(Art. R. 227-23 à R227-26 du CASF et circulaire n° DJEPVA/DJEPVAA3/2011/236)',
    'Sanitaire \n(Art. R.227-6 et suivants du CASF et arrêté du 20 février 2003 relatif au suivi sanitaire des mineurs mentionnés à l’art. L.227-4 du CASF)',
    'Locaux  \n(Art. R. 227 – 5 du CASF)',
    'Restauration \n(Règlement CE n°178/2002)',
    'Mesures en cas de canicule',
    'Fin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rapport de contrôle et d'évaluation d'un accueil collectif de mineurs \nAvec Hebergement"),
      ),
      body: SingleChildScrollView(
          child: MyFormContent(sectionTitles, widget.avecHData).buildFormContent(_currentStep),
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
                insert();
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

    void insert() async {
      String stringAcc = widget.avecHData.radioTypeAccueil.join(','); //Convertit List<String> en String pour stocker DB

    Map<String, dynamic> row = {
      DatabaseHelper.visiteRealiseePar: widget.avecHData.visiteRealiseePar,
      DatabaseHelper.enPresenceDe: widget.avecHData.enPresenceDe,
      DatabaseHelper.dateVisite: widget.avecHData.dateVisite.millisecondsSinceEpoch,
      DatabaseHelper.denomination: widget.avecHData.denomination,
      DatabaseHelper.adresse: widget.avecHData.adresse,
      DatabaseHelper.lieu: widget.avecHData.lieu,
      DatabaseHelper.numeroDeclaration: widget.avecHData.numeroDeclaration,
      DatabaseHelper.startDate: widget.avecHData.startDate.millisecondsSinceEpoch,
      DatabaseHelper.endDate: widget.avecHData.startDate.millisecondsSinceEpoch,
      DatabaseHelper.radioTypeAccueil: stringAcc,
      DatabaseHelper.radio227_5: widget.avecHData.radio227_5,
      DatabaseHelper.obs227_5: widget.avecHData.observations227_5,
      DatabaseHelper.radio227_29: widget.avecHData.radio227_29,
      DatabaseHelper.obs227_29: widget.avecHData.observations227_29,
      DatabaseHelper.capAcc: widget.avecHData.capaciteAccueil,
      DatabaseHelper.moinsDe6AnsDeclares: widget.avecHData.moinsDe6AnsDeclares,
      DatabaseHelper.entre6et13AnsDeclares: widget.avecHData.entre6et13AnsDeclares,
      DatabaseHelper.entre14et17AnsDeclares: widget.avecHData.entre14et17AnsDeclares,
      DatabaseHelper.moinsDe6AnsPresents: widget.avecHData.moinsDe6AnsPresents,
      DatabaseHelper.entre6et13AnsPresents: widget.avecHData.entre6et13AnsPresents,
      DatabaseHelper.entre14et17AnsPresents: widget.avecHData.entre14et17AnsPresents,
      DatabaseHelper.moinsDe6AnsHandi: widget.avecHData.moinsDe6AnsHandi,
      DatabaseHelper.entre6et13AnsHandi: widget.avecHData.entre6et13AnsHandi,
      DatabaseHelper.entre14et17AnsHandi: widget.avecHData.entre14et17AnsHandi,
      DatabaseHelper.radio2324_13: widget.avecHData.radio2324_13,
      DatabaseHelper.observations2324_13: widget.avecHData.observations2324_13,
      DatabaseHelper.radio2324_14: widget.avecHData.radio2324_14,
      DatabaseHelper.observations2324_14: widget.avecHData.observations2324_14,
      DatabaseHelper.radioRegistreMineur: widget.avecHData.radioRegistreMineur,
      DatabaseHelper.observationsRegistreMineur: widget.avecHData.observationsRegistreMineur,
      DatabaseHelper.directeurNom: widget.avecHData.directeurNom,
      DatabaseHelper.directeurPrenom: widget.avecHData.directeurPrenom,
      DatabaseHelper.directeurQualification: widget.avecHData.directeurQualification,
      DatabaseHelper.radioTitulaireStagiaire: widget.avecHData.radioTitulaireStagiaire,
      DatabaseHelper.dateRenouvellement: widget.avecHData.dateRenouvellement.millisecondsSinceEpoch,
      DatabaseHelper.dateDebutFormation: widget.avecHData.dateDebutFormation.millisecondsSinceEpoch,
      DatabaseHelper.dateStartDerogation: widget.avecHData.dateStartDerogation.millisecondsSinceEpoch,
      DatabaseHelper.dateEndDerogation: widget.avecHData.dateEndDerogation.millisecondsSinceEpoch,
      DatabaseHelper.adjointNom: widget.avecHData.adjointNom,
      DatabaseHelper.adjointPrenom: widget.avecHData.adjointPrenom,
      DatabaseHelper.adjointQualif: widget.avecHData.adjointQualif,
      DatabaseHelper.nombreAnimQualif: widget.avecHData.nombreAnimQualif,
      DatabaseHelper.nombreAnimStagiaires: widget.avecHData.nombreAnimStagiaires,
      DatabaseHelper.nombreAnimNonQualif: widget.avecHData.nombreAnimNonQualif,
      DatabaseHelper.encadrementRequisMoinsDe6: widget.avecHData.encadrementRequisMoinsDe6,
      DatabaseHelper.encadrementRequisPlusDe6: widget.avecHData.encadrementRequisPlusDe6,
      DatabaseHelper.radio227_2: widget.avecHData.radio227_2,
      DatabaseHelper.observations227_2: widget.avecHData.observations227_2,
      DatabaseHelper.radioArrete3_5: widget.avecHData.radioArrete3_5,
      DatabaseHelper.observationsArrete3_5: widget.avecHData.observationsArrete3_5,
      DatabaseHelper.radio9_02_07: widget.avecHData.radio9_02_07,
      DatabaseHelper.observations9_02_07: widget.avecHData.observations9_02_07,
      DatabaseHelper.radio227_8: widget.avecHData.radio227_8,
      DatabaseHelper.observations227_8: widget.avecHData.observations227_8,
      DatabaseHelper.radioSuiviSanitaire: widget.avecHData.radioSuiviSanitaire,
      DatabaseHelper.observationsSuiviSanitaire: widget.avecHData.observationsSuiviSanitaire,
      DatabaseHelper.observationsCommunicationOrganisateur: widget.avecHData.observationsCommunicationOrganisateur,
      DatabaseHelper.observationsSavoirComportement: widget.avecHData.observationsSavoirComportement,
      DatabaseHelper.observationsQualifPersonnel: widget.avecHData.observationsQualifPersonnel,
      DatabaseHelper.observationsReuBilan: widget.avecHData.observationsReuBilan,
      DatabaseHelper.observationsEvalStg: widget.avecHData.observationsEvalStg,
      DatabaseHelper.radioProjEdu: widget.avecHData.radioProjEdu,
      DatabaseHelper.observationsProjEdu: widget.avecHData.observationsProjEdu,
      DatabaseHelper.radioProjPeda: widget.avecHData.radioProjPeda,
      DatabaseHelper.observationsProjPeda: widget.avecHData.observationsProjPeda,
      DatabaseHelper.radioRepresentant: widget.avecHData.radioRepresentant,
      DatabaseHelper.observationsRepresentant: widget.avecHData.observationsRepresentant,
      DatabaseHelper.observationsPE: widget.avecHData.observationsPE,
      DatabaseHelper.observationsMoyens: widget.avecHData.observationsMoyens,
      DatabaseHelper.observationsMoyensEquipe: widget.avecHData.observationsMoyensEquipe,
      DatabaseHelper.observationsBudget: widget.avecHData.observationsBudget,
      DatabaseHelper.observationsOrientation: widget.avecHData.observationsOrientation,
      DatabaseHelper.observationsDiagnostic: widget.avecHData.observationsDiagnostic,
      DatabaseHelper.observationsPolitique: widget.avecHData.observationsPolitique,
      DatabaseHelper.observationsReorientation: widget.avecHData.observationsReorientation,
      DatabaseHelper.observationsPPCoherence: widget.avecHData.observationsPPCoherence,
      DatabaseHelper.observationsPPCara: widget.avecHData.observationsPPCara,
      DatabaseHelper.observationsPPConcertation: widget.avecHData.observationsPPConcertation,
      DatabaseHelper.observationsPPModalite: widget.avecHData.observationsPPModalite,
      DatabaseHelper.observationsPPNature: widget.avecHData.observationsPPNature,
      DatabaseHelper.observationsPPRepartition: widget.avecHData.observationsPPRepartition,
      DatabaseHelper.observationsSecuriteNuit: widget.avecHData.observationsSecuriteNuit,
      DatabaseHelper.observationsPPSanteHandi: widget.avecHData.observationsPPSanteHandi,
      DatabaseHelper.observationsPPFonctEquipe: widget.avecHData.observationsPPFonctEquipe,
      DatabaseHelper.observationsPPEvalAccueil: widget.avecHData.observationsPPEvalAccueil,
      DatabaseHelper.observationsActivitesType: widget.avecHData.observationsActivitesType,
      DatabaseHelper.observationsPrestataire: widget.avecHData.observationsPrestataire,
      DatabaseHelper.observationsActiviteMineur: widget.avecHData.observationsActiviteMineur,
      DatabaseHelper.observationsRisques: widget.avecHData.observationsRisques,
      DatabaseHelper.observationsEchange: widget.avecHData.observationsEchange,
      DatabaseHelper.observationsFormation: widget.avecHData.observationsFormation,
      DatabaseHelper.radioAqua: widget.avecHData.radioAqua,
      DatabaseHelper.radioAutorisations: widget.avecHData.radioAutorisations,
      DatabaseHelper.radioIsolation: widget.avecHData.radioIsolation,
      DatabaseHelper.observationsIsolation: widget.avecHData.observationsIsolation,
      DatabaseHelper.radioVaccination: widget.avecHData.radioVaccination,
      DatabaseHelper.observationsVaccination: widget.avecHData.observationsVaccination,
      DatabaseHelper.radioAntecedents: widget.avecHData.radioAntecedents,
      DatabaseHelper.observationsAntecedents: widget.avecHData.observationsAntecedents,
      DatabaseHelper.radioMineurTraitement: widget.avecHData.radioMineurTraitement,
      DatabaseHelper.observationsMineurTraitement: widget.avecHData.observationsMineurTraitement,
      DatabaseHelper.radioAllergies: widget.avecHData.radioAllergies,
      DatabaseHelper.observationsAllergies: widget.avecHData.observationsAllergies,
      DatabaseHelper.radioOrdonnances: widget.avecHData.radioOrdonnances,
      DatabaseHelper.observationsOrdonnances: widget.avecHData.observationsOrdonnances,
      DatabaseHelper.radioRegistreSoins: widget.avecHData.radioRegistreSoins,
      DatabaseHelper.observationsRegistreSoins: widget.avecHData.observationsRegistreSoins,
      DatabaseHelper.radioPremierSoins: widget.avecHData.radioPremierSoins,
      DatabaseHelper.observationsPremierSoins: widget.avecHData.observationsPremierSoins,
      DatabaseHelper.radioCommSecours: widget.avecHData.radioCommSecours,
      DatabaseHelper.observationsCommSecours: widget.avecHData.observationsCommSecours,
      DatabaseHelper.radioNumUrgence: widget.avecHData.radioNumUrgence,
      DatabaseHelper.observationsNumUrgence: widget.avecHData.observationsNumUrgence,
      DatabaseHelper.radioCommissionSecu: widget.avecHData.radioCommissionSecu,
      DatabaseHelper.observationsCommissionSecu: widget.avecHData.observationsCommissionSecu,
      DatabaseHelper.radioAssurance: widget.avecHData.radioAssurance,
      DatabaseHelper.observationsAssurance: widget.avecHData.observationsAssurance,
      DatabaseHelper.radioSignaletique: widget.avecHData.radioSignaletique,
      DatabaseHelper.observationsSignaletique: widget.avecHData.observationsSignaletique,
      DatabaseHelper.radioEvacuation: widget.avecHData.radioEvacuation,
      DatabaseHelper.observationsEvacuation: widget.avecHData.observationsEvacuation,
      DatabaseHelper.radioExtincteur: widget.avecHData.radioExtincteur,
      DatabaseHelper.observationsExtincteur: widget.avecHData.observationsExtincteur,
      DatabaseHelper.radioDetecteur: widget.avecHData.radioDetecteur,
      DatabaseHelper.observationsDetecteur: widget.avecHData.observationsDetecteur,
      DatabaseHelper.radioExercice: widget.avecHData.radioExercice,
      DatabaseHelper.observationsExercice: widget.avecHData.observationsExercice,
      DatabaseHelper.radioConditionsMeteo: widget.avecHData.radioConditionsMeteo,
      DatabaseHelper.observationsConditionsMeteo: widget.avecHData.observationsConditionsMeteo,
      DatabaseHelper.radioHygiene: widget.avecHData.radioHygiene,
      DatabaseHelper.observationsHygiene: widget.avecHData.observationsHygiene,
      DatabaseHelper.radioCouchage: widget.avecHData.radioCouchage,
      DatabaseHelper.observationsCouchage: widget.avecHData.observationsCouchage,
      DatabaseHelper.radioHebergeDirection: widget.avecHData.radioHebergeDirection,
      DatabaseHelper.observationsHebergeDirection: widget.avecHData.observationsHebergeDirection,
      DatabaseHelper.radioSanitaire: widget.avecHData.radioSanitaire,
      DatabaseHelper.observationsSanitaire: widget.avecHData.observationsSanitaire,
      DatabaseHelper.radioSieste: widget.avecHData.radioSieste,
      DatabaseHelper.observationsSieste: widget.avecHData.observationsSieste,
      DatabaseHelper.radioEspacesAdapte: widget.avecHData.radioEspacesAdapte,
      DatabaseHelper.observationsEspacesAdapte: widget.avecHData.observationsEspacesAdapte,
      DatabaseHelper.radioRepli: widget.avecHData.radioRepli,
      DatabaseHelper.observationsRepli: widget.avecHData.observationsRepli,
      DatabaseHelper.radioCuisine: widget.avecHData.radioCuisine,
      DatabaseHelper.observationsCuisine: widget.avecHData.observationsCuisine,
      DatabaseHelper.radioSalleResto: widget.avecHData.radioSalleResto,
      DatabaseHelper.observationsSalleResto: widget.avecHData.observationsSalleResto,
      DatabaseHelper.radioPlatsTemoins: widget.avecHData.radioPlatsTemoins,
      DatabaseHelper.observationsPlatsTemoins: widget.avecHData.observationsPlatsTemoins,
      DatabaseHelper.radioTracabilite: widget.avecHData.radioTracabilite,
      DatabaseHelper.observationsTracabilite: widget.avecHData.observationsTracabilite,
      DatabaseHelper.radioStockage: widget.avecHData.radioStockage,
      DatabaseHelper.observationsStockage: widget.avecHData.observationsStockage,
      DatabaseHelper.radioRefrigerateur: widget.avecHData.radioRefrigerateur,
      DatabaseHelper.observationsRefrigerateur: widget.avecHData.observationsRefrigerateur,
      DatabaseHelper.radioPiqueNique: widget.avecHData.radioPiqueNique,
      DatabaseHelper.observationsPiqueNique: widget.avecHData.observationsPiqueNique,
      DatabaseHelper.radioGestion: widget.avecHData.radioGestion,
      DatabaseHelper.observationsGestion: widget.avecHData.observationsGestion,
      DatabaseHelper.radioVeille: widget.avecHData.radioVeille,
      DatabaseHelper.observationsVeille: widget.avecHData.observationsVeille,
      DatabaseHelper.radioPreventionChaleur: widget.avecHData.radioPreventionChaleur,
      DatabaseHelper.observationsPreventionChaleur: widget.avecHData.observationsPreventionChaleur,
      DatabaseHelper.radioEquipement: widget.avecHData.radioEquipement,
      DatabaseHelper.observationsEquipement: widget.avecHData.observationsEquipement,
      DatabaseHelper.radioPieceFraiche: widget.avecHData.radioPieceFraiche,
      DatabaseHelper.observationsPieceFraiche: widget.avecHData.observationsPieceFraiche,      
      DatabaseHelper.radioVentilateurs: widget.avecHData.radioVentilateurs,      
      DatabaseHelper.observationsVentilateurs: widget.avecHData.observationsVentilateurs,
      DatabaseHelper.radioThermo: widget.avecHData.radioThermo,
      DatabaseHelper.observationsThermo: widget.avecHData.observationsThermo,
      DatabaseHelper.radioEauMenus: widget.avecHData.radioEauMenus,
      DatabaseHelper.observationsEauMenus: widget.avecHData.observationsEauMenus,
      DatabaseHelper.radioReserves: widget.avecHData.radioReserves,
      DatabaseHelper.observationsReserves: widget.avecHData.observationsReserves,
      DatabaseHelper.radioOmbre: widget.avecHData.radioOmbre,
      DatabaseHelper.observationsOmbre: widget.avecHData.observationsOmbre,
      DatabaseHelper.radioRafraichissement: widget.avecHData.radioRafraichissement,
      DatabaseHelper.observationsRafraichissement: widget.avecHData.observationsRafraichissement,
      DatabaseHelper.radioGesteBarriere: widget.avecHData.radioGesteBarriere,
      DatabaseHelper.observationsGesteBarriere: widget.avecHData.observationsGesteBarriere,
      DatabaseHelper.radioGestionPosteriori: widget.avecHData.radioGestionPosteriori,
      DatabaseHelper.observationsGestionPosteriori: widget.avecHData.observationsGestionPosteriori,
      DatabaseHelper.appreciationGenerale: widget.avecHData.appreciationGenerale,
      DatabaseHelper.prescriptionsEcheances: widget.avecHData.prescriptionsEcheances,
      DatabaseHelper.copyTo: widget.avecHData.CopyToTest,
      DatabaseHelper.controllername: widget.avecHData.controllerName,
      DatabaseHelper.dateDuControle: widget.avecHData.dateDuControle.millisecondsSinceEpoch,
      DatabaseHelper.signatureAuthorite: widget.avecHData.signatureAuthorite.join('|'),

    };

    final id = await DatabaseHelper().insertAH(row); // insertion dans la DB AH de row

    for (var compteur = 0; compteur <= widget.avecHData.activitesSecu!.length-1 ; compteur++){ // Boucle ajout DB des activités
    Map<String, dynamic> rowactivite = {
      DatabaseHelper.formSHId: id,
      DatabaseHelper.nomActivite: widget.avecHData.activitesSecu![compteur].nomActivite,
      DatabaseHelper.categorie: widget.avecHData.activitesSecu![compteur].categorie,
      DatabaseHelper.typeActivite: widget.avecHData.activitesSecu![compteur].typeActivite.join('|'),
      DatabaseHelper.encadrantNomPrenom: widget.avecHData.activitesSecu![compteur].encadrantNomPrenom,
      DatabaseHelper.encadrantQualif: widget.avecHData.activitesSecu![compteur].encadrantQualif,
      DatabaseHelper.numCartePro: widget.avecHData.activitesSecu![compteur].numCartePro
    };
    try {
     print("Attempting to insert: $rowactivite");
      final activites = await DatabaseHelper().insertActivite(rowactivite);
     print('Inserted row id: $activites');
    } catch (err) {
      print("Error during insert: $err");
    }
    }

    Navigator.push(context, MaterialPageRoute(builder: (_) => const Data()));
  
  }

}

//___________________________SECTIONS______________________________________//

class FirstSection extends StatefulWidget {
  final AvecHData avecHData;
  const FirstSection(this.avecHData, {super.key});

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
    _visiteRealiseeParController.text = widget.avecHData.visiteRealiseePar; // Affiche la valeur initiale
    _enPresenceDeController.text = widget.avecHData.enPresenceDe;
    _dateVisiteController.text = DateFormat('dd/MM/yyyy').format(widget.avecHData.dateVisite);
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
                widget.avecHData.visiteRealiseePar = value;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            labelText: 'En présence de :',
            controller: _enPresenceDeController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.enPresenceDe = value;
              });            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Date de la visite :',
            controller: _dateVisiteController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.avecHData.dateVisite = selectedDate;
              });            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SecondSection extends StatefulWidget {
  final AvecHData avecHData;
  const SecondSection(this.avecHData, {super.key});
  
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
    _denominationController.text = widget.avecHData.denomination;// Affiche la valeur initiale
    _adresseController.text = widget.avecHData.adresse;
    _lieuController.text = widget.avecHData.lieu;
    _numeroDeclarationController.text = widget.avecHData.numeroDeclaration;
    _startDateController.text = DateFormat('dd/MM/yyyy').format(widget.avecHData.startDate);
    _endDateController.text = DateFormat('dd/MM/yyyy').format(widget.avecHData.endDate);
    
    _observationsController227_5.text = widget.avecHData.observations227_5;
    _observationsController227_29.text = widget.avecHData.observations227_29;
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
              widget.avecHData.denomination = value;
            });
          },),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Adresse du siège ou du domicile de l\'organisateur', 
          controller: _adresseController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.adresse = value;
            });
          },),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Lieu et adresse du déroulement de l\'ACM', 
          controller: _lieuController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.lieu = value;
            });
          },),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'N° de déclaration', 
          controller: _numeroDeclarationController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.numeroDeclaration = value;
            });            
          },),
          const SizedBox(height: 20),

          // Champs de date
          DateField(
            labelText: 'Date du début de l\'ACM',
            controller: _startDateController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.avecHData.startDate = selectedDate;
              });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Date de fin de l\'ACM',
            controller: _endDateController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.avecHData.endDate = selectedDate;
              });
            },
          ),
          const SizedBox(height: 20),

          // Groupes de boutons radio
          CheckboxGroup(
            title: "Type d'accueil:",
            defaultChoices: widget.avecHData.radioTypeAccueil,
            choices: const ['Séjour de vacances', 'Séjour court', 'Séjour spécifique (sportif – linguistique –  artistique et culturel – rencontre européenne de jeunes – chantier de jeunes bénévoles – rencontre soutenue par l’OFAJ)',
            'Séjour dans une famille', 'Séjour de scoutisme', 'Activité accessoire à un ALSH'],
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioTypeAccueil = value;
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
            defaultChoice: widget.avecHData.radio227_5,
            referenceText: 'Réf. :\n     Art. L. 227-5 CASF : « Les personnes organisant [des ACM et exploitant des locaux d’ACM] '
            'sont tenues de souscrire un contrat d’assurance garantissant les conséquences pécuniaires de leur responsabilité civile, '
            'ainsi que de celle de leurs préposés et des participants aux activités qu’elles proposent. Les assurés sont tiers entre eux ».',
            choices: const ['Oui', 'Non', 'Non vérifié'],
            onChanged: (value) {
              setState(() {
                widget.avecHData.radio227_5 = value;
              });
            },
          ),
          const SizedBox(height: 10),

          // Champ de texte long
          LongTextField(labelText: 'Observations', controller: _observationsController227_5,
          onChanged: (value) {
            setState(() {
              widget.avecHData.observations227_5 = value;
            });            
          },),
          const SizedBox(height: 20),
          

          // Groupes de boutons radio
          RadioGroup(
            title: 'Présenté:',
            defaultChoice: widget.avecHData.radio227_29,
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
                widget.avecHData.radio227_29 = value;
              });
            },
          ),
          const SizedBox(height: 10),

          // Champ de texte long
          LongTextField(labelText: 'Observations', controller: _observationsController227_29,
          onChanged: (value) {
            setState(() {
              widget.avecHData.observations227_29 = value;
            });            
          },),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ThirdSection extends StatefulWidget {
  final AvecHData avecHData;
  const ThirdSection(this.avecHData, {super.key});
  
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
  //int totalDeclares;
  //int totalPresents;
  //int totalHandi;  
  int _totalDeclares = 0;
  int _totalPresents = 0;
  int _totalHandi = 0;

  @override
  void initState() {
    super.initState();
    _capaciteAccueilController.text = widget.avecHData.capaciteAccueil;
    _moinsDe6AnsDeclaresController.text = widget.avecHData.moinsDe6AnsDeclares;
    _entre6et13AnsDeclaresController.text = widget.avecHData.entre6et13AnsDeclares;
    _entre14et17AnsDeclaresController.text = widget.avecHData.entre14et17AnsDeclares;
    _moinsDe6AnsPresentsController.text = widget.avecHData.moinsDe6AnsPresents;
    _entre6et13AnsPresentsController.text = widget.avecHData.entre6et13AnsPresents;
    _entre14et17AnsPresentsController.text = widget.avecHData.entre14et17AnsPresents;
    _moinsDe6AnsHandiController.text = widget.avecHData.moinsDe6AnsHandi;
    _entre6et13AnsHandiController.text = widget.avecHData.entre6et13AnsHandi;
    _entre14et17AnsHandiController.text = widget.avecHData.entre14et17AnsHandi;
    _totalDeclaresController.text = widget.avecHData.totalDeclares;
    _totalPresentsController.text = widget.avecHData.totalPresents;
    _totalHandiController.text = widget.avecHData.totalHandi;
    _capaciteAccueilController.text = widget.avecHData.capaciteAccueil;
    _observations2324_13Controller.text = widget.avecHData.observations2324_13;
    _observations2324_14Controller.text = widget.avecHData.observations2324_14;
    _observationsRegistreMineursController.text = widget.avecHData.observationsRegistreMineur;
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
              widget.avecHData.capaciteAccueil = value;
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
          Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    CustomNumberField(
      labelText: '- de 6 ans',
      controller: _moinsDe6AnsDeclaresController,
      onChanged: (value) {
        setState(() {
          widget.avecHData.moinsDe6AnsDeclares = value.toString();
          _calculateTotalDeclares();
        });
      },
    ),
    CustomNumberField(
      labelText: '6 - 13 ans',
      controller: _entre6et13AnsDeclaresController,
      onChanged: (value) {
        setState(() {
          widget.avecHData.entre6et13AnsDeclares = value.toString();
          _calculateTotalDeclares();
        });
      },
    ),
    CustomNumberField(
      labelText: '14 - 17 ans',
      controller: _entre14et17AnsDeclaresController,
      onChanged: (value) {
        setState(() {
          widget.avecHData.entre14et17AnsDeclares = value.toString();
          _calculateTotalDeclares();
        });
      },
    ),
    TextFormField(
      readOnly: true,
      controller: _totalDeclaresController,
      decoration: const InputDecoration(
        labelText: 'Total',
      ),
    ),
    const SizedBox(height: 20),
    const Text('Présents'),
    const SizedBox(height: 10),
    CustomNumberField(
      labelText: '- de 6 ans',
      controller: _moinsDe6AnsPresentsController,
      onChanged: (value) {
        setState(() {
          widget.avecHData.moinsDe6AnsPresents = value.toString();
          _calculateTotalPresents();
        });
      },
    ),
    CustomNumberField(
      labelText: '6 - 13 ans',
      controller: _entre6et13AnsPresentsController,
      onChanged: (value) {
        setState(() {
          widget.avecHData.entre6et13AnsPresents = value.toString();
          _calculateTotalPresents();
        });
      },
    ),
    CustomNumberField(
      labelText: '14 - 17 ans',
      controller: _entre14et17AnsPresentsController,
      onChanged: (value) {
        setState(() {
          widget.avecHData.entre14et17AnsPresents = value.toString();
          _calculateTotalPresents();
        });
      },
    ),
    TextFormField(
      readOnly: true,
      controller: _totalPresentsController,
      decoration: const InputDecoration(
        labelText: 'Total',
      ),
    ),
    const SizedBox(height: 20),
    const Text('Présence de mineurs en situation de handicap'),
    const SizedBox(height: 10),
    CustomNumberField(
      labelText: '- de 6 ans',
      controller: _moinsDe6AnsHandiController,
      onChanged: (value) {
        setState(() {
          widget.avecHData.moinsDe6AnsHandi = value.toString();
          _calculateTotalHandi();
        });
      },
    ),
    CustomNumberField(
      labelText: '6 - 13 ans',
      controller: _entre6et13AnsHandiController,
      onChanged: (value) {
        setState(() {
          widget.avecHData.entre6et13AnsHandi = value.toString();
          _calculateTotalHandi();
        });
      },
    ),
    CustomNumberField(
      labelText: '14 - 17 ans',
      controller: _entre14et17AnsHandiController,
      onChanged: (value) {
        setState(() {
          widget.avecHData.entre14et17AnsHandi = value.toString();
          _calculateTotalHandi();
        });
      },
    ),
    TextFormField(
      readOnly: true,
      controller: _totalHandiController,
      decoration: const InputDecoration(
        labelText: 'Total',
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
            defaultChoice: widget.avecHData.radio2324_13,
            choices: const ['Oui', 'Non', 'Non vérifié'],
            onChanged: (value) {
              setState(() {
                widget.avecHData.radio2324_13 = value;
              });
            },
          ),
          const SizedBox(height: 20),

          LongTextField(labelText: 'Observations', controller: _observations2324_13Controller,
          onChanged: (value) {
              setState(() {
                widget.avecHData.observations2324_13= value;
              });           
          },),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Réf. : Art. R. 2324-14 CASF',
            defaultChoice: widget.avecHData.radio2324_14,
            choices: const ['Oui', 'Non', 'Non vérifié'],
            onChanged: (value) {
              setState(() {
                widget.avecHData.radio2324_14 = value;
              });
            },
          ),
          const SizedBox(height: 20),
          // Champ de texte long
          LongTextField(labelText: 'Observations', controller: _observations2324_14Controller,
          onChanged: (value) {
              setState(() {
                widget.avecHData.observations2324_14= value;
              });           
          },),

          const SizedBox(height: 20),
          // Groupement de boutons radio
          RadioGroup(
            title: 'Registre de présence des mineurs',
            defaultChoice: widget.avecHData.radioRegistreMineur,
            choices: const ['Oui', 'Non', 'Non vérifié'],
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioRegistreMineur = value;
              });
            },
          ),
          const SizedBox(height: 20),

          // Champ de texte long
          LongTextField(labelText: 'Observations', controller: _observationsRegistreMineursController,
          onChanged: (value) {
              setState(() {
                widget.avecHData.observationsRegistreMineur= value;
              });           
          },),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  
  void _calculateTotalDeclares() {
    setState(() {
      _totalDeclares = _parseOrZero(widget.avecHData.moinsDe6AnsDeclares) 
                     + _parseOrZero(widget.avecHData.entre6et13AnsDeclares) 
                     + _parseOrZero(widget.avecHData.entre14et17AnsDeclares);
      _totalDeclaresController.text = _totalDeclares.toString();
      widget.avecHData.totalDeclares = _totalDeclares.toString();
    });
  }

  void _calculateTotalPresents() {
    setState(() {
      _totalPresents = _parseOrZero(widget.avecHData.moinsDe6AnsPresents) 
                     + _parseOrZero(widget.avecHData.entre6et13AnsPresents) 
                     + _parseOrZero(widget.avecHData.entre14et17AnsPresents);
      _totalPresentsController.text = _totalPresents.toString();
      widget.avecHData.totalPresents = _totalPresents.toString();
    });
  }

  void _calculateTotalHandi() {
    setState(() {
      _totalHandi = _parseOrZero(widget.avecHData.moinsDe6AnsHandi) 
                  + _parseOrZero(widget.avecHData.entre6et13AnsHandi) 
                  + _parseOrZero(widget.avecHData.entre14et17AnsHandi);
      _totalHandiController.text = _totalHandi.toString();
      widget.avecHData.totalHandi = _totalHandi.toString();
    });
  }

  void _updateTotalEnfantsControllers() {
    _totalDeclaresController.text = _totalDeclares.toString();
    _totalPresentsController.text = _totalPresents.toString();
    _totalHandiController.text = _totalHandi.toString();
  }

  int _parseOrZero(String value) {          //retourne 0 si int.parse ne peut pas être réalisé
    return int.tryParse(value) ?? 0;
  }
} 

class FourthSection extends StatefulWidget {
  final AvecHData avecHData;
  
  const FourthSection(this.avecHData, {super.key});
  
  @override
  _FourthSectionState createState() => _FourthSectionState();
}

class _FourthSectionState extends State<FourthSection> {
  final _directeurNomController = TextEditingController();
  final _directeurPrenomController = TextEditingController();
  final _directeurQualifController = TextEditingController();
  final _adjointNomController = TextEditingController();
  final _adjointPrenomController = TextEditingController();
  final _adjointQualifController = TextEditingController();
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

  final _observations227_2Controller = TextEditingController();
  final _observations3_8Controller = TextEditingController();
  final _observations9_02_07Controller = TextEditingController();
  final _observations227_8Controller = TextEditingController();
  final _observationsSuiviSanitaireController = TextEditingController();
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
      _directeurNomController.text = widget.avecHData.directeurNom;
      _directeurPrenomController.text = widget.avecHData.directeurPrenom;
      _directeurQualifController.text = widget.avecHData.directeurQualification;
      _adjointNomController.text = widget.avecHData.adjointNom;
      _adjointPrenomController.text = widget.avecHData.adjointPrenom;
      _adjointQualifController.text = widget.avecHData.adjointQualif;
      _dateRenouvellementController.text = widget.avecHData.dateRenouvellement.toString();
      _dateDebutFormationController.text = widget.avecHData.dateDebutFormation.toString();
      _dateStartDerogationController.text = widget.avecHData.dateStartDerogation .toString();
      _dateEndDerogationController.text = widget.avecHData.dateEndDerogation .toString();
      _nombreAnimQualifController.text = widget.avecHData.nombreAnimQualif;
      _nombreAnimStagiairesController.text = widget.avecHData.nombreAnimStagiaires;
      _nombreAnimNonQualifController.text = widget.avecHData.nombreAnimNonQualif;
      _totalAnimController.text = widget.avecHData.totalAnim;
      _encadrementRequisMoinsDe6Controller.text = widget.avecHData.encadrementRequisMoinsDe6;
      _encadrementRequisPlusDe6Controller.text = widget.avecHData.encadrementRequisPlusDe6;
      _totalAnimRequisController.text = widget.avecHData.totalAnimRequis;
      _observations227_2Controller.text = widget.avecHData.observations227_2;
      _observations3_8Controller.text = widget.avecHData.observationsArrete3_5;
      _observations9_02_07Controller.text = widget.avecHData.observations9_02_07;
      _observations227_8Controller.text = widget.avecHData.observations227_8;
      _observationsSuiviSanitaireController.text = widget.avecHData.observationsSuiviSanitaire;
      _observationsCommunicationOrganisateurController.text = widget.avecHData.observationsCommunicationOrganisateur;
      _observationsSavoirComportementController.text = widget.avecHData.observationsSavoirComportement;
      _observationsQualifPersonnelController.text = widget.avecHData.observationsQualifPersonnel;
      _observationsTempsDePrepController.text = widget.avecHData.observationsTempsDePrep;
      _observationsReuBilan.text = widget.avecHData.observationsReuBilan;
      _observationsEvalStg.text = widget.avecHData.observationsEvalStg;
      _calculateTotalAnimators();
      _calculateTotalRequiredAnimators();
      _updateTotalControllers();
  }

  @override
  void dispose() {
    _directeurNomController.dispose();
    _directeurPrenomController.dispose();
    _directeurQualifController.dispose();
    _adjointNomController.dispose();
    _adjointPrenomController.dispose();
    _adjointQualifController.dispose();
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
    _observationsSuiviSanitaireController.dispose();
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
              widget.avecHData.directeurNom = value;
            });
          }),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Prénom', controller: _directeurPrenomController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.directeurPrenom = value;
            });
          }),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Qualification', controller: _directeurQualifController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.directeurQualification = value;
            });
          }),
          const SizedBox(height: 10),
          RadioGroup(
            title: '',
            defaultChoice: widget.avecHData.radioTitulaireStagiaire,
            choices: const ['Titulaire', 'Stagiaire'],
            onChanged: (value) {
            setState(() {
              widget.avecHData.radioTitulaireStagiaire = value;
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
              widget.avecHData.dateRenouvellement = selectedDate;
            });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Stagiaire BAFD, date de début de formation',
            controller: _dateDebutFormationController,
            onDateSelected: (DateTime selectedDate) {
            setState(() {
              widget.avecHData.dateDebutFormation = selectedDate;
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
              widget.avecHData.dateStartDerogation = selectedDate;
            });
            },
          ),
          const SizedBox(height: 10),
          DateField(
            labelText: 'Fin de la période',
            controller: _dateEndDerogationController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
              widget.avecHData.dateEndDerogation = selectedDate;
            });
            },
          ),
          const SizedBox(height: 20),
          const Text('Directeur Adjoint',
            style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),
          const Text('Il est obligatoire d’avoir 1 adjoint par tranche de 50 mineurs au-dela de 100 mineurs.',
            style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'NOM', controller: _adjointNomController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.adjointNom = value;
            });
          }),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Prénom', controller: _adjointPrenomController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.adjointPrenom = value;
            });
          }),
          const SizedBox(height: 10),
          CustomTextField(labelText: 'Qualification', controller: _adjointQualifController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.adjointQualif = value;
            });
          }),
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
                widget.avecHData.nombreAnimQualif= value.toString();
                _calculateTotalAnimators();
              });
            },
            
          ),
          const SizedBox(height: 10),
          CustomNumberField(
            labelText: 'Nombre d\'animateurs stagiaires',
            onChanged: (value) {
              setState(() {
                widget.avecHData.nombreAnimStagiaires= value.toString();
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
                widget.avecHData.nombreAnimNonQualif= value.toString();
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
                widget.avecHData.encadrementRequisMoinsDe6= value.toString();
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
                widget.avecHData.encadrementRequisPlusDe6= value.toString();                
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
            defaultChoice: widget.avecHData.radio227_2,
            referenceText: 'Art. R. 227-2 CASF : " Toute personne organisant [un ACM] doit en faire préalablement la déclaration au représentant de l\'Etat dans le département ".',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            onChanged: (value) {
              setState(() {
                widget.avecHData.radio227_2= value;                
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations227_2Controller,
          onChanged: (value) {
            setState(() {
              widget.avecHData.observations227_2 = value;
            });
          }),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Sincérité de la déclaration (nombre de mineurs, encadrement, période, lieu, etc.):',
            defaultChoice: widget.avecHData.radioArrete3_5,
            referenceText:  'Réf. :\n'
            'Arreté du 3 novembre 2014, article 8 : " L\'organisateur porte immédiatement par écrit à la connaissance du préfet qui a reçu la déclaration toute modification intervenue dans les éléments de la fiche initiale ou des fiches complémentaires ".\n'
            'NB :\n'
            '- Noter le nom de tout animateur, personnel, intervenant ou prestataire (en contact avec les mineurs) qui ne serait pas sur la déclaration.\n'
            '- La sincérité est controlée par rapport à la déclaration sur Gam-Tam (et non le récépissé).',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioArrete3_5= value;                
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations3_8Controller,
          onChanged: (value) {
            setState(() {
              widget.avecHData.observationsArrete3_5 = value;
            });
          }),
          const SizedBox(height: 20),
                    
          RadioGroup(
            title: 'Diplôme de l\'équipe:',
            referenceText: 'NB :\n'
            '- Noter le nom de tout animateur, personnel, intervenant ou prestataire (en contact avec les mineurs) qui ne serait pas sur la déclaration.\n'
            '- La sincérité est controlée par rapport à la déclaration sur Gam-Tam (et non le récépissé).',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radio9_02_07,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radio9_02_07= value;
              });
            }
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations9_02_07Controller,
          onChanged: (value) {
            setState(() {
              widget.avecHData.observations9_02_07 = value;
            });
          }),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Attestation de vaccination de chacun des membres de l\'équipe:',
            referenceText: 'Réf. :\n'
            'Art. R. 227-8 CASF : " Les personnes qui participent à [un ACM] doivent produire, avant leur entrée en fonction, un document attestant qu\'elles ont satisfait aux obligations légales en matière de vaccination. "',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radio227_8,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radio227_8 = value;
              });
            }
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observations227_8Controller,
          onChanged: (value) {
            setState(() {
              widget.avecHData.observations227_8 = value;
            });
          }),
          const SizedBox(height: 20),

          RadioGroup(
            title: 'Nom et qualification de la personne désignée pour assurer le suivi sanitaire:',
            referenceText: 'Réf. :\n'
            'Au titre de l\'arrêté du 20 février 2003, cette personne est titulaire de l\'AFPS ou du PSC1.',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioSuiviSanitaire,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioSuiviSanitaire = value;
              });
            }
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observationsSuiviSanitaireController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.observationsSuiviSanitaire = value;
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
              widget.avecHData.observationsCommunicationOrganisateur = value;
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
              widget.avecHData.observationsSavoirComportement = value;
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
              widget.avecHData.observationsQualifPersonnel = value;
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
              widget.avecHData.observationsTempsDePrep = value;
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
              widget.avecHData.observationsReuBilan = value;
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
              widget.avecHData.observationsEvalStg = value;
            });
          }),
        ],
      ),
    );
  }

  void _calculateTotalAnimators() {
    setState(() {
      _totalAnimators = _parseOrZero(widget.avecHData.nombreAnimQualif) 
                        + _parseOrZero(widget.avecHData.nombreAnimStagiaires) 
                        + _parseOrZero(widget.avecHData.nombreAnimNonQualif);
      _totalAnimController.text = _totalAnimators.toString();
      widget.avecHData.totalAnim = _totalAnimators.toString();
    });
  }

  void _calculateTotalRequiredAnimators() {
    setState(() {
      _totalRequiredAnimators = _parseOrZero(widget.avecHData.encadrementRequisPlusDe6) 
                                + _parseOrZero(widget.avecHData.encadrementRequisMoinsDe6) ;
      _totalAnimRequisController.text = _totalRequiredAnimators.toString();
      widget.avecHData.totalAnimRequis = _totalRequiredAnimators.toString();

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
  final AvecHData avecHData;
  
  const FifthSection(this.avecHData, {super.key});
  
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
      _educationalProjectController.text = widget.avecHData.observationsProjEdu;
      _pedagogicalProjectController.text = widget.avecHData.observationsProjPeda;
      _projectsCommunicatedController.text = widget.avecHData.observationsRepresentant;
      _directorKnowledgeOfPEController.text = widget.avecHData.observationsPE;
      _directorKnowledgeOfResourcesController.text = widget.avecHData.observationsMoyens;
      _teamResourcesAdequateController.text = widget.avecHData.observationsMoyensEquipe;
      _directorBudgetAutonomyController.text = widget.avecHData.observationsBudget;
      _preciseEducationalOrientationController.text = widget.avecHData.observationsOrientation;
      _PEFromDiagnosticController.text = widget.avecHData.observationsDiagnostic;
      _PEInYouthPolicyController.text = widget.avecHData.observationsPolitique;
      _PERevisionDetailsController.text = widget.avecHData.observationsReorientation;
      _ppCoherenceController.text = widget.avecHData.observationsPPCoherence;
      _ppCharacteristicsController.text = widget.avecHData.observationsPPCara;
      _ppElaborationController.text = widget.avecHData.observationsPPConcertation;
      _ppAccommodationController.text = widget.avecHData.observationsPPModalite;
      _ppActivityDetailsController.text = widget.avecHData.observationsPPNature;
      _ppActivityDistributionController.text = widget.avecHData.observationsPPRepartition;
      _nightSecurityController.text = widget.avecHData.observationsSecuriteNuit;
      _ppHealthMeasuresController.text = widget.avecHData.observationsPPSanteHandi;
      _ppTeamFunctioningController.text = widget.avecHData.observationsPPFonctEquipe;
      _ppEvaluationMethodsController.text = widget.avecHData.observationsPPEvalAccueil;
      _observationsCoherenceController.text = widget.avecHData.observationsPPCoherence;
      _activitiesPreparationController.text = widget.avecHData.observationsPPConcertation;
      _activitiesChoiceController.text = widget.avecHData.observationsActiviteMineur;
      _activitiesRisksAnalysisController.text = widget.avecHData.observationsRisques;
      _activitiesExchangeController.text = widget.avecHData.observationsEchange;
      _activitiesTrainingNeedsController.text = widget.avecHData.observationsFormation;

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
            defaultChoice: widget.avecHData.radioProjEdu,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioProjEdu = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _educationalProjectController,
          onChanged: (value) {
              setState(() {
                widget.avecHData.observationsProjEdu = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Le projet pédagogique:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioProjPeda,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioProjPeda = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _pedagogicalProjectController,
          onChanged: (value) {
              setState(() {
                widget.avecHData.observationsProjPeda = value;
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
            defaultChoice: widget.avecHData.radioRepresentant,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioRepresentant = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _projectsCommunicatedController,
          onChanged: (value) {
              setState(() {
                widget.avecHData.observationsRepresentant = value;
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
                widget.avecHData.observationsPE = value;
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
                widget.avecHData.observationsMoyens = value;
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
                widget.avecHData.observationsMoyensEquipe = value;
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
                widget.avecHData.observationsBudget = value;
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
                widget.avecHData.observationsOrientation = value;
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
                widget.avecHData.observationsDiagnostic = value;
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
                widget.avecHData.observationsPolitique = value;
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
                widget.avecHData.observationsReorientation = value;
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
                        widget.avecHData.observationsPPCoherence = value;
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
                        widget.avecHData.observationsPPCara = value;
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
                        widget.avecHData.observationsPPConcertation = value;
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
                        widget.avecHData.observationsPPModalite = value;
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
                        widget.avecHData.observationsPPNature = value;
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
                        widget.avecHData.observationsPPRepartition = value;
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
                        widget.avecHData.observationsSecuriteNuit = value;
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
                        widget.avecHData.observationsPPSanteHandi = value;
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
                        widget.avecHData.observationsPPFonctEquipe = value;
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
                        widget.avecHData.observationsPPEvalAccueil = value;
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
                        widget.avecHData.observationsPPCoherence = value;
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
                        widget.avecHData.observationsPPConcertation = value;
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
                        widget.avecHData.observationsActiviteMineur = value;
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
                        widget.avecHData.observationsRisques = value;
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
                        widget.avecHData.observationsEchange = value;
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
                        widget.avecHData.observationsFormation = value;
                      });
                    },),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),

        SecuriteActivitesPhysiques(widget.avecHData), // Bloc Sécurité des activités physiques et sportives 

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
          defaultChoice: widget.avecHData.radioAqua,
          onChanged: (value) {
            setState(() {
                        widget.avecHData.radioAqua = value;
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
          defaultChoice: widget.avecHData.radioAutorisations,
          onChanged: (value) {
            setState(() {
              widget.avecHData.radioAutorisations = value;
            });
          },
        ), 
        ],
      ),
    );
  }
}
/* 
class SecuriteActivitesPhysiques extends StatefulWidget {
  final AvecHData avecHData;
  
  SecuriteActivitesPhysiques(this.avecHData);

  @override
  _SecuriteActivitesPhysiquesState createState() =>
      _SecuriteActivitesPhysiquesState();
}

// Classe pour l'affichage du bloc "Sécurite des activités physiques et sportives" permetant de déclarer un nombre libre d'activités de 3 catégories
class _SecuriteActivitesPhysiquesState
    extends State<SecuriteActivitesPhysiques> {
  // Contrôleurs pour l'étape 2
  final _nomActiviteController = TextEditingController();
  final _encadrantNomPrenomACMController = TextEditingController();
  final _encadrantQualifACMController = TextEditingController();

  // Contrôleurs pour l'étape 3
  final _denomEtablissmentController = TextEditingController();
  final _encadrantNomPrenomPrestaController = TextEditingController();
  final _encadrantQualifPrestaController = TextEditingController();
  final _numCarteProPrestaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialisation des contrôleurs
    _nomActiviteController.text = widget.avecHData.nomActivite;
    _encadrantNomPrenomACMController.text = widget.avecHData.encadrantNomPrenomACM;
    _encadrantQualifACMController.text = widget.avecHData.encadrantQualifACM;
    _denomEtablissmentController.text = widget.avecHData.nomActivite;
    _encadrantNomPrenomPrestaController.text = widget.avecHData.encadrantNomPrenomPresta;
    _encadrantQualifPrestaController.text = widget.avecHData.encadrantQualifPresta;
    _numCarteProPrestaController.text = widget.avecHData.numCarteProPresta;
  }

  @override
  void dispose() {
    _nomActiviteController.dispose();
    _encadrantNomPrenomACMController.dispose();
    _encadrantQualifACMController.dispose();
    _encadrantNomPrenomPrestaController.dispose();
    _encadrantNomPrenomPrestaController.dispose();
    _encadrantQualifPrestaController.dispose();
    _numCarteProPrestaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Sécurité des activités physiques et sportives (Circulaire n° DJEPVA/DJEPVAA3/DS/DSC2/2012/210 du 30 mai 2012)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        LongTextField(labelText: 'Noms de la ou des activités proposées (à dupliquer pour chaque activité) :', controller: _nomActiviteController,
        onChanged: (value) {
            setState(() {
              widget.avecHData.nomActivite = value;
            });
          },
        ),
        Text(
          'Etape 1',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
        ),
        // CheckboxGroup pour l'étape 1
        CheckboxGroup(
          title: 'L’activité proposée est:',
          referenceText: 'NB :\n '
                         '* seule une des 3 cases est à cocher.\n'
                         '* Il faut raisonner de la manière suivante : d’abord vérifier s’il s’agit d’une activité en annexe de l’arrêté de 2012 ; puis, si ce n’est pas le cas, vérifier s’il s’agit d’une activité physique ou sportive en fonction des critères ci-contre.',
          defaultChoices: widget.avecHData.checkEtape1ActiviteType,
          choices: [
            'Une activité figurant en annexe de l’arrêté du 25 avril 2012',
            'Une activité physique répondant aux critères cumulatifs suivants :\n'
            '* elle ne présente pas de risque spécifique ;\n'
            '* elle a une finalité ludique, récréative ou liée à la nécessité de se déplacer ;\n'
            '* elle est proposée sans objectif d’acquisition d’un niveau technique ni de performance ;\n'
            '* sa pratique n’est pas intensive ;\n'
            '* dans les accueils de loisirs, elle n’est pas exclusive d’autres activités ;\n'
            '* elle est accessible à l’ensemble des membres du groupe ;\n'
            '* elle est mise en œuvre dans des conditions de pratique et d’environnement adaptées au public en fonction de ses caractéristiques\n',
            'Une activité sportive (ne répondant pas à l’un des critères permettant de qualificatif d’une activité physique)'],
          onChanged: (value) {
            setState(() {
              widget.avecHData.checkEtape1ActiviteType = value;
            });
          },
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),

        Text(
          'Etape 2 (le cas échéant)',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
        ),
        Text(
          'Dans le cas où il s’agit d’une activité figurant en annexe de l’arrêté de 2012 ou d’une activité sportive : ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'NB :'
          '* une activité figurant en annexe de l’arrêté de 2012 ou une activité sportive doit être encadrée par un animateur ou intervenant disposant d’une qualification idoine.'
          '* une simple activité physique peut être encadrée par tout animateur titulaire',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),

        SizedBox(height: 30),
        // TextFields pour l'étape 2
        Text(
          'Si l’activité est organisée directement par l’ACM',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
              labelText: 'Nom et prénom de l’encadrant :',
            ),
          controller: _encadrantNomPrenomACMController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.encadrantNomPrenomACM = value;
            });
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: _encadrantQualifACMController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.encadrantQualifACM = value;
            });
          },
          decoration: InputDecoration(labelText: 'Qualification permettant l’encadrement de l’activité:'),
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        Text(
          'Si l’activité est organisée via une prestation (à titre onéreux ou gratuit)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        // TextFields pour l'étape 3
        Text(
          'Dénomination de l’établissement d’activité physique ou sportive réalisant la prestation:',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: _denomEtablissmentController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.denomEtablissement = value;
            });
          },
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: _encadrantNomPrenomPrestaController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.encadrantNomPrenomPresta = value;
            });
          },
          decoration: InputDecoration(labelText: 'Nom et prénom de l’encadrant:'),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: _encadrantQualifPrestaController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.encadrantQualifPresta = value;
            });
          },
          decoration: InputDecoration(labelText: 'Qualification permettant l’encadrement de l’activité:'),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: _numCarteProPrestaController,
          onChanged: (value) {
            setState(() {
              widget.avecHData.numCarteProPresta = value;
            });
          },
          decoration: InputDecoration(labelText: 'Si vérification, numéro de la carte professionnelle:'),
        ),
      ],
    );
  }
} */



class MiniBusSection extends StatefulWidget {
  final AvecHData avecHData;

  const MiniBusSection (this.avecHData, {super.key});

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
            defaultChoice: widget.avecHData.radioUtilisationMinibus,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioUtilisationMinibus = value;
              });
            },
          ),

          const SizedBox(height: 20),
          
          RadioGroup(
            title: "Les transports en commun sont privilégiés",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.avecHData.radioTransportsCommuns,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioTransportsCommuns = value;
              });
            },
          ),
         
          const SizedBox(height: 20),

          RadioGroup(
            title: "Pour les longs trajets des carnets de routes sont prévus",
            referenceText: "(itinéraire, temps de trajet, temps de pause, rotation des conducteurs). \n"
            "Pauses: impératives au moins toutes les deux heures et doivent durer minimum 15 minutes.",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.avecHData.radioCarnetsRoute,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioCarnetsRoute = value;
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
            defaultChoice: widget.avecHData.radioConnaissanceSecurite,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioConnaissanceSecurite = value;
              });
            },
          ),

          const SizedBox(height: 20),

          RadioGroup(
            title: "S'assurer que le conducteur présente des qualités de conduite en sécurité",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.avecHData.radioQualiteConduite,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioQualiteConduite = value;
              });
            },
          ),

          const SizedBox(height: 20),

          RadioGroup(
            title: "L'organisateur et le directeur sont attentifs aux conditions de travail et à l'état de fatigue des animateurs.",
            choices: const ['OUI', 'NON', 'En projet'],
            defaultChoice: widget.avecHData.radioConditionsTravail,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioConditionsTravail = value;
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
  final AvecHData avecHData;
  
  const SixthSection(this.avecHData, {super.key});
  
  @override
  _SixthSectionState createState() => _SixthSectionState();
}

class _SixthSectionState extends State<SixthSection> {
  final _isolationObservationsController = TextEditingController();
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
      _isolationObservationsController.text = widget.avecHData.observationsIsolation;
      _vaccinationCertificateObservationsController.text = widget.avecHData.observationsVaccination;
      _medicalHistoryDocumentsObservationsController.text = widget.avecHData.observationsAntecedents;
      _medicalTreatmentIdentificationObservationsController.text = widget.avecHData.observationsMineurTraitement;
      _teamInformedAllergiesObservationsController.text = widget.avecHData.observationsAllergies;
      _medicinesStoredSecurelyObservationsController.text = widget.avecHData.observationsOrdonnances;
      _careRegisterUpdatedObservationsController.text = widget.avecHData.observationsRegistreSoins;
      _firstAidKitsCompleteObservationsController.text = widget.avecHData.observationsPremierSoins;
      _emergencyCommunicationMeansObservationsController.text = widget.avecHData.observationsCommSecours;
      _emergencyContactListAvailableObservationsController.text = widget.avecHData.observationsNumUrgence;
  }

  @override
  void dispose() {
    _isolationObservationsController.dispose();
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
            title: 'Identification d’un lieu permettant d’isoler les malades:',
            referenceText:'Réf. : Art. R. 227-6 CASF : «  Les accueils avec hébergements […] doivent disposer d’un lieu permettant d’isoler les malades »',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioIsolation,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioIsolation = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _isolationObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsIsolation = value;
              });
            },),
          const SizedBox(height: 20),
                   
          RadioGroup(
            title: 'Attestation de vaccination de chaque mineur',
            referenceText:'Réf. : Art. R. 227-8 CASF : « Les personnes qui participent à [un ACM] doivent produire, avant leur entrée en fonction, un document attestant qu\'elles ont satisfait aux obligations légales en matière de vaccination ». Il peut s’agir d’une copie des pages du carnet de santé relatives aux vaccinations, d’une copie du carnet de vaccinations, ou de l’attestation d\'un médecin.\n'
            'NB : les vaccinations obligatoires pour les mineurs nés jusqu’en 2017 sont la diphtérie, le tétanos et la poliomyélite (tous 3 réalisés à 2, 4 et 11 mois).NB : les vaccinations obligatoires pour les mineurs nés jusqu’en 2017 sont la diphtérie, le tétanos et la poliomyélite (tous 3 réalisés à 2, 4 et 11 mois).',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioVaccination,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioVaccination = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _vaccinationCertificateObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsVaccination = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Des documents justifient des antécédents médicaux ou chirurgicaux et des pathologies chroniques ou aigues en cours:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioAntecedents,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioAntecedents = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _medicalHistoryDocumentsObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsAntecedents = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Les mineurs faisant l\'objet d\'un traitement médical sont identifiés :',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioMineurTraitement,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioMineurTraitement = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _medicalTreatmentIdentificationObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsMineurTraitement = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'L\'équipe d\'animation est informée des éventuelles allergies :',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioAllergies,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioAllergies = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _teamInformedAllergiesObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsAllergies = value;
              });
            },),
          const SizedBox(height: 20),
          // Répéter la même structure pour les autres sous-titres
         
          RadioGroup(
            title: 'Les médicaments sont conservés avec les ordonnances dans un contenant fermé à clef (Sauf lorsque la nature du traitement impose que le médicament soit en permanence à la disposition de l’enfant):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioOrdonnances,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioOrdonnances = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _medicinesStoredSecurelyObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsOrdonnances = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Le registre des soins est tenu à jour:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioRegistreSoins,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioRegistreSoins = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _careRegisterUpdatedObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsRegistreSoins = value;
              });
            },),
          const SizedBox(height: 20),         
          
          RadioGroup(
            title: 'Les trousses de premiers soins sont complètes et à jour:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioPremierSoins,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioPremierSoins = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _firstAidKitsCompleteObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsPremierSoins = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'Des moyens de communication permettant d\'alerter rapidement les secours sont mis à disposition du directeur et de l\'équipe:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioCommSecours,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioCommSecours = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _emergencyCommunicationMeansObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsCommSecours = value;
              });
            },),
          const SizedBox(height: 20),
          
          RadioGroup(
            title: 'La liste des numéros d\'urgence, des personnes et des organismes susceptibles d\'intervenir en cas d\'urgence est mise à disposition du directeur et de l\'équipe:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioNumUrgence,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioNumUrgence = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _emergencyContactListAvailableObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsNumUrgence = value;
              });
            },),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class SeventhSection extends StatefulWidget {
  final AvecHData avecHData;
  
  const SeventhSection(this.avecHData, {super.key});
  
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
  final _couchageController = TextEditingController();
  final _hebergeDirectionController = TextEditingController();
  final _genderSeparateSanitaryFacilitiesObservationsController = TextEditingController();
  final _quietTimeAndNapAreaObservationsController = TextEditingController();
  final _adaptedIndoorOutdoorSpacesObservationsController = TextEditingController();
  final _observationsRepli = TextEditingController();

  @override
  void initState() {
    super.initState();
      _lastSecurityCommissionOpinionObservationsController.text = widget.avecHData.observationsCommissionSecu;
      _insuranceCertificateObservationsController.text = widget.avecHData.observationsAssurance;
      _effectiveSignageObservationsController.text = widget.avecHData.observationsSignaletique;
      _evacuationExerciseObservationsController.text = widget.avecHData.observationsEvacuation;
      _extinguishersUpToDateObservationsController.text = widget.avecHData.observationsExtincteur;
      _smokeDetectorsPresentObservationsController.text = widget.avecHData.observationsDetecteur;
      _intrusionExerciseObservationsController.text = widget.avecHData.observationsExercice;
      _weatherAdaptedSpacesObservationsController.text = widget.avecHData.observationsConditionsMeteo;
      _generalHygieneConditionsObservationsController.text = widget.avecHData.observationsHygiene;
      _couchageController.text = widget.avecHData.observationsCouchage;
      _hebergeDirectionController.text = widget.avecHData.observationsHebergeDirection;
      _genderSeparateSanitaryFacilitiesObservationsController.text = widget.avecHData.observationsSanitaire;
      _quietTimeAndNapAreaObservationsController.text = widget.avecHData.observationsSieste;
      _adaptedIndoorOutdoorSpacesObservationsController.text = widget.avecHData.observationsEspacesAdapte;
      _observationsRepli.text = widget.avecHData.observationsRepli;
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
    _observationsRepli.dispose();
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
            defaultChoice: widget.avecHData.radioCommissionSecu,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioCommissionSecu = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _lastSecurityCommissionOpinionObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsCommissionSecu = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Le directeur dispose de l\'attestation d\'assurance des locaux:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioAssurance,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioAssurance = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _insuranceCertificateObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsAssurance = value;
              });
            },),
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Il existe une signalétique efficace pour renforcer la sécurité (éclairage de sécurité, plan d\'évacuation, etc.):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioSignaletique,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioSignaletique = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _effectiveSignageObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsSignaletique = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Un exercice d\'évacuation a été réalisé:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioExercice,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioExercice = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _evacuationExerciseObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsEvacuation = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les extincteurs sont à jour de leurs visites périodiques obligatoires:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioExtincteur,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioExtincteur = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _extinguishersUpToDateObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsExtincteur = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Des détecteurs avertisseurs autonomes de fumées ou un système d\'alarme sont présents:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioDetecteur,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioDetecteur = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _smokeDetectorsPresentObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsDetecteur = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Un exercice attentat-intrusion a été réalisé:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioExercice,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioExercice = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _intrusionExerciseObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsExercice = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les lieux d\'activités sont adaptés aux conditions climatiques:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioConditionsMeteo,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioConditionsMeteo = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _weatherAdaptedSpacesObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsConditionsMeteo = value;
              });
            },),

         
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les conditions générales d\'hygiène et de sécurité des locaux sont satisfaisantes:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioHygiene,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioHygiene = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _generalHygieneConditionsObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsHygiene = value;
              });
            },),


          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les couchages permettent aux filles et aux garçons âgés de plus de 6 ans de dormir dans des lieux séparés:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioCouchage,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioCouchage = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _couchageController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsCouchage = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'L\'hébergement des personnes qui assurent la direction ou l\'animation de ces accueils doit permettre les meilleures conditions de sécurité:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioHebergeDirection,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioHebergeDirection = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _hebergeDirectionController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsHebergeDirection = value;
              });
            },),



          const SizedBox(height: 20),
          RadioGroup(
            title: 'Il y a suffisamment de sanitaires pour permettre une utilisation distincte entre garçons et filles:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioSanitaire
            ,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioSanitaire = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _genderSeparateSanitaryFacilitiesObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsSanitaire = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les locaux permettent l\'organisation de temps calmes et, le cas échéant, de la sieste (notamment pour les moins de 6 ans):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioSieste,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioSieste = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _quietTimeAndNapAreaObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsSieste = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les espaces intérieurs et extérieurs sont adaptés et aménagés (zones ombragées, zones d\'activités et zones calmes, etc):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioEspacesAdapte,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioEspacesAdapte = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _adaptedIndoorOutdoorSpacesObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsEspacesAdapte = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Pour les séjours hors locaux, un lieu de repli est identifié à proximité du campement:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioRepli,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioRepli = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _observationsRepli,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsRepli = value;
              });
            },),
        ],
      ),
    );
  }
}

class EighthSection extends StatefulWidget {
  final AvecHData avecHData;
  
  const EighthSection(this.avecHData, {super.key});
  
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
      _cleanKitchenObservationsController.text = widget.avecHData.observationsCuisine;
      _cleanDiningRoomObservationsController.text = widget.avecHData.observationsSalleResto;
      _foodSamplesRetentionObservationsController.text = widget.avecHData.observationsPlatsTemoins;
      _productTraceabilityObservationsController.text = widget.avecHData.observationsTracabilite;
      _foodStorageObservationsController.text = widget.avecHData.observationsStockage;
      _refrigeratorWithThermometerObservationsController.text = widget.avecHData.observationsRefrigerateur;
      _picnicEquipmentObservationsController.text = widget.avecHData.observationsPiqueNique;
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
            defaultChoice: widget.avecHData.radioCuisine,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioCuisine = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _cleanKitchenObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsCuisine = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Salle de restauration entretenue et propre:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioSalleResto,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioSalleResto = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _cleanDiningRoomObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsSalleResto = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Conservation des plats témoins (minimum 100g par plat) pendant 5 jours:',
            referenceText: 'NB :\n'
            '•	Les plats témoins doivent être représentatifs des repas servis.\n'
            '•	Ce doit être réalisé systématiquement pour les cuisines autonomes et facultativement pour les cuisines satellites.',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioPlatsTemoins,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioPlatsTemoins = value;
              });
            },
          ),
          const SizedBox(height: 20),
          LongTextField(labelText: 'Observations', controller: _foodSamplesRetentionObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsPlatsTemoins = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Conservation de la traçabilité des produits consommés (type de produit, n° de lot, lieux d\'achat, date de consommation, type de préparation, etc.):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioTracabilite,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioTracabilite = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _productTraceabilityObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsTracabilite = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Stockage des denrées (à l\'abri de la chaleur et de l\'humidité dans des contenants fermés):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioStockage,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioStockage = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _foodStorageObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsStockage = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Réfrigérateur avec thermomètre (de 0° à +4°):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioRefrigerateur,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioRefrigerateur = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _refrigeratorWithThermometerObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsRefrigerateur = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Si pique-nique à l\'extérieur : glaciaire avec plaques eutectiques (ou bouteilles d\'eau congelées):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioPiqueNique,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioPiqueNique = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _picnicEquipmentObservationsController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.observationsPiqueNique = value;
              });
            },),
        ],
      ),
    );
  }
}

class NinthSection extends StatefulWidget {
  final AvecHData avecHData;
  
  const NinthSection(this.avecHData, {super.key});
  
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
      _internalManagementPlanController.text = widget.avecHData.observationsGestion;
      _weatherForecastMonitoringController.text = widget.avecHData.observationsVeille;
      _heatStrokePreventionController.text = widget.avecHData.observationsPreventionChaleur;
      _buildingAndEquipmentCheckController.text = widget.avecHData.observationsEquipement;
      _coolRoomSetUpController.text = widget.avecHData.observationsPieceFraiche;
      _ventilatorsOrMistersController.text = widget.avecHData.observationsVentilateurs;
      _thermometersInEachRoomController.text = widget.avecHData.observationsThermo;
      _hydrationAndAdaptedMenusController.text = widget.avecHData.observationsEauMenus;
      _potableWaterReservesCheckController.text = widget.avecHData.observationsReserves;
      _shadeAndAdaptedActivitiesController.text = widget.avecHData.observationsOmbre;
      _refreshmentMethodsController.text = widget.avecHData.observationsRafraichissement;
      _covid19BarriersCompatibilityController.text = widget.avecHData.observationsGesteBarriere;
      _postEventAnalysisController.text = widget.avecHData.observationsGestionPosteriori;
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
            defaultChoice: widget.avecHData.radioGestion,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioGestion = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _internalManagementPlanController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsGestion = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Une veille des prévisions météorologiques et des courriels est assurée:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioVeille,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioVeille = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _weatherForecastMonitoringController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsVeille = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les mesures de prévention et les symptômes de coup de chaleur sont connus des membres de l\'équip:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioPreventionChaleur,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioPreventionChaleur = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _heatStrokePreventionController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsPreventionChaleur = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les bâtiments et équipements (stores, volets, dispositifs occultants, système de rafraîchissement, réfrigérateur, congélateur) ont été vérifiés:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioEquipement,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioEquipement = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _buildingAndEquipmentCheckController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsEquipement = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'L\'aménagement spécifique d\'une pièce plus fraîche a été envisagé et mis en place si possible:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioPieceFraiche,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioPieceFraiche = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _coolRoomSetUpController,
          onChanged: (value) {
              setState(() {
                widget.avecHData.observationsPieceFraiche = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'L\'accueil dispose de ventilateurs ou brumisateurs:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioVentilateurs,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioVentilateurs = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _ventilatorsOrMistersController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsVentilateurs = value;
              });
            },),

          const SizedBox(height: 20),
          RadioGroup(
            title: 'Un thermomètre a été placé dans chaque pièce:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioThermo,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioThermo = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _thermometersInEachRoomController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsThermo = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les mineurs boivent régulièrement et les menus sont adaptés (eau, fruits frais, légumes verts, yaourts, etc.):',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioEauMenus,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioEauMenus = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _hydrationAndAdaptedMenusController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsEauMenus = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les réserves d\'eau potable ont été vérifiées:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioReserves,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioReserves = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _potableWaterReservesCheckController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsReserves = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les mineurs sont à l\'ombre aux heures les plus chaudes de la journée. Les sorties (intérieur/extérieur) et les activités sont adaptées en évitant les efforts intenses:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioOmbre,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioOmbre = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _shadeAndAdaptedActivitiesController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsOmbre = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Les mineurs sont rafraîchis (douches, aspersions, etc.) en évitant les eaux trop froides. Les brumisateurs collectifs qui émettent un flux ascendant depuis le sol et/ou un flux latéral sont interdits temporairement, pendant la période de circulation de la Covid-19:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioRafraichissement,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioRafraichissement = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _refreshmentMethodsController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsRafraichissement = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'Le directeur et l\'équipe d\'animation ont connaissance que les gestes barrières liés à la Covid-19 ne sont pas incompatibles avec les actions recommandées en cas de canicule:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioGesteBarriere,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioGesteBarriere = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _covid19BarriersCompatibilityController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsGesteBarriere = value;
              });
            },),

          
          const SizedBox(height: 20),
          RadioGroup(
            title: 'A postériori, analyser la gestion de l\'évènement et améliorer le plan de gestion interne:',
            choices: const ['OUI', 'NON', 'Non Vérifié'],
            defaultChoice: widget.avecHData.radioGestionPosteriori,
            onChanged: (value) {
              setState(() {
                widget.avecHData.radioGestionPosteriori = value;
              });
            },
          ),
          const SizedBox(height: 10),
          LongTextField(labelText: 'Observations', controller: _postEventAnalysisController,onChanged: (value) {
              setState(() {
                widget.avecHData.observationsGestionPosteriori = value;
              });
            },),
        ],
      ),
    );
  }
}

class TenthSection extends StatefulWidget {
  final AvecHData avecHData;
  
  const TenthSection(this.avecHData, {super.key});
  
  @override
  _TenthSectionState createState() => _TenthSectionState();
}

class _TenthSectionState extends State<TenthSection> {


  final _generalAppreciationController = TextEditingController();
  final _prescriptionsEcheancesController = TextEditingController();
  final _nameOfControllerController = TextEditingController();
  final _prescriptionDateController = TextEditingController();
  final _prescriptionAuthoritySignatureController = SignatureController();

  @override
  void initState() {
    super.initState();
      _generalAppreciationController.text = widget.avecHData.appreciationGenerale;
      _prescriptionsEcheancesController.text = widget.avecHData.prescriptionsEcheances;
      _nameOfControllerController.text = widget.avecHData.controllerName;
      _prescriptionDateController.text = widget.avecHData.dateDuControle.toString();
      _prescriptionAuthoritySignatureController.points = widget.avecHData.signatureAuthorite;
  }

  @override
  void dispose() {
    _generalAppreciationController.dispose();
    _prescriptionsEcheancesController.dispose();
    _nameOfControllerController.dispose();
    _prescriptionDateController.dispose();
    _prescriptionAuthoritySignatureController.dispose();
    
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
                widget.avecHData.appreciationGenerale = value;
              });
            },),

          const SizedBox(height: 20),
          LongTextField(labelText:'PRESCRIPTIONS ET ECHEANCES LAISSEES POUR LEUR MISE EN OEUVRE',
          controller: _prescriptionsEcheancesController,
          onChanged: (value) {
              setState(() {
                widget.avecHData.prescriptionsEcheances = value;
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
            defaultChoices: widget.avecHData.CopyToTest.split(','),
            onChanged: (value) {
              setState(() {
                widget.avecHData.CopyToTest = value.join(',');
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(labelText: 'Contrôle effectué par:', controller: _nameOfControllerController,
            onChanged: (value) {
              setState(() {
                widget.avecHData.controllerName = value;
              });
            },),
          const SizedBox(height: 20),
          DateField(
            labelText: 'A Poitiers, le ',
            controller: _prescriptionDateController,
            onDateSelected: (DateTime selectedDate) {
              setState(() {
                widget.avecHData.dateDuControle = selectedDate;
              });
            },
          ),
          const SizedBox(height: 20),
          //CustomTextField(labelText: 'Signature de l\'autorité', controller: _prescriptionAuthoritySignatureController),
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
                    widget.avecHData.signatureAuthorite = [];
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

//___________________________STYLES______________________________________//

class SecuriteActivitesPhysiques extends StatefulWidget {
  final AvecHData avecHData;

  const SecuriteActivitesPhysiques(this.avecHData, {super.key});

  @override
  _SecuriteActivitesPhysiquesState createState() =>
      _SecuriteActivitesPhysiquesState();
}

class _SecuriteActivitesPhysiquesState extends State<SecuriteActivitesPhysiques> {
  List<ActiviteData> activites = []; // Liste des activités

  @override
  void initState() {
    super.initState();
    if (widget.avecHData.activitesSecu != null) {
      activites = widget.avecHData.activitesSecu!; // Si des activités existent déjà, les charger
    }
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
                itemCount: activites.length,
                itemBuilder: (context, index) {
                  return ActiviteItem(
                    activiteData: activites[index],
                    onDelete: () {
                      setState(() {
                        activites.removeAt(index);
                      });
                    },
                    onUpdate: (updatedActivite) {
                      setState(() {
                        activites[index] = updatedActivite;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    activites.add(ActiviteData()); // Ajouter une nouvelle activité
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
    widget.avecHData.activitesSecu = activites; // Sauvegarder les activités
    super.dispose();
  }
}

class ActiviteItem extends StatelessWidget {
  final ActiviteData activiteData;
  final Function onDelete;
  final Function(ActiviteData) onUpdate;

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
                initialValue: activiteData.encadrantNomPrenom ?? '',
                onChanged: (value) {
                  activiteData.encadrantNomPrenom = value;
                  onUpdate(activiteData);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    labelText:
                        'Qualification permettant l’encadrement de l’activité'),
                initialValue: activiteData.encadrantQualif ?? '',
                onChanged: (value) {
                  activiteData.encadrantQualif = value;
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
                   '* une simple activité physique peut être encadrée par tout animateur titulaire.',style: TextStyle(fontWeight: FontWeight.normal),),
              const SizedBox(height: 20),
              const Text('Si l’activité est organisée via une prestation (à titre onéreux ou gratuit)',style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline,)),
              const Text('Dénomination de l’établissement d’activité physique ou sportive réalisant la prestation:',style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Nom/prenom de l\'encadrant'),
                initialValue: activiteData.encadrantNomPrenom ?? '',
                onChanged: (value) {
                  activiteData.encadrantNomPrenom = value;
                  onUpdate(activiteData);
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    labelText:
                        'Qualification permettant l’encadrement de l’activité:'),
                initialValue: activiteData.encadrantQualif ?? '',
                onChanged: (value) {
                  activiteData.encadrantQualif = value;
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


class DataSaver {
  Future<void> saveDataToFile(AvecHData avecHData) async {
    // Obtenir le répertoire de stockage externe
    Directory? directory = await getExternalStorageDirectory();
    String fileName = 'Rapport_Controle_Avec_Hebergement_${avecHData.dateDuControle}_${avecHData.visiteRealiseePar}.txt';

    if (directory != null) {
      // Créer un fichier dans le répertoire de stockage externe
      final file = File('${directory.path}/$fileName');

      IOSink sink = file.openWrite();

      // Écrire le contenu de chaque variable dans le fichier
      sink.writeln('                        Rapport                        ');
      sink.writeln('de controle et d\'évalutation d\'un accueil collectif de mineurs');
      sink.writeln('                    Avec Hebergement');
      sink.writeln('\n----------INFORMATIONS RELATIVES A LA VISITE----------');
      sink.writeln('Visite réalisée par: ${avecHData.visiteRealiseePar}');
      sink.writeln('En présence de: ${avecHData.enPresenceDe}');
      sink.writeln('Date de la visite: ${avecHData.dateVisite}');
      sink.writeln('Organisation: ${avecHData.denomination}');
      //inopine progra
      //date dateVisite
      sink.writeln('\n----------RENSEIGNEMENTS SUR L’ACCUEIL----------');
      sink.writeln('Denomination de l\'organisateur: ${avecHData.denomination}');
      sink.writeln('Adresse du siège ou du domicile de l’organisateur: ${avecHData.adresse}');
      sink.writeln('Lieu et adresse du déroulement de l’ACM: ${avecHData.lieu}');
      sink.writeln('Numéro de déclaration: ${avecHData.numeroDeclaration}');
      sink.writeln('Début du déroulement de l\'ACM: ${avecHData.numeroDeclaration}');
      sink.writeln('Fin du déroulement de l\'ACM: ${avecHData.numeroDeclaration}');
      sink.writeln('Type de séjour: ${avecHData.radioTypeAccueil}');
      sink.writeln('\n-----DOCUMENTS A VERIFIER-----');
      sink.writeln('•	Art. L. 227-5 CASF : ${avecHData.radio227_5}');
      sink.writeln('Observations Art. L. 227-5 CASF : ${avecHData.observations227_5}');
      sink.writeln('•	Art. R. 227-29 CASF : ${avecHData.radio227_29}');
      sink.writeln('Observations Art. R. 227-29 CASF: ${avecHData.observations227_29}');
      
      sink.writeln('\n----------EFFECTIFS DE MINEURS----------');
      sink.writeln('Capacité d\'accueil du local: ${avecHData.capaciteAccueil}');     
      sink.writeln('Moins de 6 ans déclarés: ${avecHData.moinsDe6AnsDeclares}');
      sink.writeln('Entre 6 et 13 ans déclarés: ${avecHData.entre6et13AnsDeclares}');
      sink.writeln('Entre 14 et 17 ans déclarés: ${avecHData.entre14et17AnsDeclares}');
      sink.writeln('Total déclarés: ${avecHData.totalDeclares}');
      sink.writeln('Moins de 6 ans présents: ${avecHData.moinsDe6AnsPresents}');
      sink.writeln('Entre 6 et 13 ans présents: ${avecHData.entre6et13AnsPresents}');
      sink.writeln('Entre 14 et 17 ans présents: ${avecHData.entre14et17AnsPresents}');
      sink.writeln('Total présents: ${avecHData.totalPresents}');
      sink.writeln('Moins de 6 ans en situation de handicap: ${avecHData.moinsDe6AnsHandi}');
      sink.writeln('Entre 6 et 13 ans en situation de handicap: ${avecHData.entre6et13AnsHandi}');
      sink.writeln('Entre 14 et 17 ans en situation de handicap: ${avecHData.entre14et17AnsHandi}');
      sink.writeln('Total en situation de handicap: ${avecHData.totalHandi}');
      sink.writeln('\n-----DOCUMENTS A VERIFIER-----');
      sink.writeln('PMI •	Art. R. 2324-13 CASF: ${avecHData.radio2324_13}');
      sink.writeln('Observations PMI Art. R. 2324-13 CASF: ${avecHData.observations2324_13}');
      sink.writeln('PMI •	Art. R. 2324-14 CASF: ${avecHData.radio2324_14}');
      sink.writeln('Observations PMI Art. R. 2324-14 CASF: ${avecHData.observations2324_14}');
      sink.writeln('•	Registre de présence des mineurs: ${avecHData.radioRegistreMineur}');
      sink.writeln('Observations Registre de présence des mineurs: ${avecHData.observationsRegistreMineur}');

      sink.writeln('\n----------EQUIPE D’ENCADREMENT----------');
      sink.writeln('Directeur: ${avecHData.directeurNom} ${avecHData.directeurPrenom}, ${avecHData.directeurQualification}');
      sink.writeln('Titulaire ou Stagiaire: ${avecHData.radioTitulaireStagiaire}');
      if ('${avecHData.dateRenouvellement}' != '2001-01-01') {
        sink.writeln('Date de renouvellement BAFD: ${avecHData.dateRenouvellement}');
      }
      else if ('${avecHData.dateDebutFormation}' != '2001-01-01') {
        sink.writeln('Date de début de formation BAFD: ${avecHData.dateDebutFormation}');
      }
      else {
        sink.writeln('Période de dérogation: ${avecHData.dateStartDerogation}  -  ${avecHData.dateEndDerogation}');
      }
      sink.writeln('Directeur adjoint: ${avecHData.adjointNom} ${avecHData.adjointPrenom}, ${avecHData.adjointQualif}');
      sink.writeln('Nombre d\'animateurs qualifiés: ${avecHData.nombreAnimQualif}');
      sink.writeln('Nombre d\'animateurs stagiaires: ${avecHData.nombreAnimStagiaires}');
      sink.writeln('Nombre d\'animateurs non qualifiés: ${avecHData.nombreAnimNonQualif}');
      sink.writeln('Total d\'animateurs en activité: ${avecHData.totalAnim}');
      sink.writeln('Encadrement requis pour les mineurs de moins de 6 ans: ${avecHData.encadrementRequisMoinsDe6}');
      sink.writeln('Encadrement requis pour les mineurs de plus de 6 ans: ${avecHData.encadrementRequisPlusDe6}');
      sink.writeln('Total de l\'encadrement requis: ${avecHData.totalAnimRequis}');
      sink.writeln('\n-----DOCUMENTS A VERIFIER-----');
      sink.writeln('Récépissé de déclaration de l’accueil: ${avecHData.radio227_2}');
      sink.writeln('Observations Récépissé de déclaration de l’accueil: ${avecHData.observations227_2}');
      sink.writeln('Sincérité de la déclaration: ${avecHData.radioArrete3_5}');
      sink.writeln('Observations Sincérité de la déclaration : ${avecHData.observationsArrete3_5}');
      sink.writeln('Diplômes de l’équipe: ${avecHData.radio9_02_07}');
      sink.writeln('Observations Diplômes de l’équipe: ${avecHData.observations9_02_07}');
      sink.writeln('Attestation de vaccination de l\'équipe: ${avecHData.radio227_8}');
      sink.writeln('Observations Attestation de vaccination de l\'équipe: ${avecHData.observations227_8}');
      sink.writeln('Nom et qualification de la personne désignée pour assurer le suivi sanitaire: ${avecHData.observations227_8}');
      sink.writeln('\n-----Encadrement et animation de l’équipe-----');

      sink.writeln('Le directeur connait les modalités de communication avec l’organisateur : ${avecHData.observationsCommunicationOrganisateur}');
      sink.writeln('Savoir comportementaux du personnel: ${avecHData.observationsSavoirComportement}');
      sink.writeln('Qualification du personnel adaptées aux projets et au public accueilli: ${avecHData.observationsQualifPersonnel}');
      sink.writeln('Temps de préparation et d\'évaluation de l\'équipe: ${avecHData.observationsTempsDePrep}');
      sink.writeln('Réunion de bilan entre directeur et équipe: ${avecHData.observationsReuBilan}');
      sink.writeln('Evaluation des stagiaires avec critères connus et temps d\'échange: ${avecHData.observationsEvalStg}');



      // Ajoutez ici d'autres lignes pour chaque variable que vous souhaitez sauvegarder
      // Fermer le fichier
      await sink.flush();
      await sink.close();
    } else {
      print('Impossible d\'obtenir le répertoire de stockage externe.');
    }
  }
}

