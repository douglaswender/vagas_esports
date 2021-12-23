class UserModel {
  String? id;
  String? email;
  String? password;

  UserModel({
    this.id,
    this.email,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
