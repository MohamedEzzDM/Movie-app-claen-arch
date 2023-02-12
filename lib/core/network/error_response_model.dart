import 'package:equatable/equatable.dart';

class ErrorResponseModel extends Equatable{

  final String success;
  final int statusCode;
  final String statusMessage;

  const ErrorResponseModel(
      {required this.success,
      required this.statusCode,
      required this.statusMessage});

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      success: json["success"],
      statusCode: json["status_code"],
      statusMessage: json["status_message"],
    );
  }

  @override

  List<Object?> get props => [
    success,
    statusCode,
    statusMessage
  ];
}

