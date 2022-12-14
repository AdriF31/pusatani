
class DetailTokoModel {
  Meta? meta;
  Data? data;

  DetailTokoModel({this.meta, this.data});

  DetailTokoModel.fromJson(Map<String, dynamic> json) {
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
  Data1? data;
  String? phone;

  Data({this.data, this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data1.fromJson(json["data"]);
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    _data["phone"] = phone;
    return _data;
  }
}

class Data1 {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? idUser;
  String? name;
  String? address;
  String? image;
  String? status;
  String? deskripsi;
  String? userName;
  List<dynamic>? tokoToProduk;

  Data1({this.id, this.createdAt, this.updatedAt, this.idUser, this.name, this.address, this.image, this.status, this.deskripsi, this.userName, this.tokoToProduk});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    idUser = json["id_user"];
    name = json["name"];
    address = json["address"];
    image = json["image"];
    status = json["status"];
    deskripsi = json["deskripsi"];
    userName = json["user_name"];
    tokoToProduk = json["toko_to_produk"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["id_user"] = idUser;
    _data["name"] = name;
    _data["address"] = address;
    _data["image"] = image;
    _data["status"] = status;
    _data["deskripsi"] = deskripsi;
    _data["user_name"] = userName;
    if(tokoToProduk != null) {
      _data["toko_to_produk"] = tokoToProduk;
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