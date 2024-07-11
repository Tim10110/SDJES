import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';



class DatabaseHelper {

  static const _databaseVersion = 1;
  static const formSH = 'formSH';
  static const formAH = 'formAH';
  static const formScout = 'formScout';
  static const tableActivite = 'activité';
  
  static const formSHId = 'formSHId';
  static const formAHId = 'formAHId';
  static const formScoutId = 'formScoutId';
  static const activiteId = 'activiteId';
  
  // Données table activité


  static const nomActivite = 'nomActivite';
  static const categorie = 'categorie';
  static const typeActivite = 'typeActivite';
  static const encadrantNomPrenom = 'encadrantNomPrenom';
  static const encadrantQualif = 'encadrantQualif';
  static const numCartePro = 'numCartePro';


  // Données forms SH / AH 

  static const visiteRealiseePar = '_vis';
  static const enPresenceDe = 'pres';
  static const dateVisite = 'dateVis';
  static const denomination = 'denom' ;
  static const adresse = 'adresse' ;
  static const lieu = 'lieu';
  static const numeroDeclaration = 'numdecla'; 
  static const startDate = 'dateStart';
  static const endDate = 'dateEnd';
  static const radioTypeAccueil = 'radioAcc';
  static const radio227_5 = 'radio227_5';
  static const obs227_5 = 'obs227_5';
  static const radio227_29 = 'radio227_29';
  static const obs227_29 = 'obs227_29';
  static const capAcc = 'capAcc';
  static const moinsDe6AnsDeclares = 'moinsDe6AnsDeclares';
  static const entre6et13AnsDeclares = 'entre6et13AnsDeclares';
  static const entre14et17AnsDeclares = 'entre14et17AnsDeclares';
  static const moinsDe6AnsPresents = 'moinsDe6AnsPresents';
  static const entre6et13AnsPresents = 'entre6et13AnsPresents';
  static const entre14et17AnsPresents = 'entre14et17AnsPresents';
  static const moinsDe6AnsHandi = 'moinsDe6AnsHandi';
  static const entre6et13AnsHandi = 'entre6et13AnsHandi';
  static const entre14et17AnsHandi = 'entre14et17AnsHandi';
  static const radio2324_13 = 'radio2324_13';
  static const observations2324_13 = 'observations2324_13';
  static const radio2324_14 = 'radio2324_14';
  static const observations2324_14 = 'observations2324_14';
  static const radioRegistreMineur = 'radioRegistreMineur';
  static const observationsRegistreMineur = 'observationsRegistreMineur';
  static const directeurNom = 'directeurNom';
  static const directeurPrenom = 'directeurPrenom';
  static const directeurQualification = 'directeurQualification';
  static const radioTitulaireStagiaire = 'radioTitulaireStagiaire';
  static const dateRenouvellement = 'dateRenouvellement';
  static const dateDebutFormation = 'dateDebutFormation';
  static const dateStartDerogation = 'dateStartDerogation';
  static const dateEndDerogation = 'dateEndDerogation';
  static const nombreAnimQualif = 'nombreAnimQualif';
  static const nombreAnimStagiaires = 'nombreAnimStagiaires';
  static const nombreAnimNonQualif = 'nombreAnimNonQualif';
  static const encadrementRequisMoinsDe6 = 'encadrementRequisMoinsDe6';
  static const encadrementRequisPlusDe6 = 'encadrementRequisPlusDe6';
  static const radio227_2 = 'radio227_2';
  static const observations227_2 = 'observations227_2';
  static const radioArrete3_5 = 'radioArrete3_5';
  static const observationsArrete3_5 = 'observationsArrete3_5';
  static const radio9_02_07 = 'radio9_02_07';
  static const observations9_02_07 = 'observations9_02_07';
  static const radio227_8 = 'radio227_8';
  static const observations227_8 = 'observations227_8';
  static const observationsCommunicationOrganisateur = 'observationsCommunicationOrganisateur';
  static const observationsSavoirComportement = 'observationsSavoirComportement';
  static const observationsQualifPersonnel = 'observationsQualifPersonnel';
  static const observationsReuBilan = 'observationsReuBilan';
  static const observationsEvalStg = 'observationsEvalStg';
  static const radioProjEdu = 'radioProjEdu';
  static const observationsProjEdu = 'observationsProjEdu';
  static const radioProjPeda = 'radioProjPeda';
  static const observationsProjPeda = 'observationsProjPeda';
  static const radioRepresentant = 'radioRepresentant';
  static const observationsRepresentant = 'observationsRepresentant';
  static const observationsPE = 'observationsPE';
  static const observationsMoyens = 'observationsMoyens';
  static const observationsMoyensEquipe = 'observationsMoyensEquipe';
  static const observationsBudget = 'observationsBudget';
  static const observationsOrientation = 'observationsOrientation';
  static const observationsDiagnostic = 'observationsDiagnostic';
  static const observationsPolitique = 'observationsPolitique';
  static const observationsReorientation = 'observationsReorientation';
  static const observationsPPCoherence = 'observationsPPCoherence';
  static const observationsPPCara = 'observationsPPCara';
  static const observationsPPConcertation = 'observationsPPConcertation';
  static const observationsPPModalite = 'observationsPPModalite';
  static const observationsPPNature = 'observationsPPNature';
  static const observationsPPRepartition = 'observationsPPRepartition';
  static const observationsSecuriteNuit = 'observationsSecuriteNuit';
  static const observationsPPSanteHandi = 'observationsPPSanteHandi';
  static const observationsPPFonctEquipe = 'observationsPPFonctEquipe';
  static const observationsPPEvalAccueil = 'observationsPPEvalAccueil';
  static const observationsActivitesType = 'observationsActivitesType';
  static const observationsPrestataire = 'observationsPrestataire';
  static const observationsActiviteMineur = 'observationsActiviteMineur';
  static const observationsRisques = 'observationsRisques';
  static const observationsEchange = 'observationsEchange';
  static const observationsFormation = 'observationsFormation';
  static const radioAqua = 'radioAqua';
  static const radioAutorisations = 'radioAutorisations';
  static const radioVaccination = 'radioVaccination';
  static const observationsVaccination = 'observationsVaccination';
  static const radioAntecedents = 'radioAntecedents';
  static const observationsAntecedents = 'observationsAntecedents';
  static const radioMineurTraitement = 'radioMineurTraitement';
  static const observationsMineurTraitement = 'observationsMineurTraitement';
  static const radioAllergies = 'radioAllergies';
  static const observationsAllergies = 'observationsAllergies';
  static const radioOrdonnances = 'radioOrdonnances';
  static const observationsOrdonnances = 'observationsOrdonnances';
  static const radioRegistreSoins = 'radioRegistreSoins';
  static const observationsRegistreSoins = 'observationsRegistreSoins';
  static const radioPremierSoins = 'radioPremierSoins';
  static const observationsPremierSoins = 'observationsPremierSoins';
  static const radioCommSecours = 'radioCommSecours';
  static const observationsCommSecours = 'observationsCommSecours';
  static const radioNumUrgence = 'radioNumUrgence';
  static const observationsNumUrgence = 'observationsNumUrgence';
  static const radioCommissionSecu = 'radioCommissionSecu';
  static const observationsCommissionSecu = 'observationsCommissionSecu';
  static const radioAssurance = 'radioAssurance';
  static const observationsAssurance = 'observationsAssurance';
  static const radioSignaletique = 'radioSignaletique';
  static const observationsSignaletique = 'observationsSignaletique';
  static const radioEvacuation = 'radioEvacuation';
  static const observationsEvacuation = 'observationsEvacuation';
  static const radioExtincteur = 'radioExtincteur';
  static const observationsExtincteur = 'observationsExtincteur';
  static const radioDetecteur = 'radioDetecteur';
  static const observationsDetecteur = 'observationsDetecteur';
  static const radioExercice = 'radioExercice';
  static const observationsExercice = 'observationsExercice';
  static const radioConditionsMeteo = 'radioConditionsMeteo';
  static const observationsConditionsMeteo = 'observationsConditionsMeteo';
  static const radioHygiene = 'radioHygiene';
  static const observationsHygiene = 'observationsHygiene';
  static const radioSanitaire = 'radioSanitaire';
  static const observationsSanitaire = 'observationsSanitaire';
  static const radioSieste = 'radioSieste';
  static const observationsSieste = 'observationsSieste';
  static const radioEspacesAdapte = 'radioEspacesAdapte';
  static const observationsEspacesAdapte = 'observationsEspacesAdapte';
  static const radioCuisine = 'radioCuisine';
  static const observationsCuisine = 'observationsCuisine';
  static const radioSalleResto = 'radioSalleResto';
  static const observationsSalleResto = 'observationsSalleResto';
  static const radioPlatsTemoins = 'radioPlatsTemoins';
  static const observationsPlatsTemoins = 'observationsPlatsTemoins';
  static const radioTracabilite = 'radioTracabilite';
  static const observationsTracabilite = 'observationsTracabilite';
  static const radioStockage = 'radioStockage';
  static const observationsStockage = 'observationsStockage';
  static const radioRefrigerateur = 'radioRefrigerateur';
  static const observationsRefrigerateur = 'observationsRefrigerateur';
  static const radioPiqueNique = 'radioPiqueNique';
  static const observationsPiqueNique = 'observationsPiqueNique';
  static const radioGestion = 'radioGestion';
  static const observationsGestion = 'observationsGestion';
  static const radioVeille = 'radioVeille';
  static const observationsVeille = 'observationsVeille';
  static const radioPreventionChaleur = 'radioPreventionChaleur';
  static const observationsPreventionChaleur = 'observationsPreventionChaleur';
  static const radioEquipement = 'radioEquipement';
  static const observationsEquipement = 'observationsEquipement';
  static const radioPieceFraiche = 'radioPieceFraiche';
  static const observationsPieceFraiche = 'observationsPieceFraiche';
  static const radioVentilateurs = 'radioVentilateurs';
  static const observationsVentilateurs = 'observationsVentilateurs';
  static const radioThermo = 'radioThermo';
  static const observationsThermo = 'observationsThermo';
  static const radioEauMenus = 'radioEauMenus';
  static const observationsEauMenus = 'observationsEauMenus';
  static const radioReserves = 'radioReserves';
  static const observationsReserves = 'observationsReserves';
  static const radioOmbre = 'radioOmbre';
  static const observationsOmbre = 'observationsOmbre';
  static const radioRafraichissement = 'radioRafraichissement';
  static const observationsRafraichissement = 'observationsRafraichissement';
  static const radioGesteBarriere = 'radioGesteBarriere';
  static const observationsGesteBarriere = 'observationsGesteBarriere';
  static const radioGestionPosteriori = 'radioGestionPosteriori';
  static const observationsGestionPosteriori = 'observationsGestionPosteriori';
  static const appreciationGenerale = 'appreciationGenerale';
  static const prescriptionsEcheances = 'prescriptionsEcheances';
  static const copyTo = 'copyTo';
  static const controllername = 'controllername';
  static const dateDuControle = 'dateDuControle';
  static const signatureAuthorite = 'signatureAuthorite';

