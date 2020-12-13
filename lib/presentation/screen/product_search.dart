import 'package:app_example/di/providers.dart';
import 'package:app_example/presentation/screen/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/all.dart';

class ProductSearchWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context,
      T Function<T>(ProviderBase<Object, T> provider) watch) {
    final searchBar = DecoratedBox(
      decoration: BoxDecoration(
          // color: Colors.grey,
          // borderRadius: BorderRadius.circular(10),
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
              color: Colors.black45,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Consumer(builder: (context, watch, child) {
                final viewModelId = watch(productListViewModelIdProvider);
                return TextField(onChanged: (text) {
                  context
                      .read(productListViewModelByIdProvider(viewModelId))
                      .setKeyword(text);
                });
              }),
            ),
          ],
        ),
      ),
    );
    final content = SafeArea(
        bottom: false,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [searchBar, Expanded(child: ProductListWidget())]));
    return ProviderScope(overrides: [
      // TODO: 良い方法がないか検討
      productListViewModelIdProvider
          .overrideAs((_) => context.read(uuidV1Provider).v1())
    ], child: content);
  }
}
