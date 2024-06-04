import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tout_charriot/app/modules/dashboard/race/controller/race_waitting_controller.dart';

import '../../../../../widgets/custom_widget.dart';
import '../../../../utils/request_utils.dart';

class RaceWaitingView extends GetView<RaceWaitingController> {
  const RaceWaitingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RaceWaitingController());
    return ListView.builder(
      padding: const EdgeInsets.all(1),
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder: (cxt, index) {
        return const CustomCard(
          dateRace: "Lundi 3 Mai 2024",
          numRace: "#CHZUO76543",
          lieuDepart: "Lomé, Togo, Rue cinkacé",
          lieuArrive: "Lomé, Togo, Sanguera",
          montantRace: "200.000",
          statusRace: StatusRace.watting,
        );
      },
    );
  }
}