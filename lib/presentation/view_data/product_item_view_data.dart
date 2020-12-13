import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_item_view_data.freezed.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@freezed
abstract class ProductItemViewData with _$ProductItemViewData {
  const factory ProductItemViewData(
      {@required String name,
      @required String price,
      @required String imageUrl}) = _ProductItemViewData;
}
