import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/arrive_location_controller.dart';

class ArriveLocationView extends GetView<ArriveLocationController> {
  const ArriveLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArriveLocationController());
    return const Placeholder();
  }
}