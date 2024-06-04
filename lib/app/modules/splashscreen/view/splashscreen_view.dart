import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/utils/color.dart';
import 'package:tout_charriot/app/utils/constants/image_constants.dart';
import 'package:tout_charriot/app/utils/utils.dart';

import '../controller/splashscreen_controller.dart';


class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashscreenController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: const AssetImage(AppImages.logo),
                  width: AppUtils.kSize(context).width * 0.8),
              const CircularProgressIndicator(
                color: AppColor.yellowPrimary,
              ),
            ],
          )),
    );
  }

}
