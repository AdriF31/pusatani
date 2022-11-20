import 'package:flutter/material.dart';

import 'package:localstorage/localstorage.dart';

import 'model/login_model.dart';

class StorageCore {
  final storage = LocalStorage('local_data.json');

  Future<bool> ensureStorageReady() async {
    return await storage.ready;
  }

  Future<LoginModel?> getLoginState() async {
    try {
      bool isStorageReady = await storage.ready;
      debugPrint('storage ready? $isStorageReady');
      if (isStorageReady) {
        Map<String, dynamic> data = storage.getItem('auth_result');
        LoginModel auth = LoginModel.fromJson(data);
        debugPrint('Already login');
        return auth;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('error get login state: $e');
      return null;
    }
  }

  Future saveAuthResponse(LoginModel? loginModel) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.setItem('auth_result', loginModel?.toJson());
      }
    } catch (e) {
      debugPrint('error save login state: $e');
    }
  }

  Future deleteAuthResponse() async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.deleteItem('auth_result');
      }
    } catch (e) {
      debugPrint('error save login state: $e');
    }
  }

  String? getAccessToken() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      return auth.data?.token;
    } catch (e) {
      debugPrint("Error while load access token: $e");
      return 'token_not_loaded';
    }
  }

  int? getCurrentUserId() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      return auth.data?.user?.id;
    } catch (e) {
      debugPrint("Error while load user_id: $e");
      return null;
    }
  }

  int? getCurrentStoreId() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      return auth.data?.idToko;
    } catch (e) {
      debugPrint("Error while load user_id: $e");
      return null;
    }
  }
    int? getCurrentPabrikId() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      return auth.data?.idPabrik;
    } catch (e) {
      debugPrint("Error while load user_id: $e");
      return null;
    }
  }

  String? getCurrentEmail() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      debugPrint(auth.data?.user?.name);
      debugPrint(auth.data?.token);
      return auth.data?.user?.email;
    } catch (e) {
      debugPrint("Error while load user_name: $e");
      return 'user_name_not_loaded';
    }
  }

  String? getCurrentUsername() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      debugPrint(auth.data?.user?.name);
      debugPrint(auth.data?.token);
      return auth.data?.user?.name;
    } catch (e) {
      debugPrint("Error while load user_name: $e");
      return 'user_name_not_loaded';
    }
  }

  String? getCurrentProfilePicture() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      debugPrint(auth.data?.user?.name);
      debugPrint(auth.data?.token);
      return auth.data?.user?.userDetails?.photoProfile;
    } catch (e) {
      debugPrint("Error while load user_name: $e");
      return 'user_name_not_loaded';
    }
  }

  int? getCurrentRole() {
    try {
      Map<String, dynamic> data = storage.getItem('auth_result');
      LoginModel auth = LoginModel.fromJson(data);
      return auth.data!.user!.roles!.first.id;
    } catch (e) {
      return null;
    }
  }

  Future saveObject(dynamic object, String key) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.setItem(key, object);
      }
    } catch (e) {
      debugPrint('error save$key : $e');
      rethrow;
    }
  }

  Future removeObject(String key) async {
    try {
      bool isStorageReady = await storage.ready;
      if (isStorageReady) {
        await storage.deleteItem(key);
      }
    } catch (e) {
      debugPrint('error removing$key : $e');
      rethrow;
    }
  }
}
