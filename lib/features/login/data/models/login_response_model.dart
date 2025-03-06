class LoginResponseModel {
  UserData? userData;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userData = json["data"] != null ? UserData.fromJson(json["data"]) : null;
  }
}

class UserData {
  String? token;
  User? user;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    user = json["user"] != null ? User.fromJson(json["user"]) : null;
  }
}

class User {
  int? id;
  String? name;
  String? email;

  User(this.id, this.name, this.email);

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
  }
}
