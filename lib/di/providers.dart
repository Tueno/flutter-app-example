import 'package:app_example/data/api/converter/json_to_type_converter.dart';
import 'package:app_example/data/api/interceptor/appid_request_interceptor.dart';
import 'package:app_example/data/api/sws_api.dart';
import 'package:app_example/data/constants/api_environment.dart';
import 'package:app_example/data/constants/prod_api_environment.dart';
import 'package:app_example/data/repository/product_repository.dart';
import 'package:app_example/data/response/product_search_response.dart';
import 'package:app_example/presentation/view_model/product_list_view_model.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

// Repository
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(SWSApi.create(ref.read(_apiClientProvider)));
});

// ViewModel
final productListViewModelByIdProvider = StateNotifierProvider.autoDispose
    .family<ProductListViewModel, String>((ref, key) {
  ref.onDispose(() {
    print("ProductListViewModel onDispose");
  });
  return ProductListViewModel(repository: ref.read(productRepositoryProvider));
});

final productListViewModelIdProvider = ScopedProvider<String>(null);

// Utils
final uuidV1Provider = Provider<Uuid>((_) => Uuid());

// Private: Only used for resolve other dependencies in this file.

// Api
final _apiClientProvider = Provider<ChopperClient>((ref) {
  return ChopperClient(
      baseUrl: ref.read(_apiEnvProvider).url,
      interceptors: ref.read(_requestInterceptorsProvider),
      converter: JsonToTypeConverter({
        ProductSearchResponse: (jsonDict) =>
            ProductSearchResponse.fromJson(jsonDict)
      }));
});

// Interceptor
final _requestInterceptorsProvider = Provider<List<RequestInterceptor>>((ref) {
  return [AppidRequestInterceptor(ref.read(_apiEnvProvider).appId)];
});

// Api Env
final _apiEnvProvider = Provider<ApiEnvironment>((_) {
  return ProductionApiEnvironment();
  // return DevApiEnvironment();
});
