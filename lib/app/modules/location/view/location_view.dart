import 'package:flutter/material.dart';
import 'package:tout_charriot/app/utils/color.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_widget.dart';
import '../../../intl/texts.dart';
import '../../../utils/constants/image_constants.dart';
import '../../../utils/constants/size_constants.dart';
import '../../../utils/text_theme.dart';
import '../controller/location_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: circleBackAppBar(),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController googleMapController) {
              controller.mapController.complete(googleMapController);
            },
            initialCameraPosition: CameraPosition(
              target: controller.center,
              zoom: 11.0,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0, right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.doublespacePadding),
                //padding: const EdgeInsets.symmetric(horizontal: AppSizes.doublespacePadding, vertical: AppSizes.twentyTwoPadding),
                decoration: const BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppSizes.fourPadding), topRight: Radius.circular(AppSizes.fourPadding)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: AppSizes.ninePadding, bottom: AppSizes.twentyTwoPadding),
                        width: 37,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: AppColor.gris,
                          borderRadius: BorderRadius.all(Radius.circular(AppSizes.fourPadding)),
                        ),
                      ),
                    ),
                    Text("${frLanguage['defineTravel']}", style: AppTextStyle.secondTitle(fontWeight: FontWeight.w900),),
                    const SizedBox(height: 23,),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColor.fourGris,
                        borderRadius: BorderRadius.all(Radius.circular(AppSizes.fourPadding)),
                      ),
                      padding: const EdgeInsets.fromLTRB(AppSizes.thirdDoublePadding, AppSizes.thirdPadding, AppSizes.nextsmallPadding, AppSizes.thirdPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
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
                          ),
                          const SizedBox(width: 8,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${frLanguage['chooseStartAddress']}", style: AppTextStyle.textSmall(size: 12, color: AppColor.secondGris),),
                                  const SizedBox(width: 46,),
                                  GestureDetector(
                                    child: buildImgCtn(
                                        AppColor.thirdGrey,
                                        AppSizes.fortyPadding,
                                        AppSizes.secondSmalPadding,
                                        AppImages.pencil),
                                  )
                                ],
                              ),
                              buildDivider(size.width / 1.3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${frLanguage['chooseEndAddress']}", style: AppTextStyle.textSmall(size: 12, color: AppColor.secondGris),),
                                  const SizedBox(width: 21,),
                                  GestureDetector(
                                    child: buildImgCtn(AppColor.thirdGrey, AppSizes.fortyPadding, AppSizes.secondSmalPadding, AppImages.pencil),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 17,),
                    Text("${frLanguage['estimatePrice']}", style: AppTextStyle.secondTitle(fontWeight: FontWeight.w900),),
                    const SizedBox(height: 23,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(image: AssetImage(controller.args['imageEngins']), width: AppSizes.largePadding, height: AppSizes.largePadding,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${frLanguage['carType']}", style: AppTextStyle.textSmall(size: 12),),
                                Text(controller.args['typeEngins'], style: AppTextStyle.textBold(size: 12),)
                              ],
                            ),
                          ],
                        ),
                        Text("${controller.args['mtnStart']} - ${controller.args['mtnEnd']}", style: AppTextStyle.textBold(color: AppColor.greenColor, size: 13),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSizes.twentyPadding),
                      child: CustomButton(
                          press: () {},
                          text: "${frLanguage['lunchRequest']}",
                          color: AppColor.thirdGrey,
                          style: AppTextStyle.text()
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}