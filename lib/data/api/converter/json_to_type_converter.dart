import 'package:chopper/chopper.dart';

// https://github.com/dart-lang/language/issues/356
// https://medium.com/@boylenssen/converting-the-response-from-chopper-to-an-object-642fd46608ff
class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;
  JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final jsonDictResponse = super.convertResponse(response);
    return response.copyWith(
      body: fromJsonData<BodyType, InnerType>(
          jsonDictResponse.body, typeToJsonFactoryMap[InnerType]),
    );
  }

  T fromJsonData<T, InnerType>(
      Map<String, dynamic> jsonDict, Function jsonParser) {
    return jsonParser(jsonDict);
  }
}
