import 'package:flutter_application_2/Forms/SansH.dart';
import 'package:flutter_application_2/objectbox_core.dart';
import 'package:signature/signature.dart';

class SansHData {
  //1ere section
  String visiteRealiseePar = '',
  enPresenceDe = '',
  //2eme section
  denomination = '',adresse = '',lieu = '',
  numeroDeclaration = '',radioTypeAccueil = '',radio227_5 = '',radio227_29 = '',
  observations227_5 = '',observations227_29 = '',
  
  //3eme section
  capaciteAccueil = '',
  moinsDe6AnsDeclares = '',entre6et13AnsDeclares = '',entre14et17AnsDeclares = '',
  moinsDe6AnsPresents = '',entre6et13AnsPresents = '',entre14et17AnsPresents = '',
  moinsDe6AnsHandi = '',entre6et13AnsHandi = '',entre14et17AnsHandi = '',
  totalDeclares = '',totalPresents = '',totalHandi = '',
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
  
  //Section 5
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
  
  // Section 6
  observationsVaccination = '',observationsAntecedents = '',observationsMineurTraitement = '', 
  observationsAllergies = '', observationsOrdonnances = '', observationsRegistreSoins = '', 
  observationsPremierSoins = '',observationsCommSecours = '',observationsNumUrgence = '',
  radioVaccination = '',radioAntecedents = '',radioMineurTraitement = '', 
  radioAllergies = '', radioOrdonnances = '', radioRegistreSoins = '', 
  radioPremierSoins = '',radioCommSecours = '',radioNumUrgence = '',

  //Section 7
  radioCommissionSecu = '',radioAssurance = '',radioSignaletique = '',
  radioEvacuation = '',radioExtincteur = '',radioDetecteur = '',
  radioExercice = '',radioConditionsMeteo = '',radioHygiene = '',
  radioSanitaire = '',radioSieste = '',radioEspacesAdapte = '',
  observationsCommissionSecu = '',observationsAssurance = '',observationsSignaletique = '',
  observationsEvacuation = '',observationsExtincteur = '',observationsDetecteur = '',
  observationsExercice = '',observationsConditionsMeteo = '',observationsHygiene = '',
  observationsSanitaire = '',observationsSieste = '',observationsEspacesAdapte = '',

  //Section 8
  radioCuisine = '',radioSalleResto = '',radioPiqueNique = '',
  radioPlatsTemoins = '',radioTracabilite = '',radioStockage = '',
  radioRefrigerateur = '',
  observationsCuisine = '',observationsSalleResto = '',
  observationsPlatsTemoins = '',observationsTracabilite = '',observationsStockage = '',
  observationsRefrigerateur = '',observationsPiqueNique = '',
  
  //Section 9
  radioGestion = '',radioVeille = '',radioPreventionChaleur = '',
  radioEquipement = '',radioPieceFraiche = '',radioVentilateurs = '',
  radioThermo = '',radioEauMenus = '',radioReserves = '',
  radioOmbre = '',radioRafraichissement = '',radioGesteBarriere = '',
  radioGestionPosteriori = '',
  observationsGestion = '',observationsVeille = '',observationsPreventionChaleur = '',
  observationsEquipement = '',observationsPieceFraiche = '',observationsVentilateurs = '',
  observationsThermo = '',observationsEauMenus = '',observationsReserves = '',
  observationsOmbre = '',observationsRafraichissement = '',observationsGesteBarriere = '',
  observationsGestionPosteriori = '',

  //Section 10
  appreciationGenerale = '', prescriptionsEcheances = '',  controllerName = '';


  DateTime dateVisite = DateTime(2001, 1, 1),
  startDate = DateTime(2001, 1, 1),
  endDate = DateTime(2001, 1, 1),
  dateRenouvellement = DateTime(2001, 1, 1),
  dateDebutFormation = DateTime(2001, 1, 1),
  dateStartDerogation = DateTime(2001, 1, 1),
  dateDuControle = DateTime(2001, 1, 1),
  dateEndDerogation = DateTime(2001, 1, 1);

  List<String> copyTo = [];
  String copyToTest = '';
  List<Point> signatureAuthorite = [];
  List<ActiviteData>? activitesSecu;
  
}