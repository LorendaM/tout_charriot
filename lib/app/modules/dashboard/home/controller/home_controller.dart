import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/data/services/service_impl/user_info_service_impl.dart';
import 'package:tout_charriot/app/data/services/user_info_service.dart';

import '../../../../data/models/user_model.dart';
import '../../../../utils/request_utils.dart';

class HomeController extends GetxController {
  late UserInfoService _userInfoService;
  late final Rx<UserModel?> user = Rx<UserModel?>(null);
  String username = '';
  String photo = '';

  @override
  void onInit() {
    _userInfoService=UserInfoServiceImpl();
    fetchUserData();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> fetchUserData() async {
    try{
    AckResponse<UserModel?> userDataResponse =
    await _userInfoService.userInfo();

    if (userDataResponse.success == false) {
      Map<String, dynamic> message = jsonDecode(userDataResponse.message!);

      String? msg = message['message'];
    } else {
      user.value = userDataResponse.data!;
      username = user.value!.username!;
      photo = user.value!.photo!;
    }
  } catch (e) {
      Text(e.toString());
    }
  }

}
