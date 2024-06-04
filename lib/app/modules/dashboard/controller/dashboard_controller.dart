import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedIndex = 1.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
