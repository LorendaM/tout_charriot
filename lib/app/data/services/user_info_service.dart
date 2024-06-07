import '../../utils/request_utils.dart';
import '../models/user_model.dart';

abstract class UserInfoService {
  Future<AckResponse<UserModel?>> userInfo();
}