import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/data/services/authentification_service.dart';

import '../../../../data/services/service_impl/authentification_service_impl.dart';
import '../../../../data/services/service_impl/storage_service_impl.dart';
import '../../../../routes/app_pages.dart';
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
      String message = await _authentificationService.loginUser(jsonEncode(login));
      bool isLogin = true;
      StorageServicesImpl().setBoolData(isLogin);
      // ignore: use_build_context_synchronously
      showToast(context, message);
        Get.toNamed(
          Routes.dashboard,
        );
    } catch (e) {
      // ignore: use_build_context_synchronously
      showToast(context, e);
    }
    }
}
