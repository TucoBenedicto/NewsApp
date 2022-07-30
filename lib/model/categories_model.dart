//Model
class CategoryModel {
  final name, imageUrl, rssCategory;
  CategoryModel({this.name, this.imageUrl, this.rssCategory});
}

List<CategoryModel> categories = [
  CategoryModel(
      name: "une",
      imageUrl: "assets/images/categories/topnews.jpg",
      rssCategory: "rss/une"),
  CategoryModel(
      name: "Société",
      imageUrl: "assets/images/categories/india.jpg",
      rssCategory: "societe/rss_full"),
  CategoryModel(
      name: "High-Tech",
      imageUrl: "assets/images/categories/world.jpg",
      rssCategory: "pixels/rss_full"),
  CategoryModel(
      name: "Santé",
      imageUrl: "assets/images/categories/business.jpg",
      rssCategory: "sante/rss_full"),
  CategoryModel(
      name: "Politique",
      imageUrl: "assets/images/categories/sports.jpg",
      rssCategory: "politique/rss_full"),
  CategoryModel(
      name: "Science",
      imageUrl: "assets/images/categories/cricket.jpg",
      rssCategory: "sciences/rss_full"),
  CategoryModel(
      name: "Sport",
      imageUrl: "assets/images/categories/education.jpg",
      rssCategory: "sport/rss_full"),
  CategoryModel(
      name: "Economie",
      imageUrl: "assets/images/categories/entertainment.jpg",
      rssCategory: "economie/rss_full"),
  CategoryModel(
      name: "International",
      imageUrl: "assets/images/categories/lifestyle.jpg",
      rssCategory: "international/rss_full"),
  CategoryModel(
      name: "Culture",
      imageUrl: "assets/images/categories/health_fitness.jpg",
      rssCategory: "culture/rss_full"),
  //CategoryModel(name: "Books", imageUrl: "assets/images/categories/books.jpg"),
  //CategoryModel(name: "Its Viral", imageUrl: "assets/images/categories/its_viral.jpg"),
];
