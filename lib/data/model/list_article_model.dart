
class ListArticleModel {
  Meta? meta;
  List<Data>? data;

  ListArticleModel({this.meta, this.data});

  ListArticleModel.fromJson(Map<String, dynamic> json) {
    meta = json["meta"] == null ? null : Meta.fromJson(json["meta"]);
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(meta != null) {
      _data["meta"] = meta?.toJson();
    }
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  int? idCategory;
  String? title;
  String? slug;
  String? body;
  String? image;
  String? author;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.idCategory, this.title, this.slug, this.body, this.image, this.author, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    idCategory = json["id_category"];
    title = json["title"];
    slug = json["slug"];
    body = json["body"];
    image = json["image"];
    author = json["author"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["id_category"] = idCategory;
    _data["title"] = title;
    _data["slug"] = slug;
    _data["body"] = body;
    _data["image"] = image;
    _data["author"] = author;
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