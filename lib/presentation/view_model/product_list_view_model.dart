import 'package:app_example/data/repository/product_repository.dart';
import 'package:app_example/domain/model/product_item_model.dart';
import 'package:app_example/presentation/view_data/product_item_view_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:intl/intl.dart";
import 'package:rxdart/rxdart.dart';

class ProductListViewModel extends StateNotifier<List<ProductItemViewData>> {
  ProductListViewModel({@required ProductRepository repository})
      : _repository = repository,
        super([]) {
    _bindObservables();
  }

  final ProductRepository _repository;
  final BehaviorSubject<String> _keywordSubject = BehaviorSubject();

  void _bindObservables() {
    _keywordSubject.debounceTime(Duration(milliseconds: 300)).listen((event) {
      if (event.isNotEmpty) {
        fetchProductsByKeyword(event);
      }
    });
  }

  // TODO: SearchのVMを作ったら移動
  void setKeyword(String keyword) {
    _keywordSubject.add(keyword);
  }

  void fetchProductsByKeyword(String keyword) {
    _repository.fetchProductsByKeyword(keyword).handleError((error) {
      print(error);
    }).listen((response) {
      state = response.map((_modelToViewData)).toList(growable: false);
    });
  }

  ProductItemViewData _modelToViewData(ProductItemModel model) {
    final format = NumberFormat("#,###", "ja_JP");
    final priceStr = '¥' + format.format(model.price);
    return ProductItemViewData(
        name: model.name, price: priceStr, imageUrl: model.thumbnailUrl);
  }
}
