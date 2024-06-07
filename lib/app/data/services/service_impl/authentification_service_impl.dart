import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tout_charriot/app/data/services/authentification_service.dart';
import 'package:tout_charriot/app/data/services/abstract_service.dart';
import 'package:tout_charriot/app/data/services/service_impl/storage_service_impl.dart';
import '../../../utils/constants/network_constants.dart';
import '../../../utils/request_utils.dart';
import '../../models/user_model.dart';

class AuthentificationServiceImpl extends AbstractService
    implements AuthentificationService {

  @override
  Future<AckResponse<UserModel?>> loginUser(json) async {
    try {
      final response = await http.post(
          kProdUri(endPoint: NetworkConstants.login),
          headers: header(),
          body: json);
      if (!checkIfSuccess(statusCode: response.statusCode)) {
        return buildAckErrorResponse<UserModel?>(response);
      }
      Map<String, dynamic> credentials = jsonDecode(response.body);
      String jwt = credentials['token']['token'];
      StorageServicesImpl().setToken(jwt);

      final meResponse = await http.get(
          kProdUri(endPoint: NetworkConstants.meResponse),
          headers: authHeaders(token: jwt));
      if (!checkIfSuccess(statusCode: meResponse.statusCode)) {
        return buildAckErrorResponse<UserModel?>(meResponse);
      }
      Map<String, dynamic> user = jsonDecode(meResponse.body);
      print(user['data']);
      UserModel userModel= UserModel.fromJson(jsonDecode(meResponse.body));
      print(userModel.id);
      print('**********');
      print( buildAckSuccessResponse<UserModel>(userModel));
      print('**********');
      //StorageServicesImpl().setUserData(u);
      return buildAckSuccessResponse<UserModel>(user);
    } catch (e) {
      throw AppException(reasonMessage: e.toString());
    }
  }

  @override
  Future<AckResponse<UserModel?>> registerUser(json) async {
    try {
      final response = await http.post(
          kProdUri(endPoint: NetworkConstants.register),
          headers: header(),
          body: json);
      if (!checkIfSuccess(statusCode: response.statusCode)) {
        return buildAckErrorResponse<UserModel?>(response);
      }
      UserModel userData = UserModel.fromJson(jsonDecode(response.body));

      return buildAckSuccessResponse<UserModel>(userData);
    } catch (e) {
      throw AppException(reasonMessage: e.toString());
    }
  }
}
