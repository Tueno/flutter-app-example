import 'package:flutter/widgets.dart';

@immutable
class ProductItemModel {
  ProductItemModel(
      {@required this.janCode,
      @required this.storeId,
      @required this.name,
      @required this.price,
      @required this.thumbnailUrl});

  final String janCode;
  final String storeId;
  final String name;
  final int price;
  final String thumbnailUrl;

  String get id {
    return "";
  }
}
