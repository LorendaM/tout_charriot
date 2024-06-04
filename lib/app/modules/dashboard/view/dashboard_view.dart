import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:tout_charriot/app/modules/dashboard/home/view/home_view.dart';
import 'package:tout_charriot/app/modules/dashboard/race/view/race_view.dart';
import 'package:tout_charriot/app/utils/color.dart';

import '../../../../widgets/custom_widget.dart';
import '../../../intl/texts.dart';
import '../../../utils/constants/image_constants.dart';


class DashboardView extends GetView<DashboardController> {
  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return Scaffold(
      body: Obx(() =>tabs[controller.selectedIndex.value]),
      extendBody: true,
      bottomNavigationBar: buildBottomNavBar(),
      backgroundColor: AppColor.whiteColor,
    );
  }
  final tabs = [
    RaceView(),
    const HomeView(),
    const HomeView(),
  ];
  final List<Color> iconColors = [AppColor.blackColor, AppColor.yellowPrimary];

  buildBottomNavBar() {
    return Obx (()=>BottomNavigationBar(
        selectedItemColor: AppColor.yellowPrimary,
        //fixedColor: AppColor.blackColor,
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "${frLanguage['race']}",
            icon: buildBottomNavItem(AppImages.road),
          ),
          BottomNavigationBarItem(
            label: "${frLanguage['home']}",
            icon: buildBottomNavItem(AppImages.home),
          ),
          BottomNavigationBarItem(
            label: "${frLanguage['myAccount']}",
            icon: buildBottomNavItem(AppImages.user),
          ),
        ],
      ),
    );
  }
}