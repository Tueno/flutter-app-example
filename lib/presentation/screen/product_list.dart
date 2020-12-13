import 'package:app_example/di/providers.dart';
import 'package:app_example/presentation/component/product_cell.dart';
import 'package:app_example/presentation/screen/product_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/all.dart';

class ProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: 追加読み込み実装
    final consumer = Consumer(builder: (context, watch, child) {
      final viewModelId = watch(productListViewModelIdProvider);
      final viewDataArray =
          watch(productListViewModelByIdProvider(viewModelId).state);
      final gridView = GridView.builder(
          itemBuilder: (context, position) {
            final cell =
                ProductCell(viewData: viewDataArray.elementAt(position));
            // 画面遷移テスト
            final route = MaterialPageRoute(builder: (context) {
              return Scaffold(body: ProductSearchWidget());
            });
            return GestureDetector(
                onTap: () {
                  Navigator.push(context, route);
                },
                child: cell);
          },
          itemCount: viewDataArray.length,
          padding: EdgeInsets.fromLTRB(
              16, 16, 16, MediaQuery.of(context).padding.bottom + 16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ));
      return gridView;
    });
    return SafeArea(
      bottom: false,
      child: consumer,
    );
  }
}
