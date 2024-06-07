import '../../utils/request_utils.dart';
import '../models/user_model.dart';

abstract class AuthentificationService {
  Future<AckResponse<UserModel?>> loginUser(json);
  Future<AckResponse<UserModel?>> registerUser(json);
}