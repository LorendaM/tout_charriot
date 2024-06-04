import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/utils/color.dart';
import 'package:tout_charriot/app/utils/request_utils.dart';
import 'package:tout_charriot/widgets/custom_input.dart';
import '../../../../../widgets/custom_widget.dart';
import '../../../../intl/texts.dart';
import '../../../../utils/constants/image_constants.dart';
import '../../../../utils/constants/size_constants.dart';
import '../../../../utils/text_theme.dart';
import '../controller/home_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${frLanguage['app']}", style: AppTextStyle.secondTitle(),),
        leading: Container(
          padding: const EdgeInsets.only(left: AppSizes.doublespacePadding),
          child: const Image(
            image: AssetImage(AppImages.defaultAvatard),
          ),
        )
        /*const Padding( //celui qui doit être utiliser après
          padding: EdgeInsets.only(left: AppSizes.doublespacePadding),
          child: CircleAvatar(
            radius: 42,
            backgroundImage: AssetImage(AppImages.defaultAvatard),
          ),
        )*/,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.doublespacePadding, vertical: AppSizes.secondSmalPadding),
            child: GestureDetector(
              child: const Image(image: AssetImage(AppImages.notify)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.doublespacePadding, vertical: AppSizes.spacePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.spacePadding),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding),
              child: Text("${frLanguage['welcome']}\nAchille",
                style: AppTextStyle.title(),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding),
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.secondDoublePadding, vertical: AppSizes.spacePadding),
              decoration: const BoxDecoration(
                color: AppColor.yellowPrimary,
                borderRadius: BorderRadius.all(Radius.circular(AppSizes.secondSmalPadding)),
              ),
              height: 105,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${frLanguage['yourWallet']}", style: AppTextStyle.secondtext(),),
                      Text("12.000 CFA", style: AppTextStyle.title(),)
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: 58,
                          height: 58,
                          decoration: const BoxDecoration(
                            color: AppColor.secondWiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(AppSizes.secondSmalPadding)),
                          ),
                          child: const Icon(Icons.add),
                        ),
                        onTap: () {}, // nav to top up
                      ),
                      Text("${frLanguage['topUp']}", style: AppTextStyle.textSmall(size: 11),)
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spacePadding,),
            GestureDetector(
              onTap: () {
                //kPushNamed(context: context, path: '/search');
                Get.toNamed('/search');
              },
              child: CustomInput(
                hint: "${frLanguage['searchCart']}",
                enable: false,
                image: AppImages.search,
              ),
            ),
            const SizedBox(height: AppSizes.spacePadding,),
            Text("${frLanguage['someMachine']}", style: AppTextStyle.textSmall(size: 12),),
            const SizedBox(height: AppSizes.spacePadding,),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            '/location',
                            arguments:{
                              'imageEngins': AppImages.grue,
                              'typeEngins': "${frLanguage['grue']}",
                              'mtnStart': 25000,
                              'mtnEnd': 32000
                            } );
                      },
                      child: const CustomCategory(text: 'grue', image: AppImages.grue,)
                  ),
                  const SizedBox(width: AppSizes.thirdPadding,),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            '/location',
                            arguments:{
                              'imageEngins': AppImages.grue,
                              'typeEngins': "${frLanguage['grue']}",
                              'mtnStart': 25000,
                              'mtnEnd': 32000
                            } );
                      },
                      child: const CustomCategory(text: 'tricycle', image: AppImages.tricycle,)
                  ),
                  const SizedBox(width: AppSizes.thirdPadding,),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            '/location',
                            arguments:{
                              'imageEngins': AppImages.grue,
                              'typeEngins': "${frLanguage['grue']}",
                              'mtnStart': 25000,
                              'mtnEnd': 32000
                            } );
                      },
                      child: const CustomCategory(text: 'truck', image: AppImages.camion,)
                  ),
                  const SizedBox(width: AppSizes.thirdPadding,),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            '/location',
                            arguments:{
                              'imageEngins': AppImages.grue,
                              'typeEngins': "${frLanguage['grue']}",
                              'mtnStart': 25000,
                              'mtnEnd': 32000
                            } );
                      },
                      child: const CustomCategory(text: 'grue', image: AppImages.grue,)
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spacePadding,),
            Text("${frLanguage['recentRaces']}", style: AppTextStyle.textSmall(size: 12),),
            const SizedBox(height: AppSizes.spacePadding,),
            const CustomCard(
              dateRace: "Lundi 3 Mai 2024",
              numRace: "#CHZUO76543",
              lieuDepart: "Lomé, Togo, Rue cinkacé",
              lieuArrive: "Lomé, Togo, Sanguera",
              montantRace: "200.000",
              statusRace: StatusRace.watting,
            ),
            const SizedBox(height: AppSizes.largePadding),
          ],
        ),
      ),
    );
  }
}