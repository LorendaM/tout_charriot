
import 'constants/network_constants.dart';

Map<String, String> authHeaders({required String token}) => {
      'Content-type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
      'Accept-Charset': 'utf-8',
      'accept': 'application/json'
    };

Map<String, String> header() => {
  'Content-type': 'application/json; charset=utf-8',
  'Accept-Charset': 'utf-8',
  'accept': 'application/json'
};

bool checkIfSuccess({required int statusCode}) {
  return statusCode >= 200 && statusCode < 300;
}
class AckResponse<TModel> {
  TModel? data;
  String? message;
  String? statusCode;
  bool? success;
  AckResponse({this.data, this.message, this.statusCode, this.success});
}

class AckResponseTest<TModel> {
  dynamic data;
  String? message;
  String? statusCode;
  bool? success;
  AckResponseTest({this.data, this.message, this.statusCode, this.success});
}

Uri kProdUri({required String endPoint}) =>
    Uri.parse("${NetworkConstants.baseURL}/$endPoint");

enum Status {
  initial,
  loading,
  loaded,
  error
}

enum StatusRace {
  watting,
  progess,
  complete
}