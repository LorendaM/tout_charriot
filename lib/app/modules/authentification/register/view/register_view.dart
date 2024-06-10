import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              Text("${frLanguage['registeredToApp']}",
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
                hint: "${frLanguage['name']}",
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
                hint: "${frLanguage['prenom']}",
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
                hint: "${frLanguage['numTel']}",
                controller: controller.phoneController.value,
              ),
              const SizedBox(height: AppSizes.spacePadding),
              CustomInput(
                prefixIcon: const Icon(
                  Icons.email_rounded,
                  size: 50,
                ),
                keyboardType: TextInputType.emailAddress,
                hint: "Email",
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
                hint: "${frLanguage['password']}",
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
                  hint: "${frLanguage['confirmPwd']}",
                  controller: controller.confirmPwdController.value,
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
                press: () {
                  controller.userRegister(context);
                },
                text: "${frLanguage['register']}",
                style: AppTextStyle.textBold(),
              ),
              CustomTextButton(
                text: "${frLanguage['notHaveAccount']}",
                press: () {},
                style: AppTextStyle.text(color: AppColor.blackColor),
              ),
              CustomTextButton(
                text: "${frLanguage['loginYou']}",
                press: () {
                  //kPushNamed(context: context, path: '/login');
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