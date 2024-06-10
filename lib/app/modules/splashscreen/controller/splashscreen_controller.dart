import 'package:get/get.dart';
import 'package:tout_charriot/app/data/services/service_impl/storage_service_impl.dart';
import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {

  @override
  void onInit() {
    controlToApp() ;
    super.onInit();
  }
  controlToApp() {
    Future.delayed(const Duration(seconds: 4), () {
      bool? isLogin = StorageServicesImpl().getBoolData();
      if (isLogin == true) {
        Get.offNamed(Routes.dashboard);
      }else {
        Get.offNamed(Routes.login);
      }
    });

  }
}
