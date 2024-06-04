import 'package:flutter/material.dart';

import '../app/utils/color.dart';
import '../app/utils/constants/size_constants.dart';
import '../app/utils/text_theme.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.enable = true,
    this.image,
    this.hint,
    this.isPassWord = false,
    this.secure = false,
    this.toggle,
    this.keyboardType = TextInputType.text,
    this.lowerMargin = false,
    this.controller,
  });
  final String? hint;
  final bool? enable;
  final String? image;
  final TextInputType? keyboardType;
  final bool? isPassWord;
  final bool? secure;
  final Function()? toggle;
  final bool? lowerMargin;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding),
      height: 64,
      decoration: BoxDecoration(
        color: AppColor.inputFilledColor,
        borderRadius: BorderRadius.circular(AppSizes.secondSmalPadding),
      ),
      child: Center(
        child: TextField(
          enabled: enable,
          controller: controller,
          obscureText: secure ?? false,
          keyboardType: keyboardType,
          cursorColor: AppColor.blackColor,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 13, 10, 12),
            icon: image != null ? Image(image: AssetImage(image!)) : const SizedBox(),
            hintText: hint,
            hintStyle: AppTextStyle.text(color: AppColor.blackColor),
            suffixIcon: isPassWord ?? false
                ? GestureDetector(
                    onTap: toggle,
                    child: Icon(
                      secure!
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.black,
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
