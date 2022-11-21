// ignore_for_file: no_leading_underscores_for_local_identifiers

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
  List<TokoToProduk>? tokoToProduk;

  Data(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.idUser,
      this.name,
      this.address,
      this.image,
      this.status,
      this.deskripsi,
      this.userName,
      this.tokoToProduk});

  Data.fromJson(Map<String, dynamic> json) {
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
    tokoToProduk = json["toko_to_produk"] == null
        ? null
        : (json["toko_to_produk"] as List)
            .map((e) => TokoToProduk.fromJson(e))
            .toList();
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
    if (tokoToProduk != null) {
      _data["toko_to_produk"] = tokoToProduk?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class TokoToProduk {
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

  TokoToProduk(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.idToko,
      this.name,
      this.detail,
      this.price,
      this.stok,
      this.image,
      this.tokoName});

  TokoToProduk.fromJson(Map<String, dynamic> json) {
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
