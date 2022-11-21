import 'dart:async';
import 'dart:io';

import 'package:pusatani/data/model/add_gabah_model.dart';
import 'package:pusatani/data/model/add_pabrik_model.dart';
import 'package:pusatani/data/model/add_product_model.dart';
import 'package:pusatani/data/model/add_toko_model.dart';
import 'package:pusatani/data/model/delete_product_model.dart';
import 'package:pusatani/data/model/detail_pabrik_model.dart';
import 'package:pusatani/data/model/detail_toko_model.dart';
import 'package:pusatani/data/model/edit_product_model.dart';
import 'package:pusatani/data/model/list_article_model.dart';
import 'package:pusatani/data/model/login_model.dart';
import 'package:pusatani/data/model/logout_model.dart';
import 'package:pusatani/data/model/pabrik_model.dart';
import 'package:pusatani/data/model/register_model.dart';
import 'package:pusatani/data/model/toko_model.dart';
import 'package:pusatani/data/model/user_model.dart';

abstract class Repository {
  FutureOr<LoginModel?> postLogin(String email, String password);
  FutureOr<TokoModel?> getToko();
  FutureOr<DetailTokoModel?> getDetailToko(int id);
  FutureOr<PabrikModel> getPabrik();
  FutureOr<RegisterModel> postRegister(File? profilePicture, String email,
      String name, int role, File? idPicture, String phone, String password);
  FutureOr<ListArticleModel?> getListArticle();
  FutureOr<DetailPabrikModel> getDetailPabrik(int id);
  FutureOr<AddTokoModel?> postToko(
      String name, String address, String deskripsi, File? image);
  FutureOr<AddPabrikModel?> postPabrik(
      String name, String address, String deskripsi, File? image);
  FutureOr<LogoutModel?> getLogout();
  FutureOr<AddProductModel?> postProduk(
      String name, String detail, int price, String stok, File? image);
  FutureOr<EditProductModel?> postEditProduk(
      String name, String detail, int price, String stok, File? image, int id);
  FutureOr<DeleteProductModel?> deleteProduct(int id);
  FutureOr<DeleteProductModel?> deleteGabah(int id);
  FutureOr<AddGabahModel?> postGabah(
      String name, String detail, int price, File? image);
  FutureOr<UserModel?> getUser(int id);
}
