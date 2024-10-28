import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'badCertificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            message: 'Oops! there was an error , please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 401:
        return ServerFailure(message: response['error']['message']);
      case 400:
        return ServerFailure(message: response['error']['message']);
      case 404:
        return ServerFailure(
            message: 'your request was not found , please try again');
      case 403:
        return ServerFailure(message: response['error']['message']);
      case 500:
        return ServerFailure(
            message: 'there is a problem with server , please try again');
      default:
        return ServerFailure(message: 'An error occurred, please try again');
    }
  }
}
