import 'package:tout_charriot/app/data/models/user_model.dart';

abstract class StorageServices {
  void setUserData(json);
  UserModel getUserData();
  bool userExists();
  void disconnectUser();
  void setToken(token);
  String getToken();
  Future<void> init();
}