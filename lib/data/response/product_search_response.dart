// ignore_for_file: unnecessary_getters_setters

import 'package:app_example/domain/model/product_item_model.dart';

class ProductSearchResponse {
  int _totalResultsAvailable;
  int _totalResultsReturned;
  int _firstResultsPosition;
  ProductSearchRequest _request;
  List<Hits> _hits;

  ProductSearchResponse(
      {int totalResultsAvailable,
      int totalResultsReturned,
      int firstResultsPosition,
      ProductSearchRequest request,
      List<Hits> hits}) {
    this._totalResultsAvailable = totalResultsAvailable;
    this._totalResultsReturned = totalResultsReturned;
    this._firstResultsPosition = firstResultsPosition;
    this._request = request;
    this._hits = hits;
  }

  int get totalResultsAvailable => _totalResultsAvailable;
  set totalResultsAvailable(int totalResultsAvailable) =>
      _totalResultsAvailable = totalResultsAvailable;
  int get totalResultsReturned => _totalResultsReturned;
  set totalResultsReturned(int totalResultsReturned) =>
      _totalResultsReturned = totalResultsReturned;
  int get firstResultsPosition => _firstResultsPosition;
  set firstResultsPosition(int firstResultsPosition) =>
      _firstResultsPosition = firstResultsPosition;
  ProductSearchRequest get request => _request;
  set request(ProductSearchRequest request) => _request = request;
  List<Hits> get hits => _hits;
  set hits(List<Hits> hits) => _hits = hits;

