import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../widgets/custom_widget.dart';
import '../../../../utils/request_utils.dart';
import '../controller/race_accomplish_controller.dart';

class RaceAccomplishView extends GetView<RaceAccomplishController> {
  const RaceAccomplishView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RaceAccomplishController());
    return ListView.builder(
      padding: const EdgeInsets.all(1),
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (cxt, index) {
        return const CustomCard(
          dateRace: "Lundi 3 Mai 2024",
          numRace: "#CHZUO76543",
          lieuDepart: "Lomé, Togo, Rue cinkacé",
          lieuArrive: "Lomé, Togo, Sanguera",
          montantRace: "200.000",
          statusRace: StatusRace.complete,
        );
      },
    );
  }
}