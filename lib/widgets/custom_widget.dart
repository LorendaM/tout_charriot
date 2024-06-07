import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tout_charriot/app/intl/texts.dart';

import '../app/utils/color.dart';
import '../app/utils/constants/image_constants.dart';
import '../app/utils/constants/size_constants.dart';
import '../app/utils/request_utils.dart';
import '../app/utils/text_theme.dart';
import '../app/utils/utils.dart';

class CustomCategory extends StatelessWidget {
  final String text;
  final String image;
  const CustomCategory({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.secondSmalPadding),
      decoration: const BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.secondSmalPadding)),
      ),
      height: AppSizes.semiLargePadding,
      child: Row(
        children: [
          Image(image: AssetImage(image)),
          const SizedBox(width: AppSizes.doublespacePadding,),
          Text("${frLanguage[text]}", style: AppTextStyle.text(),)
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String dateRace;
  final String numRace;
  final String lieuDepart;
  final String lieuArrive;
  final String? montantRace;
  final StatusRace? statusRace;
  const CustomCard({super.key, required this.dateRace, required this.numRace, required this.lieuDepart, required this.lieuArrive, this.montantRace, this.statusRace});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding, horizontal: AppSizes.secondSmalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.minPrimary, horizontal: AppSizes.minSecondary),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateRace, style: AppTextStyle.textSmallBold(),),
                Text('${frLanguage['order']}: $numRace', style: AppTextStyle.textSmallBold(),)
              ],
            ),
          ),
          buildcardRace(size)
        ],
      ),
    );
  }

  buildcardRace(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding),
      padding: const EdgeInsets.all(AppSizes.minSecondary),
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(AppSizes.minSecondary),
        border: Border.all(
          color: AppColor.blackColor,
          width: 0.3
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.spacePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.mindefaultPadding, horizontal: AppSizes.minPrimary),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildCircle(AppColor.yellowPrimary, 15),
                      Container(
                        height: 46,
                        width: 1,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColor.yellowPrimary,
                              AppColor.inputFilledColor
                            ]
                          ),
                        ),
                      ),
                      buildCircle(AppColor.thirdGrey, 15),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppSizes.minSecondary),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${frLanguage['de']}",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textSmall(size: 11),
                      ),
                      const SizedBox(height: AppSizes.minSecondary,),
                      Text(lieuDepart,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textSmallBold(size: 11),
                      ),
                      buildDivider(size.width / 2),
                      Text("${frLanguage['to']}",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textSmall(size: 11),
                      ),
                      const SizedBox(height: AppSizes.minSecondary,),
                      Text(lieuArrive,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textSmallBold(size: 11),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.secondSmalPadding, horizontal: AppSizes.secondDoublePadding),
            child: mySeperator(1, AppColor.thirdGrey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: statusRace == StatusRace.watting 
                      ? AppColor.gris
                      : statusRace == StatusRace.progess
                        ? AppColor.blueColor
                        : AppColor.greenColor,
                    borderRadius: const BorderRadius.all(Radius.circular(AppSizes.secondSmalPadding)),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.minPrimary, horizontal: AppSizes.secondSmalPadding),
                  child: Text(
                    statusRace == StatusRace.watting 
                      ? "${frLanguage['cargo']}"
                      : statusRace == StatusRace.progess
                        ? "${frLanguage['inProgress']}"
                        : "${frLanguage['accomplish']}",
                    style: AppTextStyle.textSmall(
                      color: statusRace == StatusRace.watting 
                      ? AppColor.secondBlack
                      : AppColor.whiteColor
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.minPrimary),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${frLanguage['kilometre']}', style: AppTextStyle.textSmall(size: 11, color: AppColor.secondGris),),
                      const SizedBox(height: AppSizes.minSecondary,),
                      Text("$montantRace ${frLanguage['devise']}", style: AppTextStyle.textSmallBold(size: 11),)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}
buildDivider(double size) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: AppSizes.smallPadding),
    height: 1,
    width: size,
    color: AppColor.thirdGrey,
  );
}

buildCircle(Color boxColor, double taille) {
  return Container(
    width: taille,
    height: taille,
    decoration: BoxDecoration(
      color: boxColor,
      shape: BoxShape.circle
    ),
    padding: const EdgeInsets.all(6),
  );
}

