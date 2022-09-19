// class ArticleInfoModel {
//   Info? info;
//
//   ArticleInfoModel({this.info});
//
//   ArticleInfoModel.fromJson(Map<String, dynamic> json) {
//     info = json['info'] != null ? new Info.fromJson(json['info']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.info != null) {
//       data['info'] = this.info!.toJson();
//     }
//     return data;
//   }
// }

import 'package:tech_blog/component/api_constant.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  ArticleInfoModel(
      {this.id,
        this.title,
        this.content,
        this.image,
        this.catId,
        this.catName,
        this.author,
        this.view,
        this.status,
        this.createdAt});

  ArticleInfoModel.fromJson(Map<String, dynamic> json) {
    var info = json['info'];
    id = info['id'];
    title = info['title'];
    content = info['content'];
    image =ApiConstant.hostUrl +  info['image'];
    catId = info['cat_id'];
    catName = info['cat_name'];
    author = info['author'];
    view = info['view'];
    status = info['status'];
    createdAt = info['created_at'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
    data['author'] = this.author;
    data['view'] = this.view;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}