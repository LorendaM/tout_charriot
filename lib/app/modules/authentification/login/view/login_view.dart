import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/intl/texts.dart';
import 'package:tout_charriot/app/modules/authentification/login/controller/login_controller.dart';
import 'package:tout_charriot/app/utils/color.dart';
import 'package:tout_charriot/app/utils/constants/size_constants.dart';
import 'package:tout_charriot/app/utils/text_theme.dart';
import 'package:tout_charriot/widgets/custom_button.dart';
import 'package:tout_charriot/widgets/custom_input.dart';


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
              Text("${frLanguage['connectToApp']}",
                style: AppTextStyle.title(),
              ),
              const SizedBox(height: AppSizes.secondDefPadding,),
              CustomInput(
                prefixIcon: const Icon(
                  Icons.phone,
                  size: 50,
                ),
                hint: "${frLanguage['numTel']}",
                controller: controller.phoneController.value,
              ),
              const SizedBox(height: AppSizes.spacePadding,),
              CustomInput(
                prefixIcon: const Icon(
                  Icons.lock,
                  size: 50,
                ),
                hint: "${frLanguage['password']}",
                controller: controller.pwdController.value,
              ),
              CustomMultiTextButton(
                text: Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: "${frLanguage['forgetPwd']}", style: AppTextStyle.textSmall()),
                          const TextSpan(text: " "),
                          TextSpan(text: "${frLanguage['recoverAccount']}", style: AppTextStyle.textSmall(color: AppColor.yellowPrimary))
                        ]
                    )
                ),
                press: () {},
              ),
              const SizedBox(height: AppSizes.semiLargePadding,),
              CustomButton(
                press: () {
                  controller.userLogin(context);
                },
                text: "${frLanguage['login']}",
                style: AppTextStyle.textBold(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding,),
                  child: Text("${frLanguage['alreadyRegistered']}",
                    style: AppTextStyle.text(color: AppColor.blackColor),
                  ),
                ),
              ),
              CustomTextButton(
                text: "${frLanguage['registerYou']}",
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