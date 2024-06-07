import 'package:http/http.dart';
import 'package:tout_charriot/app/utils/request_utils.dart';

abstract class AbstractService {
  String? accessToken;
  String? baseUrl;
  AckResponse<Tmodel?> buildAckErrorResponse<Tmodel>(Response response) {
    return AckResponse(
        data: null,
        success: false,
        statusCode: '${response.statusCode}',
        message: response.body);
  }
  AckResponse<Tmodel> buildAckSuccessResponse<Tmodel>(dynamic data) {
    return AckResponse<Tmodel>(
        data: data == null ? null : data as Tmodel?,
        success: true,
        statusCode: "200",
        message: "success");
  }
}

class AppException implements Exception {
  final String reasonMessage;
  AppException({required this.reasonMessage});

  @override
  String toString() => reasonMessage;
}

class RequestException implements Exception {
  final String reasonMessage;
  final int statusCode;

  RequestException({required this.reasonMessage, required this.statusCode});
  @override
  String toString() => reasonMessage;
}