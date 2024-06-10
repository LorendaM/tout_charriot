import 'package:get/get.dart';
import '../../../../data/models/user_model.dart';
import '../../../../data/services/service_impl/storage_service_impl.dart';
import '../../../../data/services/storage_service.dart';

class HomeController extends GetxController {
  late StorageServices _storageService;
  late final Rx<UserModel?> user = Rx<UserModel?>(null);
  String username = '';
  String photo = '';

  @override
  void onInit() {
    _storageService=StorageServicesImpl();
    getUserData();
    super.onInit();
  }

  UserModel getUserData() {
    try {
      UserModel userModel =_storageService.getUserData();
      username = userModel.username!;
      return userModel;
    } catch (e) {
      throw Exception('Failed to load user data: ${e.toString()}');
    }
  }

}
