// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'product_item_view_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProductItemViewDataTearOff {
  const _$ProductItemViewDataTearOff();

// ignore: unused_element
  _ProductItemViewData call(
      {@required String name,
      @required String price,
      @required String imageUrl}) {
    return _ProductItemViewData(
      name: name,
      price: price,
      imageUrl: imageUrl,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProductItemViewData = _$ProductItemViewDataTearOff();

/// @nodoc
mixin _$ProductItemViewData {
  String get name;
  String get price;
  String get imageUrl;

  $ProductItemViewDataCopyWith<ProductItemViewData> get copyWith;
}

/// @nodoc
abstract class $ProductItemViewDataCopyWith<$Res> {
  factory $ProductItemViewDataCopyWith(
          ProductItemViewData value, $Res Function(ProductItemViewData) then) =
      _$ProductItemViewDataCopyWithImpl<$Res>;
  $Res call({String name, String price, String imageUrl});
}

/// @nodoc
class _$ProductItemViewDataCopyWithImpl<$Res>
    implements $ProductItemViewDataCopyWith<$Res> {
  _$ProductItemViewDataCopyWithImpl(this._value, this._then);

  final ProductItemViewData _value;
  // ignore: unused_field
  final $Res Function(ProductItemViewData) _then;

  @override
  $Res call({
    Object name = freezed,
    Object price = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$ProductItemViewDataCopyWith<$Res>
    implements $ProductItemViewDataCopyWith<$Res> {
  factory _$ProductItemViewDataCopyWith(_ProductItemViewData value,
          $Res Function(_ProductItemViewData) then) =
      __$ProductItemViewDataCopyWithImpl<$Res>;
  @override
  $Res call({String name, String price, String imageUrl});
}

/// @nodoc
class __$ProductItemViewDataCopyWithImpl<$Res>
    extends _$ProductItemViewDataCopyWithImpl<$Res>
    implements _$ProductItemViewDataCopyWith<$Res> {
  __$ProductItemViewDataCopyWithImpl(
      _ProductItemViewData _value, $Res Function(_ProductItemViewData) _then)
      : super(_value, (v) => _then(v as _ProductItemViewData));

  @override
  _ProductItemViewData get _value => super._value as _ProductItemViewData;

  @override
  $Res call({
    Object name = freezed,
    Object price = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_ProductItemViewData(
      name: name == freezed ? _value.name : name as String,
      price: price == freezed ? _value.price : price as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
  }
}

/// @nodoc
class _$_ProductItemViewData implements _ProductItemViewData {
  const _$_ProductItemViewData(
      {@required this.name, @required this.price, @required this.imageUrl})
      : assert(name != null),
        assert(price != null),
        assert(imageUrl != null);

  @override
  final String name;
  @override
  final String price;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'ProductItemViewData(name: $name, price: $price, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductItemViewData &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(imageUrl);

  @override
  _$ProductItemViewDataCopyWith<_ProductItemViewData> get copyWith =>
      __$ProductItemViewDataCopyWithImpl<_ProductItemViewData>(
          this, _$identity);
}

abstract class _ProductItemViewData implements ProductItemViewData {
  const factory _ProductItemViewData(
      {@required String name,
      @required String price,
      @required String imageUrl}) = _$_ProductItemViewData;

  @override
  String get name;
  @override
  String get price;
  @override
  String get imageUrl;
  @override
  _$ProductItemViewDataCopyWith<_ProductItemViewData> get copyWith;
}
