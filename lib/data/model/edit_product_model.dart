
class EditProductModel {
  Meta? meta;
  Data? data;

  EditProductModel({this.meta, this.data});

  EditProductModel.fromJson(Map<String, dynamic> json) {
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
  int? idToko;
  String? name;
  String? detail;
  int? price;
  String? stok;
  String? image;
  String? tokoName;

  Data({this.id, this.createdAt, this.updatedAt, this.idToko, this.name, this.detail, this.price, this.stok, this.image, this.tokoName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    idToko = json["id_toko"];
    name = json["name"];
    detail = json["detail"];
    price = json["price"];
    stok = json["stok"];
    image = json["image"];
    tokoName = json["toko_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["id_toko"] = idToko;
    _data["name"] = name;
    _data["detail"] = detail;
    _data["price"] = price;
    _data["stok"] = stok;
    _data["image"] = image;
    _data["toko_name"] = tokoName;
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