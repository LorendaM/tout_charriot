import 'package:flutter/material.dart';

import '../app/utils/color.dart';
import '../app/utils/constants/size_constants.dart';
import '../app/utils/text_theme.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    this.enable = true,
    this.prefixIcon,
    this.suffixIcon,
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
  final TextInputType? keyboardType;
  final bool? isPassWord;
  final bool? secure;
  final Widget? prefixIcon;
  final IconButton? suffixIcon;
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
          textCapitalization: TextCapitalization.words,
          enabled: enable,
          controller: controller,
          obscureText: secure!,
          keyboardType: keyboardType,
          cursorColor: AppColor.blackColor,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 13, 10, 12),
            icon: prefixIcon ?? const SizedBox(),
            hintText: hint,
            border: InputBorder.none,
            hintStyle: AppTextStyle.text(color: AppColor.blackColor),
            suffixIcon: isPassWord!
                ? GestureDetector(
              onTap: toggle,
                  child: Icon(
                    secure!
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  color: Colors.black,),
                )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
