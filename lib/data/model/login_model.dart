
class LoginModel {
  Meta? meta;
  Data? data;

  LoginModel({this.meta, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  User? user;
  List<String>? role;

  Data({this.token, this.user, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    token = json["token"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    role = json["role"] == null ? null : List<String>.from(json["role"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    if(role != null) {
      _data["role"] = role;
    }
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
  List<Roles>? roles;

  User({this.id, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt, this.roles});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    roles = json["roles"] == null ? null : (json["roles"] as List).map((e) => Roles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if(roles != null) {
      _data["roles"] = roles?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Roles {
  int? id;
  String? name;
  String? guardName;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles({this.id, this.name, this.guardName, this.createdAt, this.updatedAt, this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    guardName = json["guard_name"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    pivot = json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["guard_name"] = guardName;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if(pivot != null) {
      _data["pivot"] = pivot?.toJson();
    }
    return _data;
  }
}

class Pivot {
  int? modelId;
  int? roleId;
  String? modelType;

  Pivot({this.modelId, this.roleId, this.modelType});

  Pivot.fromJson(Map<String, dynamic> json) {
    modelId = json["model_id"];
    roleId = json["role_id"];
    modelType = json["model_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["model_id"] = modelId;
    _data["role_id"] = roleId;
    _data["model_type"] = modelType;
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