  ProductSearchResponse.fromJson(Map<String, dynamic> json) {
    _totalResultsAvailable = json['totalResultsAvailable'];
    _totalResultsReturned = json['totalResultsReturned'];
    _firstResultsPosition = json['firstResultsPosition'];
    _request = json['request'] != null
        ? new ProductSearchRequest.fromJson(json['request'])
        : null;
    if (json['hits'] != null) {
      _hits = new List<Hits>();
      json['hits'].forEach((v) {
        _hits.add(new Hits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalResultsAvailable'] = this._totalResultsAvailable;
    data['totalResultsReturned'] = this._totalResultsReturned;
    data['firstResultsPosition'] = this._firstResultsPosition;
    if (this._request != null) {
      data['request'] = this._request.toJson();
    }
    if (this._hits != null) {
      data['hits'] = this._hits.map((v) => v.toJson()).toList();
    }
    return data;
  }

  /// MEMO: I would say it would be possible to directly convert JSON to Model without using Response class if we have a BFF.
  List<ProductItemModel> toModel() {
    return _hits
        .map((e) => ProductItemModel(
            janCode: e.janCode,
            storeId: e.seller.sellerId,
            name: e.name,
            thumbnailUrl: e.image.medium,
            price: e.price))
        .toList(growable: false);
  }
}

class ProductSearchRequest {
  String _query;

  ProductSearchRequest({String query}) {
    this._query = query;
  }

  String get query => _query;
  set query(String query) => _query = query;

  ProductSearchRequest.fromJson(Map<String, dynamic> json) {
    _query = json['query'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this._query;
    return data;
  }
}

class Hits {
  int _index;
  String _name;
  String _description;
  String _headLine;
  String _url;
  bool _inStock;
  String _code;
  String _condition;
  String _imageId;
  Image _image;
  Review _review;
  num _affiliateRate;
  int _price;
  int _premiumPrice;
  bool _premiumPriceStatus;
  String _premiumDiscountType;
  num _premiumDiscountRate;
  PriceLabel _priceLabel;
  Point _point;
  Shipping _shipping;
  GenreCategory _genreCategory;
  List<ParentGenreCategories> _parentGenreCategories;
  Brand _brand;
  List<ParentBrands> _parentBrands;
  String _janCode;
  String _isbn;
  int _releaseDate;
  Seller _seller;
  Delivery _delivery;

  Hits(
      {int index,
      String name,
      String description,
      String headLine,
      String url,
      bool inStock,
      String code,
      String condition,
      String imageId,
      Image image,
      Review review,
      double affiliateRate,
      int price,
      int premiumPrice,
      bool premiumPriceStatus,
      String premiumDiscountType,
      double premiumDiscountRate,
      PriceLabel priceLabel,
      Point point,
      Shipping shipping,
      GenreCategory genreCategory,
      List<ParentGenreCategories> parentGenreCategories,
      Brand brand,
      List<Null> parentBrands,
      String janCode,
      String isbn,
      int releaseDate,
      Seller seller,
      Delivery delivery}) {
    this._index = index;
    this._name = name;
    this._description = description;
    this._headLine = headLine;
    this._url = url;
    this._inStock = inStock;
    this._code = code;
    this._condition = condition;
    this._imageId = imageId;
    this._image = image;
    this._review = review;
    this._affiliateRate = affiliateRate;
    this._price = price;
    this._premiumPrice = premiumPrice;
    this._premiumPriceStatus = premiumPriceStatus;
    this._premiumDiscountType = premiumDiscountType;
    this._premiumDiscountRate = premiumDiscountRate;
    this._priceLabel = priceLabel;
    this._point = point;
    this._shipping = shipping;
    this._genreCategory = genreCategory;
    this._parentGenreCategories = parentGenreCategories;
    this._brand = brand;
    this._parentBrands = parentBrands;
    this._janCode = janCode;
    this._isbn = isbn;
    this._releaseDate = releaseDate;
    this._seller = seller;
    this._delivery = delivery;
  }

  int get index => _index;
  set index(int index) => _index = index;
  String get name => _name;
  set name(String name) => _name = name;
  String get description => _description;
  set description(String description) => _description = description;
  String get headLine => _headLine;
  set headLine(String headLine) => _headLine = headLine;
  String get url => _url;
  set url(String url) => _url = url;
  bool get inStock => _inStock;
  set inStock(bool inStock) => _inStock = inStock;
  String get code => _code;
  set code(String code) => _code = code;
  String get condition => _condition;
  set condition(String condition) => _condition = condition;
  String get imageId => _imageId;
  set imageId(String imageId) => _imageId = imageId;
  Image get image => _image;
  set image(Image image) => _image = image;
  Review get review => _review;
  set review(Review review) => _review = review;
  double get affiliateRate => _affiliateRate;
  set affiliateRate(double affiliateRate) => _affiliateRate = affiliateRate;
  int get price => _price;
  set price(int price) => _price = price;
  int get premiumPrice => _premiumPrice;
  set premiumPrice(int premiumPrice) => _premiumPrice = premiumPrice;
  bool get premiumPriceStatus => _premiumPriceStatus;
  set premiumPriceStatus(bool premiumPriceStatus) =>
      _premiumPriceStatus = premiumPriceStatus;
  String get premiumDiscountType => _premiumDiscountType;
  set premiumDiscountType(String premiumDiscountType) =>
      _premiumDiscountType = premiumDiscountType;
  double get premiumDiscountRate => _premiumDiscountRate;
  set premiumDiscountRate(double premiumDiscountRate) =>
      _premiumDiscountRate = premiumDiscountRate;
  PriceLabel get priceLabel => _priceLabel;
  set priceLabel(PriceLabel priceLabel) => _priceLabel = priceLabel;
  Point get point => _point;
  set point(Point point) => _point = point;
  Shipping get shipping => _shipping;
  set shipping(Shipping shipping) => _shipping = shipping;
  GenreCategory get genreCategory => _genreCategory;
  set genreCategory(GenreCategory genreCategory) =>
      _genreCategory = genreCategory;
  List<ParentGenreCategories> get parentGenreCategories =>
      _parentGenreCategories;
  set parentGenreCategories(
          List<ParentGenreCategories> parentGenreCategories) =>
      _parentGenreCategories = parentGenreCategories;
  Brand get brand => _brand;
  set brand(Brand brand) => _brand = brand;
  List<Null> get parentBrands => _parentBrands;
  set parentBrands(List<Null> parentBrands) => _parentBrands = parentBrands;
  String get janCode => _janCode;
  set janCode(String janCode) => _janCode = janCode;
  String get isbn => _isbn;
  set isbn(String isbn) => _isbn = isbn;
  int get releaseDate => _releaseDate;
  set releaseDate(int releaseDate) => _releaseDate = releaseDate;
  Seller get seller => _seller;
  set seller(Seller seller) => _seller = seller;
  Delivery get delivery => _delivery;
  set delivery(Delivery delivery) => _delivery = delivery;

  Hits.fromJson(Map<String, dynamic> json) {
    _index = json['index'];
    _name = json['name'];
    _description = json['description'];
    _headLine = json['headLine'];
    _url = json['url'];
    _inStock = json['inStock'];
    _code = json['code'];
    _condition = json['condition'];
    _imageId = json['imageId'];
    _image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    _review =
        json['review'] != null ? new Review.fromJson(json['review']) : null;
    _affiliateRate = json['affiliateRate'];
    _price = json['price'];
    _premiumPrice = json['premiumPrice'];
    _premiumPriceStatus = json['premiumPriceStatus'];
    _premiumDiscountType = json['premiumDiscountType'];
    _premiumDiscountRate = json['premiumDiscountRate'];
    _priceLabel = json['priceLabel'] != null
        ? new PriceLabel.fromJson(json['priceLabel'])
        : null;
    _point = json['point'] != null ? new Point.fromJson(json['point']) : null;
    _shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    _genreCategory = json['genreCategory'] != null
        ? new GenreCategory.fromJson(json['genreCategory'])
        : null;
    if (json['parentGenreCategories'] != null) {
      _parentGenreCategories = new List<ParentGenreCategories>();
      json['parentGenreCategories'].forEach((v) {
        _parentGenreCategories.add(new ParentGenreCategories.fromJson(v));
      });
    }
    _brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    if (json['parentBrands'] != null) {
      _parentBrands = new List<ParentBrands>();
      json['parentBrands'].forEach((v) {
        _parentBrands.add(new ParentBrands.fromJson(v));
      });
    }
    _janCode = json['janCode'];
    _isbn = json['isbn'];
    _releaseDate = json['releaseDate'];
    _seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    _delivery = json['delivery'] != null
        ? new Delivery.fromJson(json['delivery'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this._index;
    data['name'] = this._name;
    data['description'] = this._description;
    data['headLine'] = this._headLine;
    data['url'] = this._url;
    data['inStock'] = this._inStock;
    data['code'] = this._code;
    data['condition'] = this._condition;
    data['imageId'] = this._imageId;
    if (this._image != null) {
      data['image'] = this._image.toJson();
    }
    if (this._review != null) {
      data['review'] = this._review.toJson();
    }
    data['affiliateRate'] = this._affiliateRate;
    data['price'] = this._price;
    data['premiumPrice'] = this._premiumPrice;
    data['premiumPriceStatus'] = this._premiumPriceStatus;
    data['premiumDiscountType'] = this._premiumDiscountType;
    data['premiumDiscountRate'] = this._premiumDiscountRate;
    if (this._priceLabel != null) {
      data['priceLabel'] = this._priceLabel.toJson();
    }
    if (this._point != null) {
      data['point'] = this._point.toJson();
    }
    if (this._shipping != null) {
      data['shipping'] = this._shipping.toJson();
    }
    if (this._genreCategory != null) {
      data['genreCategory'] = this._genreCategory.toJson();
    }
    if (this._parentGenreCategories != null) {
      data['parentGenreCategories'] =
          this._parentGenreCategories.map((v) => v.toJson()).toList();
    }
    if (this._brand != null) {
      data['brand'] = this._brand.toJson();
    }
    if (this._parentBrands != null) {
      data['parentBrands'] = this._parentBrands.map((v) => v.toJson()).toList();
    }
    data['janCode'] = this._janCode;
    data['isbn'] = this._isbn;
    data['releaseDate'] = this._releaseDate;
    if (this._seller != null) {
      data['seller'] = this._seller.toJson();
    }
    if (this._delivery != null) {
      data['delivery'] = this._delivery.toJson();
    }
    return data;
  }
}

class Image {
  String _small;
  String _medium;

  Image({String small, String medium}) {
    this._small = small;
    this._medium = medium;
  }

  String get small => _small;
  set small(String small) => _small = small;
  String get medium => _medium;
  set medium(String medium) => _medium = medium;

  Image.fromJson(Map<String, dynamic> json) {
    _small = json['small'];
    _medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this._small;
    data['medium'] = this._medium;
    return data;
  }
}

class Review {
  num _rate;
  int _count;
  String _url;

  Review({double rate, int count, String url}) {
    this._rate = rate;
    this._count = count;
    this._url = url;
  }

  double get rate => _rate;
  set rate(double rate) => _rate = rate;
  int get count => _count;
  set count(int count) => _count = count;
  String get url => _url;
  set url(String url) => _url = url;

  Review.fromJson(Map<String, dynamic> json) {
    _rate = json['rate'];
    _count = json['count'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this._rate;
    data['count'] = this._count;
    data['url'] = this._url;
    return data;
  }
}

class PriceLabel {
  bool _taxable;
  int _defaultPrice;
  int _discountedPrice;
  int _fixedPrice;
  int _premiumPrice;
  int _periodStart;
  int _periodEnd;

  PriceLabel(
      {bool taxable,
      int defaultPrice,
      int discountedPrice,
      int fixedPrice,
      int premiumPrice,
      int periodStart,
      int periodEnd}) {
    this._taxable = taxable;
    this._defaultPrice = defaultPrice;
    this._discountedPrice = discountedPrice;
    this._fixedPrice = fixedPrice;
    this._premiumPrice = premiumPrice;
    this._periodStart = periodStart;
    this._periodEnd = periodEnd;
  }

  bool get taxable => _taxable;
  set taxable(bool taxable) => _taxable = taxable;
  int get defaultPrice => _defaultPrice;
  set defaultPrice(int defaultPrice) => _defaultPrice = defaultPrice;
  int get discountedPrice => _discountedPrice;
  set discountedPrice(int discountedPrice) =>
      _discountedPrice = discountedPrice;
  int get fixedPrice => _fixedPrice;
  set fixedPrice(int fixedPrice) => _fixedPrice = fixedPrice;
  int get premiumPrice => _premiumPrice;
  set premiumPrice(int premiumPrice) => _premiumPrice = premiumPrice;
  int get periodStart => _periodStart;
  set periodStart(int periodStart) => _periodStart = periodStart;
  int get periodEnd => _periodEnd;
  set periodEnd(int periodEnd) => _periodEnd = periodEnd;

  PriceLabel.fromJson(Map<String, dynamic> json) {
    _taxable = json['taxable'];
    _defaultPrice = json['defaultPrice'];
    _discountedPrice = json['discountedPrice'];
    _fixedPrice = json['fixedPrice'];
    _premiumPrice = json['premiumPrice'];
    _periodStart = json['periodStart'];
    _periodEnd = json['periodEnd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxable'] = this._taxable;
    data['defaultPrice'] = this._defaultPrice;
    data['discountedPrice'] = this._discountedPrice;
    data['fixedPrice'] = this._fixedPrice;
    data['premiumPrice'] = this._premiumPrice;
    data['periodStart'] = this._periodStart;
    data['periodEnd'] = this._periodEnd;
    return data;
  }
}

class Point {
  int _amount;
  int _times;
  int _bonusAmount;
  int _bonusTimes;
  int _premiumAmount;
  int _premiumTimes;
  int _premiumBonusAmount;
  int _premiumBonusTimes;

  Point(
      {int amount,
      int times,
      int bonusAmount,
      int bonusTimes,
      int premiumAmount,
      int premiumTimes,
      int premiumBonusAmount,
      int premiumBonusTimes}) {
    this._amount = amount;
    this._times = times;
    this._bonusAmount = bonusAmount;
    this._bonusTimes = bonusTimes;
    this._premiumAmount = premiumAmount;
    this._premiumTimes = premiumTimes;
    this._premiumBonusAmount = premiumBonusAmount;
    this._premiumBonusTimes = premiumBonusTimes;
  }

  int get amount => _amount;
  set amount(int amount) => _amount = amount;
  int get times => _times;
  set times(int times) => _times = times;
  int get bonusAmount => _bonusAmount;
  set bonusAmount(int bonusAmount) => _bonusAmount = bonusAmount;
  int get bonusTimes => _bonusTimes;
  set bonusTimes(int bonusTimes) => _bonusTimes = bonusTimes;
  int get premiumAmount => _premiumAmount;
  set premiumAmount(int premiumAmount) => _premiumAmount = premiumAmount;
  int get premiumTimes => _premiumTimes;
  set premiumTimes(int premiumTimes) => _premiumTimes = premiumTimes;
  int get premiumBonusAmount => _premiumBonusAmount;
  set premiumBonusAmount(int premiumBonusAmount) =>
      _premiumBonusAmount = premiumBonusAmount;
  int get premiumBonusTimes => _premiumBonusTimes;
  set premiumBonusTimes(int premiumBonusTimes) =>
      _premiumBonusTimes = premiumBonusTimes;

  Point.fromJson(Map<String, dynamic> json) {
    _amount = json['amount'];
    _times = json['times'];
    _bonusAmount = json['bonusAmount'];
    _bonusTimes = json['bonusTimes'];
    _premiumAmount = json['premiumAmount'];
    _premiumTimes = json['premiumTimes'];
    _premiumBonusAmount = json['premiumBonusAmount'];
    _premiumBonusTimes = json['premiumBonusTimes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this._amount;
    data['times'] = this._times;
    data['bonusAmount'] = this._bonusAmount;
    data['bonusTimes'] = this._bonusTimes;
    data['premiumAmount'] = this._premiumAmount;
    data['premiumTimes'] = this._premiumTimes;
    data['premiumBonusAmount'] = this._premiumBonusAmount;
    data['premiumBonusTimes'] = this._premiumBonusTimes;
    return data;
  }
}

class Shipping {
  int _code;
  String _name;

  Shipping({int code, String name}) {
    this._code = code;
    this._name = name;
  }

  int get code => _code;
  set code(int code) => _code = code;
  String get name => _name;
  set name(String name) => _name = name;

  Shipping.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['name'] = this._name;
    return data;
  }
}

class GenreCategory {
  int _id;
  String _name;
  int _depth;

  GenreCategory({int id, String name, int depth}) {
    this._id = id;
    this._name = name;
    this._depth = depth;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  int get depth => _depth;
  set depth(int depth) => _depth = depth;

  GenreCategory.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['depth'] = this._depth;
    return data;
  }
}

class Brand {
  int _id;
  String _name;

  Brand({Null id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  Brand.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}

class Seller {
  String _sellerId;
  String _name;
  String _url;
  bool _isBestSeller;
  bool _isPMallSeller;
  String _payment;
  Review _review;
  String _imageId;

  Seller(
      {String sellerId,
      String name,
      String url,
      bool isBestSeller,
      bool isPMallSeller,
      String payment,
      Review review,
      String imageId}) {
    this._sellerId = sellerId;
    this._name = name;
    this._url = url;
    this._isBestSeller = isBestSeller;
    this._isPMallSeller = isPMallSeller;
    this._payment = payment;
    this._review = review;
    this._imageId = imageId;
  }

  String get sellerId => _sellerId;
  set sellerId(String sellerId) => _sellerId = sellerId;
  String get name => _name;
  set name(String name) => _name = name;
  String get url => _url;
  set url(String url) => _url = url;
  bool get isBestSeller => _isBestSeller;
  set isBestSeller(bool isBestSeller) => _isBestSeller = isBestSeller;
  bool get isPMallSeller => _isPMallSeller;
  set isPMallSeller(bool isPMallSeller) => _isPMallSeller = isPMallSeller;
  String get payment => _payment;
  set payment(String payment) => _payment = payment;
  Review get review => _review;
  set review(Review review) => _review = review;
  String get imageId => _imageId;
  set imageId(String imageId) => _imageId = imageId;

  Seller.fromJson(Map<String, dynamic> json) {
    _sellerId = json['sellerId'];
    _name = json['name'];
    _url = json['url'];
    _isBestSeller = json['isBestSeller'];
    _isPMallSeller = json['isPMallSeller'];
    _payment = json['payment'];
    _review =
        json['review'] != null ? new Review.fromJson(json['review']) : null;
    _imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sellerId'] = this._sellerId;
    data['name'] = this._name;
    data['url'] = this._url;
    data['isBestSeller'] = this._isBestSeller;
    data['isPMallSeller'] = this._isPMallSeller;
    data['payment'] = this._payment;
    if (this._review != null) {
      data['review'] = this._review.toJson();
    }
    data['imageId'] = this._imageId;
    return data;
  }
}

class Delivery {
  String _area;
  int _deadLine;
  int _day;

  Delivery({String area, int deadLine, int day}) {
    this._area = area;
    this._deadLine = deadLine;
    this._day = day;
  }

  String get area => _area;
  set area(String area) => _area = area;
  int get deadLine => _deadLine;
  set deadLine(int deadLine) => _deadLine = deadLine;
  int get day => _day;
  set day(int day) => _day = day;

  Delivery.fromJson(Map<String, dynamic> json) {
    _area = json['area'];
    _deadLine = json['deadLine'];
    _day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this._area;
    data['deadLine'] = this._deadLine;
    data['day'] = this._day;
    return data;
  }
}

class ParentGenreCategories {
  int _depth;
  int _id;
  String _name;

  ParentGenreCategories({int depth, int id, String name}) {
    this._depth = depth;
    this._id = id;
    this._name = name;
  }

  int get depth => _depth;
  set depth(int depth) => _depth = depth;
  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  ParentGenreCategories.fromJson(Map<String, dynamic> json) {
    _depth = json['depth'];
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depth'] = this._depth;
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}

class ParentBrands {
  int _id;
  String _name;

  ParentBrands({int id, String name}) {
    this._id = id;
    this._name = name;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;

  ParentBrands.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}
