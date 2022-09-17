// class PodcastModel {
//   List<TopPodcasts>? topPodcasts;
//
//   PodcastModel({this.topPodcasts});
//
//   PodcastModel.fromJson(Map<String, dynamic> json) {
//     if (json['top_podcasts'] != null) {
//       topPodcasts = <TopPodcasts>[];
//       json['top_podcasts'].forEach((v) {
//         topPodcasts!.add(new TopPodcasts.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.topPodcasts != null) {
//       data['top_podcasts'] = this.topPodcasts!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

import 'package:tech_blog/component/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createdAt;

  PodcastModel(
      {this.id,
      this.title,
      this.poster,
      this.publisher,
      this.view,
      this.createdAt});

  PodcastModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

    poster =ApiConstant.hostUrl +  json['poster'];
    publisher = json['publisher'];
    view = json['view'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['poster'] = this.poster;
    data['publisher'] = this.publisher;
    data['view'] = this.view;
    data['created_at'] = this.createdAt;
    return data;
  }
}