  // Données spécifique AvecH

  static const adjointNom = 'adjointNom';
  static const adjointPrenom = 'adjointPrenom';
  static const adjointQualif = 'adjointQualif';
  static const radioSuiviSanitaire = 'radioSuiviSanitaire';
  static const observationsSuiviSanitaire = 'observationsSuiviSanitaire';
  static const radioIsolation = 'radioIsolation';
  static const observationsIsolation ='observationsIsolation';
  static const radioCouchage = 'radioCouchage';
  static const observationsCouchage = 'observationsCouchage';
  static const radioHebergeDirection = 'radioHebergeDirection';
  static const observationsHebergeDirection = 'observationsHebergeDirection';
  static const radioRepli = 'radioRepli';
  static const observationsRepli = 'observationsRepli';

      
  // Données form Scout

  static const typeSej = 'typeSej';
  static const mouvementOrga = 'mouvOrga';
  static const nomCoord = 'nomCoord';


  // crée une classe singleton
  DatabaseHelper._privateconstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateconstructor();

// only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    
    sqfliteFfiInit(); // Assurez-vous d'initialiser sqflite_common_ffi
    databaseFactory = databaseFactoryFfi;

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'db_forms.db');
    return await openDatabase(path,
        version: _databaseVersion, onCreate: createTables);
  }

  static Future<void> createTables(Database database, int version) async {
    print ("creating table..");
    await database.execute('''CREATE TABLE IF NOT EXISTS $formSH (
        $formSHId INTEGER PRIMARY KEY AUTOINCREMENT,
        $visiteRealiseePar TEXT NOT NULL,
        $enPresenceDe TEXT NOT NULL,
        $dateVisite INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $denomination TEXT NOT NULL,
        $adresse TEXT NOT NULL,
        $lieu TEXT NOT NULL,
        $numeroDeclaration TEXT NOT NULL,
        $startDate INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $endDate INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $radioTypeAccueil TEXT NOT NULL,
        $radio227_5 TEXT NOT NULL,
        $obs227_5 TEXT,
        $radio227_29 TEXT NOT NULL,
        $obs227_29 TEXT,
        $capAcc TEXT NOT NULL,
        $moinsDe6AnsDeclares TEXT,
        $entre6et13AnsDeclares TEXT,
        $entre14et17AnsDeclares TEXT,
        $moinsDe6AnsPresents TEXT,
        $entre6et13AnsPresents TEXT,
        $entre14et17AnsPresents TEXT,
        $moinsDe6AnsHandi TEXT,
        $entre6et13AnsHandi TEXT,
        $entre14et17AnsHandi TEXT,
        $radio2324_13 TEXT NOT NULL,
        $observations2324_13 TEXT,
        $radio2324_14 TEXT NOT NULL,
        $observations2324_14 TEXT,
        $radioRegistreMineur TEXT NOT NULL,
        $observationsRegistreMineur TEXT,
        $directeurNom TEXT,
        $directeurPrenom TEXT,
        $directeurQualification TEXT,
        $radioTitulaireStagiaire TEXT NOT NULL,
        $dateRenouvellement INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $dateDebutFormation INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $dateStartDerogation INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $dateEndDerogation INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $nombreAnimQualif TEXT,
        $nombreAnimStagiaires TEXT,
        $nombreAnimNonQualif TEXT,
        $encadrementRequisMoinsDe6 TEXT,
        $encadrementRequisPlusDe6 TEXT,
        $radio227_2 TEXT NOT NULL,
        $observations227_2 TEXT,
        $radioArrete3_5 TEXT NOT NULL,
        $observationsArrete3_5 TEXT,
        $radio9_02_07 TEXT NOT NULL,
        $observations9_02_07 TEXT,
        $radio227_8 TEXT NOT NULL,
        $observations227_8 TEXT,
        $observationsCommunicationOrganisateur TEXT,
        $observationsSavoirComportement TEXT,
        $observationsQualifPersonnel TEXT,
        $observationsReuBilan TEXT,
        $observationsEvalStg TEXT,
        $radioProjEdu TEXT NOT NULL,
        $observationsProjEdu TEXT,
        $radioProjPeda TEXT NOT NULL,
        $observationsProjPeda TEXT,
        $radioRepresentant TEXT NOT NULL,
        $observationsRepresentant TEXT,
        $observationsPE TEXT,
        $observationsMoyens TEXT,
        $observationsMoyensEquipe TEXT,
        $observationsBudget TEXT,
        $observationsOrientation TEXT,
        $observationsDiagnostic TEXT,
        $observationsPolitique TEXT,
        $observationsReorientation TEXT,
        $observationsPPCoherence TEXT,
        $observationsPPCara TEXT,
        $observationsPPConcertation TEXT,
        $observationsPPModalite TEXT,
        $observationsPPNature TEXT,
        $observationsPPRepartition TEXT,
        $observationsSecuriteNuit TEXT,
        $observationsPPSanteHandi TEXT,
        $observationsPPFonctEquipe TEXT,
        $observationsPPEvalAccueil TEXT,
        $observationsActivitesType TEXT,
        $observationsPrestataire TEXT,
        $observationsActiviteMineur TEXT,
        $observationsRisques TEXT,
        $observationsEchange TEXT,
        $observationsFormation TEXT,
        $radioAqua TEXT NOT NULL,
        $radioAutorisations TEXT NOT NULL,
        $radioVaccination TEXT NOT NULL,
        $observationsVaccination TEXT,
        $radioAntecedents TEXT NOT NULL,
        $observationsAntecedents TEXT,
        $radioMineurTraitement TEXT NOT NULL,
        $observationsMineurTraitement TEXT,
        $radioAllergies TEXT NOT NULL,
        $observationsAllergies TEXT,
        $radioOrdonnances TEXT NOT NULL,
        $observationsOrdonnances TEXT,
        $radioRegistreSoins TEXT NOT NULL,
        $observationsRegistreSoins TEXT,
        $radioPremierSoins TEXT NOT NULL,
        $observationsPremierSoins TEXT,
        $radioCommSecours TEXT NOT NULL,
        $observationsCommSecours TEXT,
        $radioNumUrgence TEXT NOT NULL,
        $observationsNumUrgence TEXT,
        $radioCommissionSecu TEXT NOT NULL,
        $observationsCommissionSecu TEXT,
        $radioAssurance TEXT NOT NULL,
        $observationsAssurance TEXT,
        $radioSignaletique TEXT NOT NULL,
        $observationsSignaletique TEXT,
        $radioEvacuation TEXT NOT NULL,
        $observationsEvacuation TEXT,
        $radioExtincteur TEXT NOT NULL,
        $observationsExtincteur TEXT,   
        $radioDetecteur TEXT NOT NULL,
        $observationsDetecteur TEXT,
        $radioExercice TEXT NOT NULL,
        $observationsExercice TEXT,
        $radioConditionsMeteo TEXT NOT NULL,
        $observationsConditionsMeteo TEXT,
        $radioHygiene TEXT NOT NULL,
        $observationsHygiene TEXT,
        $radioSanitaire TEXT NOT NULL,
        $observationsSanitaire TEXT,
        $radioSieste TEXT NOT NULL,
        $observationsSieste TEXT,
        $radioEspacesAdapte TEXT NOT NULL,
        $observationsEspacesAdapte TEXT,
        $radioCuisine TEXT NOT NULL,
        $observationsCuisine TEXT,
        $radioSalleResto TEXT NOT NULL,
        $observationsSalleResto TEXT,
        $radioPlatsTemoins TEXT NOT NULL,
        $observationsPlatsTemoins TEXT,
        $radioTracabilite TEXT NOT NULL,
        $observationsTracabilite TEXT,
        $radioStockage TEXT NOT NULL,
        $observationsStockage TEXT,
        $radioRefrigerateur TEXT NOT NULL,
        $observationsRefrigerateur TEXT,
        $radioPiqueNique TEXT NOT NULL,
        $observationsPiqueNique TEXT,
        $radioGestion TEXT NOT NULL,
        $observationsGestion TEXT,
        $radioVeille TEXT NOT NULL,
        $observationsVeille TEXT,
        $radioPreventionChaleur TEXT NOT NULL,
        $observationsPreventionChaleur TEXT,
        $radioEquipement TEXT NOT NULL,
        $observationsEquipement TEXT,
        $radioPieceFraiche TEXT NOT NULL,
        $observationsPieceFraiche TEXT,
        $radioVentilateurs TEXT NOT NULL,
        $observationsVentilateurs TEXT,
        $radioThermo TEXT NOT NULL,
        $observationsThermo TEXT,
        $radioEauMenus TEXT NOT NULL,
        $observationsEauMenus TEXT,
        $radioReserves TEXT NOT NULL,
        $observationsReserves TEXT,
        $radioOmbre TEXT NOT NULL,
        $observationsOmbre TEXT,
        $radioRafraichissement TEXT NOT NULL,
        $observationsRafraichissement TEXT,
        $radioGesteBarriere TEXT NOT NULL,
        $observationsGesteBarriere TEXT,
        $radioGestionPosteriori TEXT NOT NULL,
        $observationsGestionPosteriori TEXT,
        $appreciationGenerale TEXT,
        $prescriptionsEcheances TEXT,
        $copyTo TEXT,
        $controllername TEXT,
        $dateDuControle INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $signatureAuthorite TEXT
      ) 
    ''');

    await database.execute('''CREATE TABLE IF NOT EXISTS $tableActivite (
        $activiteId INTEGER PRIMARY KEY AUTOINCREMENT,
        $formSHId INT,
        $formAHId INT,
        $nomActivite TEXT NOT NULL,
        $categorie INT NOT NULL,
        $typeActivite TEXT,
        $encadrantNomPrenom TEXT,
        $encadrantQualif TEXT,
        $numCartePro TEXT,
        FOREIGN KEY($formSHId) REFERENCES $formSH($formSHId),
        FOREIGN KEY($formAHId) REFERENCES $formAH($formAHId)
      )
    ''');

    await database.execute('''CREATE TABLE IF NOT EXISTS $formAH (
        $formAHId INTEGER PRIMARY KEY AUTOINCREMENT,
        $visiteRealiseePar TEXT NOT NULL,
        $enPresenceDe TEXT NOT NULL,
        $dateVisite INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $denomination TEXT NOT NULL,
        $adresse TEXT NOT NULL,
        $lieu TEXT NOT NULL,
        $numeroDeclaration TEXT NOT NULL,
        $startDate INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $endDate INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $radioTypeAccueil TEXT NOT NULL,
        $radio227_5 TEXT NOT NULL,
        $obs227_5 TEXT,
        $radio227_29 TEXT NOT NULL,
        $obs227_29 TEXT,
        $capAcc TEXT NOT NULL,
        $moinsDe6AnsDeclares TEXT,
        $entre6et13AnsDeclares TEXT,
        $entre14et17AnsDeclares TEXT,
        $moinsDe6AnsPresents TEXT,
        $entre6et13AnsPresents TEXT,
        $entre14et17AnsPresents TEXT,
        $moinsDe6AnsHandi TEXT,
        $entre6et13AnsHandi TEXT,
        $entre14et17AnsHandi TEXT,
        $radio2324_13 TEXT NOT NULL,
        $observations2324_13 TEXT,
        $radio2324_14 TEXT NOT NULL,
        $observations2324_14 TEXT,
        $radioRegistreMineur TEXT NOT NULL,
        $observationsRegistreMineur TEXT,
        $directeurNom TEXT,
        $directeurPrenom TEXT,
        $directeurQualification TEXT,
        $radioTitulaireStagiaire TEXT NOT NULL,
        $dateRenouvellement INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $dateDebutFormation INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $dateStartDerogation INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $dateEndDerogation INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $adjointNom TEXT,
        $adjointPrenom TEXT,
        $adjointQualif TEXT,
        $nombreAnimQualif TEXT,
        $nombreAnimStagiaires TEXT,
        $nombreAnimNonQualif TEXT,
        $encadrementRequisMoinsDe6 TEXT,
        $encadrementRequisPlusDe6 TEXT,
        $radio227_2 TEXT NOT NULL,
        $observations227_2 TEXT,
        $radioArrete3_5 TEXT NOT NULL,
        $observationsArrete3_5 TEXT,
        $radio9_02_07 TEXT NOT NULL,
        $observations9_02_07 TEXT,
        $radio227_8 TEXT NOT NULL,
        $observations227_8 TEXT,
        $radioSuiviSanitaire TEXT NOT NULL,
        $observationsSuiviSanitaire TEXT,
        $observationsCommunicationOrganisateur TEXT,
        $observationsSavoirComportement TEXT,
        $observationsQualifPersonnel TEXT,
        $observationsReuBilan TEXT,
        $observationsEvalStg TEXT,
        $radioProjEdu TEXT NOT NULL,
        $observationsProjEdu TEXT,
        $radioProjPeda TEXT NOT NULL,
        $observationsProjPeda TEXT,
        $radioRepresentant TEXT NOT NULL,
        $observationsRepresentant TEXT,
        $observationsPE TEXT,
        $observationsMoyens TEXT,
        $observationsMoyensEquipe TEXT,
        $observationsBudget TEXT,
        $observationsOrientation TEXT,
        $observationsDiagnostic TEXT,
        $observationsPolitique TEXT,
        $observationsReorientation TEXT,
        $observationsPPCoherence TEXT,
        $observationsPPCara TEXT,
        $observationsPPConcertation TEXT,
        $observationsPPModalite TEXT,
        $observationsPPNature TEXT,
        $observationsPPRepartition TEXT,
        $observationsSecuriteNuit TEXT,
        $observationsPPSanteHandi TEXT,
        $observationsPPFonctEquipe TEXT,
        $observationsPPEvalAccueil TEXT,
        $observationsActivitesType TEXT,
        $observationsPrestataire TEXT,
        $observationsActiviteMineur TEXT,
        $observationsRisques TEXT,
        $observationsEchange TEXT,
        $observationsFormation TEXT,
        $radioAqua TEXT NOT NULL,
        $radioAutorisations TEXT NOT NULL,
        $radioIsolation TEXT NOT NULL,
        $observationsIsolation TEXT,
        $radioVaccination TEXT NOT NULL,
        $observationsVaccination TEXT,
        $radioAntecedents TEXT NOT NULL,
        $observationsAntecedents TEXT,
        $radioMineurTraitement TEXT NOT NULL,
        $observationsMineurTraitement TEXT,
        $radioAllergies TEXT NOT NULL,
        $observationsAllergies TEXT,
        $radioOrdonnances TEXT NOT NULL,
        $observationsOrdonnances TEXT,
        $radioRegistreSoins TEXT NOT NULL,
        $observationsRegistreSoins TEXT,
        $radioPremierSoins TEXT NOT NULL,
        $observationsPremierSoins TEXT,
        $radioCommSecours TEXT NOT NULL,
        $observationsCommSecours TEXT,
        $radioNumUrgence TEXT NOT NULL,
        $observationsNumUrgence TEXT,
        $radioCommissionSecu TEXT NOT NULL,
        $observationsCommissionSecu TEXT,
        $radioAssurance TEXT NOT NULL,
        $observationsAssurance TEXT,
        $radioSignaletique TEXT NOT NULL,
        $observationsSignaletique TEXT,
        $radioEvacuation TEXT NOT NULL,
        $observationsEvacuation TEXT,
        $radioExtincteur TEXT NOT NULL,
        $observationsExtincteur TEXT,   
        $radioDetecteur TEXT NOT NULL,
        $observationsDetecteur TEXT,
        $radioExercice TEXT NOT NULL,
        $observationsExercice TEXT,
        $radioConditionsMeteo TEXT NOT NULL,
        $observationsConditionsMeteo TEXT,
        $radioHygiene TEXT NOT NULL,
        $observationsHygiene TEXT,
        $radioCouchage TEXT NOT NULL,
        $observationsCouchage TEXT,
        $radioHebergeDirection TEXT NOT NULL,
        $observationsHebergeDirection TEXT,
        $radioSanitaire TEXT NOT NULL,
        $observationsSanitaire TEXT,
        $radioSieste TEXT NOT NULL,
        $observationsSieste TEXT,
        $radioEspacesAdapte TEXT NOT NULL,
        $observationsEspacesAdapte TEXT,
        $radioRepli TEXT NOT NULL,
        $observationsRepli TEXT,
        $radioCuisine TEXT NOT NULL,
        $observationsCuisine TEXT,
        $radioSalleResto TEXT NOT NULL,
        $observationsSalleResto TEXT,
        $radioPlatsTemoins TEXT NOT NULL,
        $observationsPlatsTemoins TEXT,
        $radioTracabilite TEXT NOT NULL,
        $observationsTracabilite TEXT,
        $radioStockage TEXT NOT NULL,
        $observationsStockage TEXT,
        $radioRefrigerateur TEXT NOT NULL,
        $observationsRefrigerateur TEXT,
        $radioPiqueNique TEXT NOT NULL,
        $observationsPiqueNique TEXT,
        $radioGestion TEXT NOT NULL,
        $observationsGestion TEXT,
        $radioVeille TEXT NOT NULL,
        $observationsVeille TEXT,
        $radioPreventionChaleur TEXT NOT NULL,
        $observationsPreventionChaleur TEXT,
        $radioEquipement TEXT NOT NULL,
        $observationsEquipement TEXT,
        $radioPieceFraiche TEXT NOT NULL,
        $observationsPieceFraiche TEXT,
        $radioVentilateurs TEXT NOT NULL,
        $observationsVentilateurs TEXT,
        $radioThermo TEXT NOT NULL,
        $observationsThermo TEXT,
        $radioEauMenus TEXT NOT NULL,
        $observationsEauMenus TEXT,
        $radioReserves TEXT NOT NULL,
        $observationsReserves TEXT,
        $radioOmbre TEXT NOT NULL,
        $observationsOmbre TEXT,
        $radioRafraichissement TEXT NOT NULL,
        $observationsRafraichissement TEXT,
        $radioGesteBarriere TEXT NOT NULL,
        $observationsGesteBarriere TEXT,
        $radioGestionPosteriori TEXT NOT NULL,
        $observationsGestionPosteriori TEXT,
        $appreciationGenerale TEXT,
        $prescriptionsEcheances TEXT,
        $copyTo TEXT,
        $controllername TEXT,
        $dateDuControle INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $signatureAuthorite TEXT
      )
    ''');

    await database.execute('''CREATE TABLE IF NOT EXISTS $formScout(
        $formScoutId INTEGER PRIMARY KEY AUTOINCREMENT,
        $visiteRealiseePar TEXT NOT NULL,
        $enPresenceDe TEXT NOT NULL,
        $dateVisite INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $typeSej TEXT NOT NULL,
        $mouvementOrga TEXT NOT NULL,
        $numeroDeclaration TEXT NOT NULL,
        $startDate INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $endDate INTEGER NOT NULL DEFAULT (CAST(strftime('%s','now') AS INTEGER)),
        $nomCoord TEXT NOT NULL
      )
    ''');

    print("Table created");
  }

