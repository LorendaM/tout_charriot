import 'package:tout_charriot/app/data/models/user_model.dart';

class LoginModel {
  final String? credential;
  final String? password;
  final UserModel? userModel;

  LoginModel({
    this.credential,
    this.password,
    this.userModel
  });

  Map<String, dynamic> toJson() {
    return {
      'credential': credential,
      'password': password,
    };
  }

  factory LoginModel.fromJson(json) {
    return LoginModel(
      credential: json['credential'],
      password: json['password'],
      userModel: json['data'],
    );
  }
}
