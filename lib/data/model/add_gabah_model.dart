
// ignore_for_file: no_leading_underscores_for_local_identifiers

class AddGabahModel {
  Meta? meta;
  Data? data;

  AddGabahModel({this.meta, this.data});

  AddGabahModel.fromJson(Map<String, dynamic> json) {
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
  String? idPabrik;
  String? name;
  String? detail;
  String? price;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? pabrikName;

  Data({this.idPabrik, this.name, this.detail, this.price, this.image, this.updatedAt, this.createdAt, this.id, this.pabrikName});

  Data.fromJson(Map<String, dynamic> json) {
    idPabrik = json["id_pabrik"];
    name = json["name"];
    detail = json["detail"];
    price = json["price"];
    image = json["image"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    id = json["id"];
    pabrikName = json["pabrik_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id_pabrik"] = idPabrik;
    _data["name"] = name;
    _data["detail"] = detail;
    _data["price"] = price;
    _data["image"] = image;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
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