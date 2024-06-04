import 'package:hive_flutter/hive_flutter.dart';
import 'package:tout_charriot/app/data/models/user_model.dart';
import 'package:tout_charriot/app/data/services/storage_service.dart';

class StorageServicesImpl implements StorageServices {
  static String userBoxName = "UserBoxName";
  static String userKey = "HSI_USER";
  static final userBox = Hive.box(userBoxName);
  static String userCredentialKey = "jwt";

  @override
  UserModel getUserData() {
    Map userData = userBox.get(userKey);
    UserModel savedUser = UserModel.fromJson(userData);
    return savedUser;
  }

  @override
  void setUserData(json) async {
    userBox.put(userKey, json);
  }

  @override
  bool userExists() => userBox.containsKey(userKey);

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
