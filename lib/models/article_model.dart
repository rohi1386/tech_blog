class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? cat_id;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  ArticleModel(
      {this.id,
      this.title,
      this.image,
      this.cat_id,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.createdAt});



  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    cat_id = json['cat_id'];
    catName = json['cat_name'];
    author = json['author'];
    view = json['view'];
    status = json['status'];
    createdAt = json['created_at'];
  }
}
