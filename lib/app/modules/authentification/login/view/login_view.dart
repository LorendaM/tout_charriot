import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/intl/texts.dart';
import 'package:tout_charriot/app/modules/authentification/login/controller/login_controller.dart';
import 'package:tout_charriot/app/utils/color.dart';
import 'package:tout_charriot/app/utils/constants/image_constants.dart';
import 'package:tout_charriot/app/utils/constants/size_constants.dart';
import 'package:tout_charriot/app/utils/text_theme.dart';
import 'package:tout_charriot/app/utils/utils.dart';
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
              const Padding(
                padding: EdgeInsets.only(top: 34),
                child: Icon(Icons.close_outlined, size: AppSizes.secondDefPadding,),
              ),
              const SizedBox(height: AppSizes.largePadding,),
              Text("${frLanguage['connectToApp']}",
                style: AppTextStyle.title(),
              ),
              const SizedBox(height: AppSizes.secondDefPadding,),
              CustomInput(
                image: AppImages.phone,
                hint: "${frLanguage['numTel']}",
              ),
              const SizedBox(height: AppSizes.spacePadding,),
              CustomInput(
                image: AppImages.lock,
                hint: "${frLanguage['password']}",
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
                press: () {
                  //nav to pwd recover
                },
              ),
              const SizedBox(height: AppSizes.semiLargePadding,),
              CustomButton(
                press: () {
                  showLoading(context);
                  //traitement
                  //navPrevious(context, mounted);
                  //kPushNamed(path: '/accueil', context: context);
                  Get.toNamed('/dashboard');
                },
                text: "${frLanguage['login']}",
                style: AppTextStyle.textBold(),
              ),
              CustomTextButton(
                text: "${frLanguage['alreadyRegistered']}",
                press: () {},
                style: AppTextStyle.textBold(color: AppColor.blackColor),
              ),
              CustomTextButton(
                text: "${frLanguage['registerYou']}",
                press: () {
                  //kPushNamed(context: context, path: '/register');
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