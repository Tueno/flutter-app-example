import 'dart:async';

import 'package:chopper/chopper.dart';

class AppidRequestInterceptor extends RequestInterceptor {
  AppidRequestInterceptor(String appid) : _appid = appid;
  final String _appid;
  @override
  FutureOr<Request> onRequest(Request request) {
    request.parameters['appid'] = _appid;
    return request;
  }
}
