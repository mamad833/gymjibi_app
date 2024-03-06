import 'package:dio/dio.dart';
import '../web_service.dart';

class RequestRetry {
  Future<Response> call({
    required RequestOptions options,
    required String token,
    required WebService webService,
    required Map<String, dynamic> header,
  }) async {
    options.headers.clear();
    options.headers.addAll(header);
    return await webService.dio.request(
      options.path,
      data: options.data,
      options: Options(
        contentType: options.contentType,
        headers: options.headers,
        method: options.method,
        validateStatus: (status) => true,
        receiveTimeout: options.receiveTimeout,
        sendTimeout: options.sendTimeout,
        responseType: options.responseType,
        extra: options.extra,
      ),
      cancelToken: options.cancelToken,
      onReceiveProgress: options.onReceiveProgress,
      onSendProgress: options.onSendProgress,
      queryParameters: options.queryParameters,
    );
  }
}
