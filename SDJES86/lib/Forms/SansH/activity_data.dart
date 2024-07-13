class ActiviteData {
  String nomActivite = '';
  int categorie = 1; 
  List<String> typeActivite = []; // Type d'activité pour la catégorie 1
  String? encadrantNomPrenom; // Nom/prenom de l'encadrant pour catégorie 2 et 3
  String? encadrantQualif; // Qualification de l'encadrant pour catégorie 2 et 3
  String? numCartePro; // Numero de la carte professionnelle pour catégorie 3
}