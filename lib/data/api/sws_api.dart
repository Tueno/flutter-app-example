import 'package:app_example/data/response/product_search_response.dart';
import 'package:chopper/chopper.dart';

part 'sws_api.chopper.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@ChopperApi(baseUrl: '/V3')
abstract class SWSApi extends ChopperService {
  static SWSApi create([ChopperClient client]) => _$SWSApi(client);

  @Get(path: "/itemSearch")
  Future<Response<ProductSearchResponse>> fetchProducts(
      {@Query('query') String keyword,
      @Query('results') int limit,
      @Query('start') int offset});
}
