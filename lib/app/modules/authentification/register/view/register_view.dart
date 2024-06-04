import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/intl/texts.dart';
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
              const Padding(
                padding: EdgeInsets.only(top: 34),
                child: Icon(Icons.close_outlined, size: AppSizes.secondDefPadding),
              ),
              const SizedBox(height: AppSizes.largePadding),
              Text("${frLanguage['registeredToApp']}",
                style: AppTextStyle.title(),
              ),
              const SizedBox(height: AppSizes.secondDefPadding),
              CustomInput(
                image: AppImages.phone,
                hint: "${frLanguage['name']}",
              ),
              const SizedBox(height: AppSizes.spacePadding),
              CustomInput(
                image: AppImages.phone,
                hint: "${frLanguage['prenom']}",
              ),
              const SizedBox(height: AppSizes.spacePadding),
              CustomInput(
                image: AppImages.phone,
                hint: "${frLanguage['numTel']}",
              ),
              const SizedBox(height: AppSizes.spacePadding),
              CustomInput(
                image: AppImages.lock,
                hint: "${frLanguage['password']}",
              ),
              const SizedBox(height: AppSizes.spacePadding,),
              CustomInput(
                image: AppImages.phone,
                hint: "${frLanguage['confirmPwd']}",
              ),
              const SizedBox(height: AppSizes.thirdPadding),
              CustomMultiTextButton(
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text: "${frLanguage['acceptTerme']}", style: AppTextStyle.textSmall()),
                          const TextSpan(text: " "),
                          TextSpan(
                              text: "${frLanguage['termeOfUse']}",
                              style: AppTextStyle.textSmall(color: AppColor.yellowPrimary, isunderline: true),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () { launchTheUrl(NetworkConstants.appTerme);}
                          ),
                          const TextSpan(text: " "),
                          TextSpan(text: "${frLanguage['andOur']}", style: AppTextStyle.textSmall()),
                          const TextSpan(text: " "),
                          TextSpan(
                              text: "${frLanguage['privacyPolicy']}",
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
                press: () {},
                text: "${frLanguage['register']}",
                style: AppTextStyle.textBold(),
              ),
              CustomTextButton(
                text: "${frLanguage['notHaveAccount']}",
                press: () {},
                style: AppTextStyle.textBold(color: AppColor.blackColor),
              ),
              CustomTextButton(
                text: "${frLanguage['loginYou']}",
                press: () {
                  //kPushNamed(context: context, path: '/login');
                  Get.toNamed('/login');
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