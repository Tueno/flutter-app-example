import 'package:app_example/presentation/view_data/product_item_view_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCell extends StatelessWidget {
  ProductCell({@required ProductItemViewData viewData}) : _data = viewData;

  final ProductItemViewData _data;

  @override
  Widget build(BuildContext context) {
    final root = Card(
        margin: const EdgeInsets.all(0),
        child: Container(
            child: Stack(alignment: Alignment.topCenter, children: [
          CachedNetworkImage(imageUrl: _data.imageUrl),
          Column(children: [
            Expanded(
              child: Container(),
            ),
            Container(
                padding: EdgeInsets.all(6),
                color: Colors.black.withOpacity(0.5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _data.name,
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        _data.price,
                        style: TextStyle(color: Colors.white),
                      ),
                    ])),
          ])
        ])));
    return root;
  }
}
