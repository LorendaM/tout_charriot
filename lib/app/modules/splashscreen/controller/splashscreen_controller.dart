import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {

  @override
  void onInit() {
    controlToApp() ;
    super.onInit();
  }
  controlToApp() {
    Future.delayed(const Duration(seconds: 4), () {
      /*if (storageViewModel.isUserExists) {
        // nav home
      }
      kPushRemplaceNamed(context: context, path: '/login');*/
      Get.offNamed(Routes.login);
    });

  }
}