buildImgCtn(Color boxColor, double taille, double radius, String img) {
  return Container(
    width: taille,
    height: taille,
    decoration: BoxDecoration(
      color: boxColor,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    ),
    padding: const EdgeInsets.all(AppSizes.spacePadding),
    child: Image(image: AssetImage(img)),
  );
}

buildBottomNavItem(String icon) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    width: AppSizes.bottomNavWith,
    height: AppSizes.bottomNavHeight,
    decoration: const BoxDecoration(
      color: AppColor.yellowPrimary,
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.bottomNavRadius)),
    ),
    child: Image(image: AssetImage(icon))
  );
}

builCircleBoard(Color fondColor, Color borderColor) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: fondColor,
      //shape: BoxShape.circle,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        width: 2,
        color: borderColor,
        style: BorderStyle.solid
      )
    ),
    padding: const EdgeInsets.all(6),
  );
}

mySeperator(double height, Color color) {
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();
      const dashWidth = 10.0;
      final dashHeight = height;
      final dashCount = (boxWidth / (2 * dashWidth)).floor();
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: List.generate(dashCount, (_) {
          return SizedBox(
            width: dashWidth,
            height: dashHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          );
        }),
      );
    }
  );
}

// app bar transparent avec un boutton de retour en cercle
circleBackAppBar() {
  return AppBar(
    leading: InkWell(
      onTap: () {
        navPrevious();
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: AppColor.yellowPrimary,
        ),
      ),
    ),
    backgroundColor: AppColor.transparentColor,
    elevation: 0,
  );
}

// container de definition de trajet
travelContainer({Widget? children}) {
  return Container(
    decoration: const BoxDecoration(
      color: AppColor.fourGris,
      borderRadius: BorderRadius.all(Radius.circular(AppSizes.fourPadding)),
    ),
    padding: const EdgeInsets.fromLTRB(AppSizes.thirdDoublePadding, AppSizes.thirdPadding, AppSizes.nextsmallPadding, AppSizes.thirdPadding),
    child: children
  );
}

// row de selection de lieu de trajet
choosePalce({required String adresse, void Function()? onTap, bool isDepart = false, String? lieu}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(lieu ?? "${frLanguage[adresse]}", style: AppTextStyle.textSmall(size: 12, color: AppColor.secondGris),),
      SizedBox(width: isDepart ? 46 : 21,),
      GestureDetector(
        onTap: onTap,
        child: buildImgCtn(AppColor.thirdGrey, AppSizes.fortyPadding, AppSizes.secondSmalPadding, AppImages.pencil),
      )
    ],
  );
}

// row de type de vehicule et de prix
estimatePrice({required Map<String, dynamic> arguments}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: AssetImage(arguments['imageEngins']), width: AppSizes.largePadding, height: AppSizes.largePadding,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${frLanguage['carType']}", style: AppTextStyle.textSmall(size: 12),),
              Text(arguments['typeEngins'], style: AppTextStyle.textBold(size: 12),)
            ],
          ),
        ],
      ),
      Text("${arguments['mtnStart']} - ${arguments['mtnEnd']} ${frLanguage['devise']}", style: AppTextStyle.textBold(color: AppColor.greenColor, size: 13),)
    ],
  );
}

// ligne de lieu de départ et d'arrivé avec le cercle et la ligne en pointillé
departArriveLine() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildCircle(AppColor.yellowPrimary, AppSizes.fourPadding),
      const VerticalDottedLine(
        height: 46,
        color: AppColor.blackColor,
        width: 3.0,
        dotSpacing: 15.0,
        dotSize: 63.0,
      ),
      buildCircle(AppColor.blackColor, AppSizes.fourPadding),
    ],
  );
}

// widget de ligne vertical en pointillé
class VerticalDottedLine extends StatelessWidget {
  final double height;
  final Color color;
  final double width;
  final double dotSpacing;
  final double dotSize;

  const VerticalDottedLine({super.key, 
    required this.height,
    required this.color,
    required this.width,
    required this.dotSpacing,
    required this.dotSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.smallPadding),
      child: SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: DottedLinePainter(
            color: color,
            width: width,
            dotSpacing: dotSpacing,
            dotSize: dotSize,
          ),
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;
  final double width;
  final double dotSpacing;
  final double dotSize;

  DottedLinePainter({
    required this.color,
    required this.width,
    required this.dotSpacing,
    required this.dotSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawPoints(
        PointMode.points,
        [
          Offset(0, startY),
        ],
        paint,
      );
      startY += dotSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}