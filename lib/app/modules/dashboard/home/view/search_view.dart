import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tout_charriot/app/intl/texts.dart';
import 'package:tout_charriot/app/utils/color.dart';
import 'package:tout_charriot/app/utils/constants/image_constants.dart';
import 'package:tout_charriot/app/utils/constants/size_constants.dart';
import 'package:tout_charriot/app/utils/text_theme.dart';
import 'package:tout_charriot/widgets/custom_input.dart';


class SearchView extends GetView<SearchController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor:AppColor.whiteColor,
        iconTheme: const IconThemeData(
            color: AppColor.blackColor
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppSizes.spacePadding),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.nextDefaultPadding, horizontal: AppSizes.smallPadding),
              child: CustomInput(
                hint: "${frLanguage['searchCart']}",
                prefixIcon: const Icon(
                  Icons.search,
                  size: 50,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(1),
                  physics: const BouncingScrollPhysics(),
                  itemCount: 16,
                  itemBuilder: (cxt, index) {
                    return buildListCart(index);
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildListCart(int index) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColor.thirdGris,
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.minSecondary)),
        ),
        padding: const EdgeInsets.all(AppSizes.spacePadding),
        margin: const EdgeInsets.symmetric(vertical: AppSizes.spacePadding),
        child: Row(
          children: [
            const Image(image: AssetImage(AppImages.camion), width: 47, height: 47),
            const SizedBox(width: AppSizes.spacePadding,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("300 ${frLanguage['devise']} / km", style: AppTextStyle.textBold(),),
                Text("Mini camion", style: AppTextStyle.text(),),
              ],
            )
          ],
        ),
      ),
    );
  }
}