import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/color.dart';
import '../controller/notification_controller.dart';
class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColor.transparentColor,
          elevation: 0,
        ),
        body: const SizedBox()
    );
  }
}