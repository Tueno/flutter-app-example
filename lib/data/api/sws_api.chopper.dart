// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sws_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$SWSApi extends SWSApi {
  _$SWSApi([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SWSApi;

  @override
  Future<Response<ProductSearchResponse>> fetchProducts(
      {String keyword, int limit, int offset}) {
    final $url = '/V3/itemSearch';
    final $params = <String, dynamic>{
      'query': keyword,
      'results': limit,
      'start': offset
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<ProductSearchResponse, ProductSearchResponse>($request);
  }
}
