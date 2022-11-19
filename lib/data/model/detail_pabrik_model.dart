
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
  List<PabrikToGabah>? pabrikToGabah;

  Data({this.id, this.createdAt, this.updatedAt, this.idUser, this.name, this.deskripsi, this.address, this.image, this.status, this.userName, this.pabrikToGabah});

  Data.fromJson(Map<String, dynamic> json) {
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
    pabrikToGabah = json["pabrik_to_gabah"] == null ? null : (json["pabrik_to_gabah"] as List).map((e) => PabrikToGabah.fromJson(e)).toList();
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
    if(pabrikToGabah != null) {
      _data["pabrik_to_gabah"] = pabrikToGabah?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class PabrikToGabah {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? idPabrik;
  String? name;
  String? detail;
  String? price;
  String? image;
  String? pabrikName;

  PabrikToGabah({this.id, this.createdAt, this.updatedAt, this.idPabrik, this.name, this.detail, this.price, this.image, this.pabrikName});

  PabrikToGabah.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    idPabrik = json["id_pabrik"];
    name = json["name"];
    detail = json["detail"];
    price = json["price"];
    image = json["image"];
    pabrikName = json["pabrik_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["id_pabrik"] = idPabrik;
    _data["name"] = name;
    _data["detail"] = detail;
    _data["price"] = price;
    _data["image"] = image;
    _data["pabrik_name"] = pabrikName;
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