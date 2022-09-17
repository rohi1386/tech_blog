// class PosterModel {
//   Poster? poster;
//
//   PosterModel({this.poster});
//
//   PosterModel.fromJson(Map<String, dynamic> json) {
//     poster =
//     json['poster'] != null ? new Poster.fromJson(json['poster']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.poster != null) {
//       data['poster'] = this.poster!.toJson();
//     }
//     return data;
//   }
// }

import 'package:tech_blog/component/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({this.id, this.title, this.image});

  PosterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image =ApiConstant.hostUrl +  json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    return data;
  }
}