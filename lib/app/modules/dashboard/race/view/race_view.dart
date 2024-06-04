import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tout_charriot/app/modules/dashboard/race/view/race_accomplish_view.dart';
import 'package:tout_charriot/app/modules/dashboard/race/view/race_progress_view.dart';
import 'package:tout_charriot/app/modules/dashboard/race/view/race_waitting_view.dart';
import '../../../../intl/texts.dart';
import '../../../../utils/color.dart';
import '../../../../utils/constants/size_constants.dart';
import '../../../../utils/text_theme.dart';
import '../controller/race_controller.dart';

class RaceView extends GetView<RaceController> {
  RaceView({super.key});
  final List<Map<String, dynamic>> myTabs = [
    {
      'label': "${frLanguage['onWatting']}",
      'page': const RaceWaitingView()
    },
    {
      'label': "${frLanguage['inProgress']}",
      'page': const RaceProgressView()
    },
    {
      'label': "${frLanguage['accomplish']}",
      'page': const RaceAccomplishView()
    }
  ];
  @override
  Widget build(BuildContext context) {
    Get.put(RaceController());
    return DefaultTabController(
        length: myTabs.length,
        child: Obx(()=> Scaffold(
            key: controller.scaffoldKey,
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColor.whiteColor,
                    title: Text("${frLanguage['travel']}", style: AppTextStyle.textSmall(size: 16),),
                    pinned: true,
                    floating: true,
                    bottom: TabBar(
                        labelColor: AppColor.blackColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 6,
                        dividerColor: AppColor.whiteColor,
                        padding: const EdgeInsets.symmetric(horizontal: AppSizes.twentyPadding),
                        overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
                        labelStyle: AppTextStyle.textSmallBold(size: 11),
                        indicator: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(AppSizes.secondSmalPadding)),
                          color: AppColor.yellowPrimary,
                        ),
                        tabs: myTabs.map((item) {
                          return Tab(
                            text: item['label'],
                          );
                        }).toList()
                    ),
                  ),
                ];
              },
              body: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  alignment: Alignment.center,
                  child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: myTabs.map<Widget>((item) {
                        return Container(
                            color: AppColor.whiteColor,
                            padding: const EdgeInsets.all(1),
                            child: item['page']
                        );
                      }).toList()
                  )
              ),
            ),
          ),
        )
    );
  }
}