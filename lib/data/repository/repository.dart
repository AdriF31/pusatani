import 'dart:async';
import 'dart:io';

import 'package:pusatani/data/model/login_model.dart';
import 'package:pusatani/data/model/pabrik_model.dart';
import 'package:pusatani/data/model/register_model.dart';
import 'package:pusatani/data/model/toko_model.dart';

abstract class Repository {
  FutureOr<LoginModel?> postLogin(String email, String password);
  FutureOr<TokoModel?> getToko();
  FutureOr<PabrikModel> getPabrik();
  FutureOr<RegisterModel> postRegister(File? profilePicture, String email,
      String name, int role, File? idPicture, String phone, String password);
}