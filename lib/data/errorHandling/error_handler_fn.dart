import 'dart:io';

import 'package:dio/dio.dart';

String ErrorHandling({required dynamic error, required String status}) {
  String msg;

  print(' error run time type :: -- ' + error.runtimeType.toString());
  print(' error details :: -- ' + error.toString());

  if (error is Exception) {
    if (error is DioException) {
      // print('error type :: =--- ' +
      //     (error.response?.data.runtimeType != String).toString());
      if (error.response?.data.runtimeType != String &&
          error.response?.data != null) {
        if (error.response?.data['error'] is String) {
          if (error.response?.data['error'] != null) {
            msg = (error.response?.data['error'] ?? '').toString();
            return msg;
          }
        }
      }
      switch (error.type) {
        case (DioExceptionType.badResponse):
          switch (error.response?.statusCode) {
            case (500):
              msg = "Server error!";
              break;
            case (502):
              msg = "Server error!";
              break;
            case (502):
              msg = "Internal server error";
              break;
            case (503):
              msg = "Service unavailable.";
              break;
            case (400):
              msg = "Something went wrong.";
              break;
            case (401):
              msg = "Session expired. Please login in again.";
              break;
            case (403):
              msg =
              "You do not have permission to perform this action. Please contact your HR.";
              break;
            default:
              msg = "Something went wrong";
              break;
          }
          break;
        case (DioExceptionType.connectionError):
          msg = "Something went wrong!";
          break;
        case (DioExceptionType.receiveTimeout):
          msg = "Server timeout. Please try again later.";
          break;
        case (DioExceptionType.connectionTimeout):
          msg = "Connection timeout.";
          break;
        case (DioExceptionType.sendTimeout):
          msg = "Connection timeout.";
          break;
        case (DioExceptionType.unknown):
          msg = "Something went wrong";
          break;
        case (DioExceptionType.badCertificate):
          msg = "Something went wrong";
          break;
        default:
          msg = "Something Went Wrong.";
      }
    } else if (error is HttpException) {
      msg = "Http exception...";
    } else if (error is SocketException) {
      msg = "Please check you internet connection. And try again.";
    } else if (error is TypeError) {
      msg = "Type error. Try again or send report.";
    } else if (error is FormatException) {
      switch (error.message) {
        case (""):
          msg = "";
          break;
        default:
          msg = "Format Exception";
      }
    } else {
      msg = "Something Went Wrong";
    }

    return msg;
  } else {
    return "Something Went Wrong!";
  }
}
