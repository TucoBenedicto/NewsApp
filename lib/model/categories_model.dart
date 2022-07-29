//Model
class CategoryModel{
  final name,imageUrl;

  CategoryModel({this.name, this.imageUrl});
}

List<CategoryModel> categories = [
  //CategoryModel(name: "La une", imageUrl: "assets/images/categories/topnews.jpg"),
  CategoryModel(name: "La une", imageUrl: "assets/images/categories/figaro_actualites.jpg"),
  CategoryModel(name: "Société", imageUrl: "assets/images/categories/figaro_actualite-france.jpg"),
  CategoryModel(name: "High-Tech", imageUrl: "assets/images/categories/figaro_secteur_high-tech.jpg"),
  CategoryModel(name: "Santé", imageUrl: "assets/images/categories/figaro_sante.jpg"),
  CategoryModel(name: "Politique ", imageUrl: "assets/images/categories/figaro_politique.jpg"),
  CategoryModel(name: "Science", imageUrl: "assets/images/categories/figaro_sciences.jpg"),
  CategoryModel(name: "Sport", imageUrl: "assets/images/categories/figaro_sport.jpg"),
  CategoryModel(name: "Economie", imageUrl: "assets/images/categories/figaro_economie.jpg"),
  CategoryModel(name: "International", imageUrl: "assets/images/categories/figaro_international.jpg"),
  CategoryModel(name: "Culture ", imageUrl: "assets/images/categories/figaro_culture.jpg"),
];