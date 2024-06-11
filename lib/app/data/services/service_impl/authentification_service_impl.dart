import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tout_charriot/app/data/services/authentification_service.dart';
import 'package:tout_charriot/app/data/services/abstract_service.dart';
import 'package:tout_charriot/app/data/services/service_impl/storage_service_impl.dart';
import '../../../utils/constants/network_constants.dart';
import '../../../utils/request_utils.dart';

class AuthentificationServiceImpl extends AbstractService
    implements AuthentificationService {

  @override
  Future<String> loginUser(json) async {
    try {
      final response = await http.post(
          kProdUri(endPoint: NetworkConstants.login),
          headers: header(),
          body: json);
      if (!checkIfSuccess(statusCode: response.statusCode)) {
        final msg = jsonDecode(response.body);
        String message =msg['message'];
        throw AppException(reasonMessage: message);
      }
      Map<String, dynamic> credentials = jsonDecode(response.body);
      String jwt = credentials['token']['token'];
      String message =credentials['message'];
      StorageServicesImpl().setToken(jwt);
      final meResponse = await http.get(kProdUri(endPoint: NetworkConstants.meResponse),
          headers: authHeaders(token: jwt));
      if (!checkIfSuccess(statusCode: meResponse.statusCode)) {
        final msg = jsonDecode(response.body);
        String message =msg['message'];
        throw AppException(reasonMessage: message);
      }
      Map<String, dynamic> responseData = jsonDecode(meResponse.body);
      final jSons = jsonEncode(responseData['data']);
      StorageServicesImpl().setUserData(jSons);
      return message;
    } catch (e) {
      throw AppException(reasonMessage: e.toString());
    }
  }

  @override
  Future<String> registerUser(dynamic json) async {
    try {
      final response = await http.post(
        kProdUri(endPoint: NetworkConstants.register),
        headers: header(),
        body: json,
      );
      if (!checkIfSuccess(statusCode: response.statusCode)) {
        final msg = jsonDecode(response.body);
        String message =msg['message'];
        throw AppException(reasonMessage: message);
      }
      Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData['message'];
    } catch (e) {
      throw AppException(reasonMessage: e.toString());
    }
  }
}
