import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/modules/authentification/login/controller/login_controller.dart';
import 'package:tout_charriot/app/utils/color.dart';
import 'package:tout_charriot/app/utils/constants/size_constants.dart';
import 'package:tout_charriot/app/utils/text_theme.dart';
import 'package:tout_charriot/app/utils/utils.dart';
import 'package:tout_charriot/widgets/custom_button.dart';
import 'package:tout_charriot/widgets/custom_input.dart';

import '../../../../utils/constants/image_constants.dart';


class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.doublespacePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSizes.largePadding,),
              Text('connectToApp'.tr,
                style: AppTextStyle.title(),
              ),
              const SizedBox(height: AppSizes.secondDefPadding,),
              CustomInput(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    AppImages.phone,
                    width: 40,
                  ),
                ),
                keyboardType: TextInputType.number,
                hint: 'numTel'.tr,
                controller: controller.phoneController.value,
              ),
              const SizedBox(height: AppSizes.spacePadding,),
              CustomInput(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    AppImages.lock,
                    width: 40,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                hint: 'password'.tr,
                controller: controller.pwdController.value,
              ),
              CustomMultiTextButton(
                text: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: 'forgetPwd'.tr, style: AppTextStyle.textSmall()),
                          const TextSpan(text: " "),
                          TextSpan(text: 'recoverAccount'.tr, style: AppTextStyle.textSmall(color: AppColor.yellowPrimary))
                        ]
                    )
                ),
                press: () {},
              ),
              const SizedBox(height: AppSizes.semiLargePadding,),
              CustomButton(
                press: () {
                  showLoading(context);
                  controller.userLogin(context);
                },
                text: 'login'.tr,
                style: AppTextStyle.textBold(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding,),
                  child: Text('alreadyRegistered'.tr,
                    style: AppTextStyle.text(color: AppColor.blackColor),
                  ),
                ),
              ),
              CustomTextButton(
                text: 'registerYou'.tr,
                press: () {
                  Get.toNamed( '/register');
                },
                style: AppTextStyle.text(color: AppColor.yellowPrimary),
              )
            ],
          ),
        ),
      ),
    );
  }
}