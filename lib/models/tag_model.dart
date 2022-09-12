// class TagsModel {
//   Tags? tags;
//
//   TagsModel({this.tags});
//
//   TagsModel.fromJson(Map<String, dynamic> json) {
//     tags = json['tags'] != null ? new Tags.fromJson(json['tags']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.tags != null) {
//       data['tags'] = this.tags!.toJson();
//     }
//     return data;
//   }
// }

class TagsModel {
  String? id;
  String? title;

  TagsModel({this.id, this.title});

  TagsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}