// Manipulation de la DB SansH

  Future<int> insertSH(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(formSH, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsSH() async {
    Database db = await instance.database;
    return await db.query(formSH);
  }
  
  Future<int> updateSH(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.update(formSH, row, where: '$formSHId= ?', whereArgs: [formSHId]);
  }

  static Future<void> deleteSH(int id) async {
    final db = await instance.database;
    try {
      await db.delete(formSH, where: '$id = ?', whereArgs: [id]);
    } catch (err) { debugPrint("Something went wrong when deleting a form: $err");
  }
  }

// Manipulation de la DB AvecH

  Future<int> insertAH(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(formAH, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsAH() async {
    Database db = await instance.database;
    return await db.query(formAH);
  }
  
  Future<int> updateAH(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.update(formAH, row, where: '$formAHId= ?', whereArgs: [formAHId]);
  }

  static Future<void> deleteAH(int id) async {
    final db = await instance.database;
    try {
      await db.delete(formAH, where: '$id = ?', whereArgs: [id]);
    } catch (err) { debugPrint("Something went wrong when deleting a form: $err");
  }
  }

  // Manipulation de la DB Scout

  Future<int> insertScout(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(formScout, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsScout() async {
    Database db = await instance.database;
    return await db.query(formScout);
  }
  
  Future<int> updateScout(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.update(formScout, row, where: '$formScoutId= ?', whereArgs: [formScoutId]);
  }

  static Future<void> deleteScout(int id) async {
    final db = await instance.database;
    try {
      await db.delete(formScout, where: '$id = ?', whereArgs: [id]);
    } catch (err) { debugPrint("Something went wrong when deleting a form: $err");
  }
  }

  // Manipulation de la DB Activite

  Future<int> insertActivite(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(tableActivite, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsActivite() async {
    Database db = await instance.database;
    return await db.query(tableActivite);
  }
  
  Future<int> updateActivite(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.update(tableActivite, row, where: '$formSHId= ?', whereArgs: [formSHId]);
  }

  static Future<void> deleteActivite(int id) async {
    final db = await instance.database;
    try {
      await db.delete(tableActivite, where: '$id = ?', whereArgs: [id]);
    } catch (err) { debugPrint("Something went wrong when deleting a form: $err");
  }
  }
}