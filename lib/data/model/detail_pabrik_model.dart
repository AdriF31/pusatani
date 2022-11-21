class DetailPabrikModel {
  Meta? meta;
  Data? data;

  DetailPabrikModel({this.meta, this.data});

  DetailPabrikModel.fromJson(Map<String, dynamic> json) {
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (meta != null) {
      _data["meta"] = meta?.toJson();
    }
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  Data1? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data1.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data1 {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? idUser;
  String? name;
  String? deskripsi;
  String? address;
  String? image;
  String? status;
  String? userName;
  List<dynamic>? pabrikToGabah;

  Data1(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.idUser,
      this.name,
      this.deskripsi,
      this.address,
      this.image,
      this.status,
      this.userName,
      this.pabrikToGabah});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    idUser = json["id_user"];
    name = json["name"];
    deskripsi = json["deskripsi"];
    address = json["address"];
    image = json["image"];
    status = json["status"];
    userName = json["user_name"];
    pabrikToGabah = json["pabrik_to_gabah"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["id_user"] = idUser;
    _data["name"] = name;
    _data["deskripsi"] = deskripsi;
    _data["address"] = address;
    _data["image"] = image;
    _data["status"] = status;
    _data["user_name"] = userName;
    if (pabrikToGabah != null) {
      _data["pabrik_to_gabah"] = pabrikToGabah;
    }
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
