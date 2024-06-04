import 'package:flutter/material.dart';
import 'package:tout_charriot/app/utils/utils.dart';

import '../app/utils/color.dart';
import '../app/utils/constants/size_constants.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function()? press;
  final Color? color, textColor;
  final TextStyle? style;
  const CustomButton({
    super.key,
    this.text,
    @required this.press,
    this.color,
    this.textColor,
    required this.style
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding),
      width: double.infinity,
      child: MaterialButton(
        color: color ?? AppColor.yellowPrimary,
        onPressed: press,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        minWidth: double.infinity,
        height: AppUtils.kSize(context).height * 0.068,
        child: Text(
          text!,
          style: style,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final TextStyle? style;
  const CustomTextButton({
    super.key,
    required this.text,
    @required this.press,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding),
      width: double.infinity,
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
          backgroundColor: AppColor.transparent,
          overlayColor: AppColor.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Text(text,
          style: style,
        ),
      ),
    );
  }
}

class CustomMultiTextButton extends StatelessWidget {
  final Widget? text;
  final Function()? press;
  final Color? color, textColor;
  final Widget? child;
  const CustomMultiTextButton({
    super.key,
    this.text,
    this.press,
    this.color,
    this.textColor,
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: child ?? TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
          backgroundColor: AppColor.transparent,
          overlayColor: AppColor.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: text!,
      ),
    );
  }
}
