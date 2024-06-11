import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/modules/authentification/register/controller/register_controller.dart';
import 'package:tout_charriot/app/utils/color.dart';
import 'package:tout_charriot/app/utils/constants/image_constants.dart';
import 'package:tout_charriot/app/utils/constants/size_constants.dart';
import 'package:tout_charriot/app/utils/text_theme.dart';
import 'package:tout_charriot/app/utils/utils.dart';
import 'package:tout_charriot/widgets/custom_button.dart';
import 'package:tout_charriot/widgets/custom_input.dart';

import '../../../../utils/constants/network_constants.dart';


class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.doublespacePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 34),
                child: IconButton(
                  icon: const Icon(
                      Icons.close_outlined,
                      size: AppSizes.secondDefPadding
                  ),
                  onPressed: () {
                    Get.toNamed('/login');
                  },

                  ),
              ),
              const SizedBox(height: AppSizes.largePadding),
              Text('registeredToApp'.tr,
                style: AppTextStyle.title(),
              ),
              const SizedBox(height: AppSizes.secondDefPadding),
              CustomInput(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    AppImages.user,
                    width: 40,
                  ),
                ),
                keyboardType: TextInputType.text,
                hint: 'last_name'.tr,
                controller: controller.lastNameController.value,
              ),
              const SizedBox(height: AppSizes.spacePadding),
              CustomInput(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    AppImages.user,
                    width: 40,
                  ),
                ),
                keyboardType: TextInputType.text,
                hint: 'first_name'.tr,
                controller: controller.firstNameController.value,
              ),
              const SizedBox(height: AppSizes.spacePadding),
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
              const SizedBox(height: AppSizes.spacePadding),
              CustomInput(
                prefixIcon: const Icon(
                  Icons.email_rounded,
                  size: 50,
                ),
                keyboardType: TextInputType.emailAddress,
                hint: 'email'.tr,
                controller: controller.emailController.value,
              ),
              const SizedBox(height: AppSizes.spacePadding),
              CustomInput(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    AppImages.lock,
                    width: 40,
                  ),
                ),
                keyboardType: TextInputType.visiblePassword,
                isPassWord: true,
                secure: controller.isPasswordVisible.value,
                toggle: (){},
                hint: 'password'.tr,
                controller: controller.pwdController.value,
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
                isPassWord: true,
                secure: controller.isPasswordVisible.value,
                toggle: () {
                  controller.togglePasswordVisibility();
                },
                  hint: 'confirmPwd'.tr,
                  controller: controller.confirmPwdController.value,
                ),
              const SizedBox(height: AppSizes.thirdPadding),
              CustomMultiTextButton(
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: 'acceptTerm'.tr, style: AppTextStyle.textSmall()),
                          const TextSpan(text: " "),
                          TextSpan(
                              text: 'termOfUse'.tr,
                              style: AppTextStyle.textSmall(color: AppColor.yellowPrimary, isunderline: true),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () { launchTheUrl(NetworkConstants.appTerme);}
                          ),
                          const TextSpan(text: " "),
                          TextSpan(text: 'andOur'.tr, style: AppTextStyle.textSmall()),
                          const TextSpan(text: " "),
                          TextSpan(
                              text: 'privacyPolicy'.tr,
                              style: AppTextStyle.textSmall(color: AppColor.yellowPrimary, isunderline: true),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () { launchTheUrl(NetworkConstants.appPolicy);}
                          )
                        ]
                    )
                ),
              ),
              const SizedBox(height: AppSizes.semiLargePadding),
              CustomButton(
                press: () {
                  controller.userRegister(context);
                },
                text: 'register'.tr,
                style: AppTextStyle.textBold(),
              ),
              Center(
                child: Text(
                  'notHaveAccount'.tr,
                  style: AppTextStyle.text(color: AppColor.blackColor),
                ),
              ),
              CustomTextButton(
                text: 'loginYou'.tr,
                press: () {
                  Get.toNamed('/login');
                },
                style: AppTextStyle.text(color: AppColor.yellowPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}