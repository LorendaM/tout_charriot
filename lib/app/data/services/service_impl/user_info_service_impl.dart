import 'dart:convert';

import 'package:tout_charriot/app/data/services/service_impl/storage_service_impl.dart';

import '../../../utils/constants/network_constants.dart';
import '../../../utils/request_utils.dart';
import '../../models/user_model.dart';
import 'package:http/http.dart' as http;
import '../abstract_service.dart';
import '../user_info_service.dart';

class UserInfoServiceImpl extends AbstractService
    implements UserInfoService {
  @override
  Future<AckResponse<UserModel?>> userInfo() async {
    try {
      String accessToken =StorageServicesImpl().getToken();
      final meResponse = await http.get(
          kProdUri(endPoint: NetworkConstants.meResponse),
          headers: authHeaders(token: accessToken));
      if (!checkIfSuccess(statusCode: meResponse.statusCode)) {
        return buildAckErrorResponse<UserModel?>(meResponse);
      }
      final userData = jsonDecode(meResponse.body);
      return buildAckSuccessResponse<UserModel>(UserModel.fromJson(userData));
      /*final userData = UserModel.fromJson(jsonDecode(meResponse.body));

      return buildAckSuccessResponse<UserModel>(userData);*/
    } catch (e) {
      throw AppException(reasonMessage: e.toString());
    }
  }


}