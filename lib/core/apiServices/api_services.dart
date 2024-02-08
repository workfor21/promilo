import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:promilo/core/apiServices/api_urls.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

final client = ApiServices(Dio(), baseUrl: ApiUrls.baseUrl);

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
        maxRedirects: 3,
        sendTimeout: Duration(seconds: 10),
        receiveTimeout: Duration(seconds: 10),
        connectTimeout: Duration(seconds: 10),
        headers: {"Authorization": "Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg=="});

    // init();
    dio.interceptors.add(CustomInterceptor());
    return _ApiServices(dio, baseUrl: baseUrl);
  }

  //login
  @POST('/user/oauth/token')
  @FormUrlEncoded()
  Future loginReq(
    @Field() String? username,
    @Field() String? password, {
    @Field() String grant_type = "password",
  });
}

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log(options.path, name: "request : path");
    final data = options.data;
    if (options.data is FormData) {
      data as FormData;
      data.fields.forEach((field) {
        print('${field.key}: ${field.value}');
      });
    } else {
      log(options.data.toString(), name: "request : body");
    }
    log(options.headers.toString(), name: "request : headers");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(response.statusCode.toString(), name: "response : statusCode");
    log(response.data.toString(), name: "response : data");
    log(response.realUri.toString(), name: "response : url");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(err.response?.statusCode.toString() ?? '', name: "error : statusCode");
    log(err.stackTrace.toString(), name: "error : stackTrace");
    super.onError(err, handler);
  }
}
