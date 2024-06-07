import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/data/models/login_model.dart';
import 'package:tout_charriot/app/data/services/authentification_service.dart';

import '../../../../data/models/user_model.dart';
import '../../../../data/services/service_impl/authentification_service_impl.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/request_utils.dart';
import '../../../../utils/utils.dart';

class LoginController extends GetxController {
  var phoneController = TextEditingController().obs;
  var pwdController = TextEditingController().obs;
  late AuthentificationService _authentificationService;

  @override
  void onInit() {
    _authentificationService = AuthentificationServiceImpl();
    // TODO: implement onInit
    super.onInit();
  }

  void userLogin(BuildContext context) async {
    Map<String, dynamic> login = {
      'credential': phoneController.value.text,
      'password': pwdController.value.text
    };
    try {
      AckResponse<UserModel?> loginResponse =
          await _authentificationService.loginUser(jsonEncode(login));
      if (loginResponse.success == false) {
        Map<String, dynamic> message = jsonDecode(loginResponse.message!);
        // ignore: use_build_context_synchronously
        showToast(context, message['message']);
      } else {
        Map<String, dynamic> message = jsonDecode(loginResponse.message!);
      // ignore: use_build_context_synchronously
      showToast(context, message['message']);
        Get.back();
        Get.toNamed(
          Routes.dashboard,
        );
      }
    } catch (e) {
      Get.back();
    }
  }
}
