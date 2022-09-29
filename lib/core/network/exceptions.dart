import 'package:movies_app_clean/core/network/error_response_model.dart';


class ServerException implements Exception {
  final ErrorResponseModel errorMessage;

  ServerException({
    required this.errorMessage,
  });
}

class dbException implements Exception{


}