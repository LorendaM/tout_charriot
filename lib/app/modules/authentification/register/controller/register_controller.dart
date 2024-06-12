import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/data/services/service_impl/authentification_service_impl.dart';
import 'package:tout_charriot/app/utils/utils.dart';
import '../../../../data/services/authentification_service.dart';
import '../../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  var phoneController = TextEditingController().obs;
  var pwdController = TextEditingController().obs;
  var confirmPwdController = TextEditingController().obs;
  var lastNameController = TextEditingController().obs;
  var firstNameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  late AuthentificationService _authenticationService;
  RxBool isPasswordVisible = false.obs;
  RxBool isPasswordConfVisible = false.obs;

  @override
  void onInit() {
    _authenticationService=AuthentificationServiceImpl();
    // TODO: implement onInit
    super.onInit();
  }
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void togglePasswordConfVisibility() {
    isPasswordConfVisible.value = !isPasswordConfVisible.value;
  }

  Future<void> userRegister(BuildContext context) async {
    final Map<String, dynamic> register = {
      'username': '${lastNameController.value.text} ${firstNameController.value.text}',
      'phone': phoneController.value.text,
      'password': confirmPwdController.value.text,
      'email': emailController.value.text,
      'provider': 'ewp',
    };

    try {
      String message = await _authenticationService.registerUser(jsonEncode(register));
      // ignore: use_build_context_synchronously
      showToast(context, message);
      navPrevious();
      Get.offNamed(Routes.login);
    } catch (e) {
      // ignore: use_build_context_synchronously
      showToast(context, e.toString());
      navPrevious();
    }
  }

}
