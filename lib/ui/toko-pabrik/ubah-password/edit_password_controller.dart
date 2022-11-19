import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/storage_core.dart';

class EditPasswordController extends BaseController{
      var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
  int role = 1;
  RxBool isObscured = true.obs;
  var formKey = GlobalKey<FormState>();
  var value = 1;
  File? profilePicture;
  File? idPicture;
  var storage = StorageCore();
}