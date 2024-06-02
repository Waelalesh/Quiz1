class UserModel {
  int? id;
  String? fullName;
  String? about;
  String? image;

  UserModel({this.id, this.fullName, this.about, this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['first_name'] + " " + json['last_name'];
    about = json['about'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['about'] = about;
    data['image'] = image;
    return data;
  }
}
