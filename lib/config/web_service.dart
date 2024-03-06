import 'dart:io';
import 'package:dio/dio.dart';
import 'hive_service/hive_service.dart';
import 'service/endpoints.dart';
import 'service/failure.dart';
import 'service/global.dart';
import 'service/request_retry.dart';

class WebService {
  static final WebService _singleton = WebService._internal();

  factory WebService() => _singleton;

  WebService._internal();

  Dio get dio => _dio;

  late Dio _dio;

  late Map<String, dynamic> header;
  late String baseUrl;
  late Function refreshToken;
  Failure? Function(dynamic map)? failure;

  void initialOrUpdate({
    Map<String, dynamic>? header,
    String? baseUrl,
    Function? refreshToken,
    Failure? Function(dynamic map)? failure,
  }) {
    if (header != null) this.header = header;
    if (baseUrl != null) this.baseUrl = baseUrl;
    if (refreshToken != null) this.refreshToken = refreshToken;
    if (failure != null) this.failure = failure;

    _dio = Dio()
      ..options.baseUrl = this.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.sendTimeout = Endpoints.sendTimeout
      ..options.headers = this.header
      ..interceptors.add(
        LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
        ),
      )
      ..interceptors.add(MiddlewareInspector(
        this.refreshToken,
        this.header,
        this.failure,
      ));
  }
}

class MiddlewareInspector extends QueuedInterceptorsWrapper {
  final Function refreshToken;
  final Map<String, dynamic> header;
  final Failure? Function(dynamic map)? failure;

  MiddlewareInspector(this.refreshToken, this.header, this.failure);

  DioException get _errorNetwork => DioException(
      requestOptions: RequestOptions(path: "Connection problem"),
      type: DioExceptionType.unknown,
      message: GEasyHelper.errorNetwork,
      error: GEasyHelper.errorNetwork);

  DioException _error(String error) => DioException(
      requestOptions: RequestOptions(path: error),
      type: DioExceptionType.badResponse,
      message: error,
      error: error);

  String _message(Map<String, dynamic> json) {
    if (failure != null) {
      return failure!(json)!.map[Failure.key];
    }
    return ServerFailure.fromJson(json).map[Failure.key];
  }

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    options.headers = header;
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print("ALO1");
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // CustomToast.show(err.response?.data['message']);
    if (err.type == DioExceptionType.unknown &&
        err.error != null &&
        err.error is SocketException) {
      return handler.next(_errorNetwork);
    } else if (err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionTimeout) {
      return handler.next(_errorNetwork);
    } else if (err.response?.statusCode == 401) {
      print("lkfsjkljlkj ${HiveServices.getToken}");
      if (HiveServices.getToken != null) {
        try {
          var result = await refreshToken();
          if (!result['status']) {
            return handler
                .reject(_error(_message(Failure.error(result['message'] ?? _message(err.response?.data),))));
            // return handler.reject(_error(
            //   result['message'] ?? _message(err.response?.data),
            // ));
          }

          var res = await RequestRetry()(
            options: err.requestOptions,
            token: result['token'],
            webService: WebService(),
            header: header,
          );
          return handler.resolve(res);
        } catch (e) {
          return handler
              .reject(_error(_message(Failure.error("Unknonw error."))));
        }
      } else {
        return handler.reject(_error(_message(err.response?.data)));
      }
    } else {
      // return handler.reject(_error(_message(err.response?.data)));
    }
  }
}

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:vibe_app/core/config/endpoints.dart';
// import 'package:vibe_app/core/config/hive_service/hive_service.dart';
//
// import '../helper/custom_tost.dart';
//
// class WebService {
//   Dio get dio => Dio()
//     ..options.baseUrl = EndPoints.baseUrl
//     ..options.headers = EndPoints.headers
//     ..interceptors.add(
//       LogInterceptor(
//          request: true,
//         responseBody: true,
//         requestBody: true,
//         requestHeader: true,
//         responseHeader: true,
//         error: true,
//       ),
//     )
//     ..interceptors.add(ErrorInterceptor());
// }
//
// class ErrorInterceptor extends Interceptor {
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//    CustomToast.show(err.response!.data['message']);
//     if (err.response!.statusCode == 401) {
//       print(
//           "@@@@@@@@@@@@@@@@@@@@@@@@@\n############################################3\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//       // refreshToken();
//     }
//     super.onError(err, handler);
//   }
// }
//
// Future<void> refreshToken() async {
//   try {
//     var response = await inject<WebService>().dio.post("auth/refresh");
//     print(response.statusCode);
//     print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Token>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//     print(response.data["data"]["token"]);
//     HiveServices.getToken(response.data["data"]["token"]);
//   } on DioException catch (e) {
//     print(
//         "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<ErrorRefreshToken>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//     print(e.response!.data);
//   }
// }
