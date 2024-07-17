import 'package:flutter_application_2/main.dart';
import 'package:objectbox/objectbox.dart';
import 'dart:core';

@reflector
@Entity()
class SansHModel {
  @Id()
  int formSHId = 0;

  //1ere section
  String visiteRealiseePar = '';
  String enPresenceDe = '';

  //2eme section
  String denomination = '';
  String adresse = '';
  String lieu = '';
  String numeroDeclaration = '';
  String radioTypeAccueil = '';
  String radio227_5 = '';
  String radio227_29 = '';
  String observations227_5 = '';
  String observations227_29 = '';
  
  //3eme section
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
  String radio2324_13 = '';
  String radio2324_14  = '';
  String observations2324_13 = '';
  String observations2324_14  = '';
  String radioRegistreMineur = ''; 
  String observationsRegistreMineur = '';

  String directeurNom = '';
  String directeurPrenom = '';
  String directeurQualification = '';
  String radioTitulaireStagiaire = '';
  String nombreAnimQualif = ''; 
  String nombreAnimStagiaires = ''; 
  String nombreAnimNonQualif = '';
  String encadrementRequisMoinsDe6 = '';
  String encadrementRequisPlusDe6 = '';
  
  String radio227_2 = '';
  String observations227_2 = '';
  String radioArrete3_5 = '';
  String observationsArrete3_5 = '';
  String radio9_02_07 = '';
  String observations9_02_07 = '';
  String radio227_8 = '';
  String observations227_8 = '';
  String observationsCommunicationOrganisateur = ''; 
  String observationsSavoirComportement = '';
  String observationsQualifPersonnel = ''; 
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
  String radioAqua = ''; 
  String radioAutorisations = '';

  // Minibus Section 
  
  String radioUtilisationMinibus ='';
  String radioTransportsCommuns = '';
  String radioCarnetsRoute = '';
  String radioConnaissanceSecurite = '';
  String radioQualiteConduite = '';
  String radioConditionsTravail = '';


  // Section 6
  String observationsVaccination = ''; 
  String observationsAntecedents = ''; 
  String observationsMineurTraitement = ''; 
  String observationsAllergies = ''; 
  String observationsOrdonnances = ''; 
  String observationsRegistreSoins = ''; 
  String observationsPremierSoins = ''; 
  String observationsCommSecours = ''; 
  String observationsNumUrgence = ''; 
  String radioVaccination = ''; 
  String radioAntecedents = ''; 
  String radioMineurTraitement = ''; 
  String radioAllergies = ''; 
  String radioOrdonnances = ''; 
  String radioRegistreSoins = ''; 
  String radioPremierSoins = ''; 
  String radioCommSecours = ''; 
  String radioNumUrgence = ''; 


  //Section 7
  String radioCommissionSecu = ''; 
  String radioAssurance = ''; 
  String radioSignaletique = ''; 
  String radioEvacuation = ''; 
  String radioExtincteur = ''; 
  String radioDetecteur = ''; 
  String radioExercice = ''; 
  String radioConditionsMeteo = ''; 
  String radioHygiene = ''; 
  String radioSanitaire = ''; 
  String radioSieste = ''; 
  String radioEspacesAdapte = ''; 
  String observationsCommissionSecu = ''; 
  String observationsAssurance = ''; 
  String observationsSignaletique = ''; 
  String observationsEvacuation = ''; 
  String observationsExtincteur = ''; 
  String observationsDetecteur = ''; 
  String observationsExercice = ''; 
  String observationsConditionsMeteo = ''; 
  String observationsHygiene = ''; 
  String observationsSanitaire = ''; 
  String observationsSieste = ''; 
  String observationsEspacesAdapte = ''; 

  //Section 8
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

  //Section 9
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

  //Section 10
  String appreciationGenerale = ''; 
  String prescriptionsEcheances = ''; 
  String controllerName = '';

  @Property(type: PropertyType.date)
  DateTime dateVisite = DateTime(2001, 1, 1);

  @Property(type: PropertyType.date)
  DateTime startDate = DateTime(2001, 1, 1);

  @Property(type: PropertyType.date)
  DateTime endDate = DateTime(2001, 1, 1);

  @Property(type: PropertyType.date)
  DateTime dateRenouvellement = DateTime(2001, 1, 1);

  @Property(type: PropertyType.date)
  DateTime dateDebutFormation = DateTime(2001, 1, 1);

  @Property(type: PropertyType.date)
  DateTime dateStartDerogation = DateTime(2001, 1, 1);

  @Property(type: PropertyType.date)
  DateTime dateDuControle = DateTime(2001, 1, 1);

  @Property(type: PropertyType.date)
  DateTime dateEndDerogation = DateTime(2001, 1, 1);

  List<String> copyTo = [];
  List<String> signatureAuthoriteJSON = [];
}