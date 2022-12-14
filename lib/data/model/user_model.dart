
class UserModel {
  Meta? meta;
  Data? data;

  UserModel({this.meta, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(meta != null) {
      _data["meta"] = meta?.toJson();
    }
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  User? user;
  Userdetails? userdetails;
  dynamic idPabrik;
  int? idToko;

  Data({this.user, this.userdetails, this.idPabrik, this.idToko});

  Data.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    userdetails = json["userdetails"] == null ? null : Userdetails.fromJson(json["userdetails"]);
    idPabrik = json["id_pabrik"];
    idToko = json["id_toko"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    if(userdetails != null) {
      _data["userdetails"] = userdetails?.toJson();
    }
    _data["id_pabrik"] = idPabrik;
    _data["id_toko"] = idToko;
    return _data;
  }
}

class Userdetails {
  int? id;
  int? idUser;
  String? phone;
  String? photoProfile;
  String? photoId;
  String? createdAt;
  String? updatedAt;

  Userdetails({this.id, this.idUser, this.phone, this.photoProfile, this.photoId, this.createdAt, this.updatedAt});

  Userdetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    idUser = json["id_user"];
    phone = json["phone"];
    photoProfile = json["photo_profile"];
    photoId = json["photo_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["id_user"] = idUser;
    _data["phone"] = phone;
    _data["photo_profile"] = photoProfile;
    _data["photo_id"] = photoId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class Meta {
  int? code;
  String? status;
  String? message;

  Meta({this.code, this.status, this.message});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    status = json["status"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["status"] = status;
    _data["message"] = message;
    return _data;
  }
}