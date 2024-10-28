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
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.cancel:
         return ServerFailure(message: 'Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'No internet connection');
      case DioExceptionType.unknown:
         return ServerFailure(message: 'Oops! there was an error , please try again');
    }
  }
}
