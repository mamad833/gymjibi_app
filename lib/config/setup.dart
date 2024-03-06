import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gymjibi/config/service/failure.dart';
import 'package:gymjibi/config/web_service.dart';


import 'hive_service/hive_service.dart';

final _getIt = GetIt.instance;

T inject<T extends Object>() => _getIt.call();

class _$AppModule extends _AppModule {}

Future<void> setup() async {
  var app = _$AppModule();
  _getIt.registerSingletonAsync<WebService>(() async => app._webService);
}

abstract class _AppModule {
  WebService get _webService => WebService()
    ..initialOrUpdate(
      baseUrl: "https://api.gymjibi.com/Dkm7SCusZw/",
      header: {
        HttpHeaders.contentTypeHeader: 'application/json',
        "accept": "application/json",
        if (HiveServices.getToken != null)
          HttpHeaders.authorizationHeader: "Bearer ${HiveServices.getToken}"
      },
      refreshToken: () async {
        try {
          var response = await _webService.dio.post("auth/refresh");
          HiveServices.addToken(response.data["data"]["token"]);
          return {
            "status": true,
            "token": response.data["data"]["token"],
          };
        } on DioException catch (e) {
          return {
            "status": false,
            "message":
            ServerFailure.fromJson(e.response?.data).map[Failure.key],
          };
        }
      },
    );
}
