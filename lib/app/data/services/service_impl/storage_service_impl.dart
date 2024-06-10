import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:tout_charriot/app/data/models/user_model.dart';
import 'package:tout_charriot/app/data/services/storage_service.dart';

class StorageServicesImpl implements StorageServices {
  static String userBoxName = "UserBoxName";
  static String userKey = "HSI_USER";
  static final userBox = Hive.box(userBoxName);
  static String userCredentialKey = "jwt";
  final String boolKey = 'isActivated';
  @override
  Future<void> setBoolData(bool value) async {
    await userBox.put(boolKey, value);
  }
  @override
  bool? getBoolData() {
    return userBox.get(boolKey);
  }

  @override
  UserModel getUserData() {
    String? userDataJson = userBox.get(userKey);
    if (userDataJson != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
      UserModel savedUser = UserModel.fromJson(userDataMap);
      return savedUser;
    } else {
      throw Exception('No user data found');
    }
  }
  @override
  void setUserData(json) async {
    userBox.put(userKey, json);
  }

  @override
  void disconnectUser() async {
    userBox.delete(userKey);
  }

  @override
  String getToken() => userBox.get(userCredentialKey);

  @override
  void setToken(token) {
    userBox.put(userCredentialKey, token.toString());
  }

  @override
  Future<void> init() async {
    await Hive.openBox(userBoxName);
  }
}
