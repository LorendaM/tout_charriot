import '../../../../../widgets/custom_widget.dart';
import '../../../../utils/request_utils.dart';
import '../controller/race_progress_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class RaceProgressView extends GetView<RaceProgressController> {
  const RaceProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RaceProgressController());
    return ListView.builder(
      padding: const EdgeInsets.all(1),
      physics: const BouncingScrollPhysics(),
      itemCount: 1,
      itemBuilder: (cxt, index) {
        return const CustomCard(
          dateRace: "Lundi 3 Mai 2024",
          numRace: "#CHZUO76543",
          lieuDepart: "Lomé, Togo, Rue cinkacé",
          lieuArrive: "Lomé, Togo, Sanguera",
          montantRace: "200.000",
          statusRace: StatusRace.progess,
        );
      },
    );
  }
}