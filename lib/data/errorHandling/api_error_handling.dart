import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:promilo/data/errorHandling/error_handler_fn.dart';
import 'package:promilo/data/model/data_model.dart';

Future<DataModel<T?>> tryCatchFunction<T>({required Function method}) async {
  print(method.toString());
  try {
    final response = await method();
    print('response :::: --- ' + response.toString());
    return DataModel(status: "success", data: response);
  } on DioException catch (e, stacktrace) {
    log(stacktrace.toString(), name: "dio-error");
    final error = ErrorHandling(status: 'failed', error: e);
    print(' error handling done and moving to return :: ---- ');
    return DataModel(status: 'failed', msg: error);
  } on Exception catch (e, stacktrace) {
    log(stacktrace.toString(), name: "error");
    final error = ErrorHandling(status: 'failed', error: e);
    return DataModel(status: 'failed', msg: error);
  }
}