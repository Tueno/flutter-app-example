import 'package:app_example/data/api/sws_api.dart';
import 'package:app_example/domain/model/product_item_model.dart';

class ProductRepository {
  ProductRepository(SWSApi api) : _api = api;
  final SWSApi _api;

  Stream<List<ProductItemModel>> fetchProductsByKeyword(String keyword) {
    return _api.fetchProducts(keyword: keyword).asStream().map((response) {
      if (response.isSuccessful) {
        return response.body.toModel();
      } else {
        throw response.error;
      }
    });
  }
}
