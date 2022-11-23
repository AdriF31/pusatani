import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:pusatani/data/model/add_gabah_model.dart';
import 'package:pusatani/data/model/add_pabrik_model.dart';
import 'package:pusatani/data/model/add_product_model.dart';
import 'package:pusatani/data/model/add_toko_model.dart';
import 'package:pusatani/data/model/delete_product_model.dart';
import 'package:pusatani/data/model/detail_pabrik_model.dart';
import 'package:pusatani/data/model/detail_toko_model.dart';
import 'package:pusatani/data/model/edit_gabah_model.dart';
import 'package:pusatani/data/model/edit_product_model.dart';
import 'package:pusatani/data/model/edit_profile_model.dart';
import 'package:pusatani/data/model/list_article_model.dart';
import 'package:pusatani/data/model/login_model.dart';
import 'package:pusatani/data/model/logout_model.dart';
import 'package:pusatani/data/model/pabrik_model.dart';
import 'package:pusatani/data/model/register_model.dart';
import 'package:pusatani/data/model/toko_model.dart';
import 'package:pusatani/data/model/user_model.dart';
import 'package:pusatani/data/repository/repository.dart';
import 'package:pusatani/data/storage_core.dart';

import '../model/edit_toko_model.dart';
import '../network_core.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();
  final storage = StorageCore();
  String token = StorageCore().getAccessToken()!;
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
  FutureOr<AddTokoModel?> postToko(
      String name, String address, String deskripsi, File? image) async {
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

  @override
  FutureOr<AddPabrikModel?> postPabrik(
      String name, String address, String deskripsi, File? image) async {
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

      var response = await network.dio.post('/pabrik',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return AddPabrikModel.fromJson(response.data);
    } on DioError catch (e) {
      return AddPabrikModel.fromJson(e.response!.data);
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
  FutureOr<DetailPabrikModel> getDetailPabrik(int id) async {
    try {
      var response = await network.dio.get('/pabrikWith/$id');
      return DetailPabrikModel.fromJson(response.data);
    } on DioError catch (e) {
      return DetailPabrikModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<ListArticleModel?> getListArticle() async {
    try {
      var response = await network.dio.get('/article'
          // , queryParameters: {
          //   'page': currentPage,
          // }
          );
      return ListArticleModel.fromJson(response.data);
    } on DioError catch (e) {
      return ListArticleModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<ListArticleModel?> getPagedListArticle(int page) async {
    try {
      var response = await network.dio.get('/article/?page=$page');
      return ListArticleModel.fromJson(response.data);
    } on DioError catch (e) {
      return ListArticleModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<LogoutModel?> getLogout() async {
    try {
      var response = await network.dio.get('/auth/logout',
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return LogoutModel.fromJson(response.data);
    } on DioError catch (e) {
      return LogoutModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<AddProductModel?> postProduk(
      String name, String detail, int price, String stok, File? image) async {
    try {
      var formData = FormData.fromMap({
        'name': name,
        'id_toko': storage.getCurrentStoreIdFromUser(),
        'price': price,
        'stok': stok,
        'detail': detail,
      });

      if (image != null) {
        formData.files.addAll([
          MapEntry("image", await MultipartFile.fromFile(image.path)),
        ]);
      }

      var response = await network.dio.post('/produk',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return AddProductModel.fromJson(response.data);
    } on DioError catch (e) {
      return AddProductModel.fromJson(e.response!.data!);
    }
  }

  @override
  FutureOr<EditProductModel?> postEditProduk(String name, String detail,
      int price, String stok, File? image, int id) async {
    try {
      var formData = FormData.fromMap({
        'name': name,
        'id_toko': storage.getCurrentStoreId(),
        'price': price,
        'stok': stok,
        'detail': detail,
      });

      if (image != null) {
        formData.files.addAll([
          MapEntry("image", await MultipartFile.fromFile(image.path)),
        ]);
      }

      var response = await network.dio.post('/produk/$id',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return EditProductModel.fromJson(response.data);
    } on DioError catch (e) {
      return EditProductModel.fromJson(e.response!.data!);
    }
  }

  @override
  FutureOr<DeleteProductModel?> deleteProduct(int id) async {
    try {
      var response = await network.dio.delete('/produk/$id',
          options: Options(headers: {
            'Authorization': "Bearer ${storage.getAccessToken()}"
          }));
      return DeleteProductModel.fromJson(response.data);
    } on DioError catch (e) {
      return DeleteProductModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<DeleteProductModel?> deleteGabah(int id) async {
    try {
      var response = await network.dio.delete('/gabah/$id',
          options: Options(headers: {
            'Authorization': "Bearer ${storage.getAccessToken()}"
          }));
      return DeleteProductModel.fromJson(response.data);
    } on DioError catch (e) {
      return DeleteProductModel.fromJson(e.response!.data);
    }
  }

  @override
  FutureOr<AddGabahModel?> postGabah(
      String name, String detail, int price, File? image) async {
    try {
      var formData = FormData.fromMap({
        'name': name,
        'id_pabrik': storage.getCurrentPabrikIdFromUser(),
        'price': price,
        'detail': detail,
      });

      if (image != null) {
        formData.files.addAll([
          MapEntry("image", await MultipartFile.fromFile(image.path)),
        ]);
      }

      var response = await network.dio.post('/gabah',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return AddGabahModel.fromJson(response.data);
    } on DioError catch (e) {
      return AddGabahModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<UserModel?> getUser(int id) async {
    try {
      var response = await network.dio.get('/auth/user/$id');
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      return UserModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<EditGabahModel?> postEditGabah(
      String name, String detail, int price, File? image, int id) async {
    try {
      var formData = FormData.fromMap({
        'name': name,
        'id_pabrik': storage.getCurrentPabrikIdFromUser(),
        'price': price,
        'detail': detail,
      });

      if (image != null) {
        formData.files.addAll([
          MapEntry("image", await MultipartFile.fromFile(image.path)),
        ]);
      }
      var response = await network.dio.post('/gabah/$id}',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return EditGabahModel.fromJson(response.data);
    } on DioError catch (e) {
      return EditGabahModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<EditProfileModel?> postUpdateProfile(
      String name, String email, String phone, File? image) async {
    try {
      var formData = FormData.fromMap({
        'name': name,
        'email': email,
        'phone': phone,
      });

      if (image != null) {
        formData.files.addAll([
          MapEntry("photo_profile", await MultipartFile.fromFile(image.path)),
        ]);
      }

      var response = await network.dio.post('/auth/update',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));

      return EditProfileModel.fromJson(response.data);
    } on DioError catch (e) {
      return EditProfileModel.fromJson(e.response!.data);
    }
  }
  
  @override
  FutureOr<EditTokoModel?> postEditToko(String name, String address, String deskripsi, File? image, int id)async {
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

      var response = await network.dio.post('/toko/$id',
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${storage.getAccessToken()}'
          }));
      return EditTokoModel.fromJson(response.data);
    } on DioError catch (e) {
      return EditTokoModel.fromJson(e.response!.data);
    }
  }
}
