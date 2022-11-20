import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:pusatani/data/model/add_toko_model.dart';
import 'package:pusatani/data/model/detail_pabrik_model.dart';
import 'package:pusatani/data/model/detail_toko_model.dart';
import 'package:pusatani/data/model/list_article_model.dart';
import 'package:pusatani/data/model/login_model.dart';
import 'package:pusatani/data/model/pabrik_model.dart';
import 'package:pusatani/data/model/register_model.dart';
import 'package:pusatani/data/model/toko_model.dart';
import 'package:pusatani/data/repository/repository.dart';
import 'package:pusatani/data/storage_core.dart';

import '../network_core.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();
  final storage = StorageCore();
  @override
  FutureOr<LoginModel?> postLogin(String email, String password) async {
    try {
      var response = await network.dio.post("/auth/login",
          data: {"email": email, "password": password},
          options: Options(headers: {"Accept": "application/json"}));

      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      return LoginModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<TokoModel?> getToko() async {
    try {
      var response = await network.dio.get('/toko',
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return TokoModel.fromJson(response.data);
    } on DioError catch (e) {
      return TokoModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<PabrikModel> getPabrik() async {
    try {
      var response = await network.dio.get('/pabrik',
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return PabrikModel.fromJson(response.data);
    } on DioError catch (e) {
      return PabrikModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<RegisterModel> postRegister(
      File? profilePicture,
      String email,
      String name,
      int role,
      File? idPicture,
      String phone,
      String password) async {
    try {
      var formData = FormData.fromMap({
        'name': name,
        'email': email,
        'role': role,
        'phone': phone,
        'password': password
      });

      if (profilePicture != null && idPicture != null) {
        formData.files.addAll([
          MapEntry("photo_profile",
              await MultipartFile.fromFile(profilePicture.path)),
          MapEntry('photo_id', await MultipartFile.fromFile(idPicture.path))
        ]);
      }

      var response = await network.dio.post('/auth/signup', data: formData);

      return RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      return RegisterModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<ListArticleModel?> getListArticle() async {
    try {
      var response = await network.dio.get('/article');
      return ListArticleModel.fromJson(response.data);
    } on DioError catch (e) {
      return ListArticleModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<DetailPabrikModel> getDetailPabrik(int id) async {
    try {
      var response = await network.dio.get('/pabrikWith/$id');
      return DetailPabrikModel.fromJson(response.data);
    } on DioError catch (e) {
      return DetailPabrikModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<DetailTokoModel?> getDetailToko(int id) async {
    try {
      var response = await network.dio.get('/tokoWith/$id',
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return DetailTokoModel.fromJson(response.data);
    } on DioError catch (e) {
      return DetailTokoModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<AddTokoModel?> postToko( String name, String address,
       String deskripsi, File? image) async {
    try {
      var formData = FormData.fromMap({
        'name': name,
        'id_user': storage.getCurrentUserId(),
        'address': address,
        'status': 'belum verifikasi',
        'deskripsi': deskripsi,
      });

      if (image != null) {
        formData.files.addAll([
          MapEntry("image", await MultipartFile.fromFile(image.path)),
        ]);
      }

      var response = await network.dio.post('/toko',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return AddTokoModel.fromJson(response.data);
    } on DioError catch (e) {
      return AddTokoModel.fromJson(e.response!.data);
    }
  }
}
