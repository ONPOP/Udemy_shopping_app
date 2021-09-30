import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final productList = products.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productList.length,
      //ProductItem에서 Product provider와 연결하기 위해서 부모 클래스에서 
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // create: (c) => productList[i],  ===> cycle 반복하여 생성되는 경우에는 value 사용!!
        value: productList[i],
        child: ProductItem(
          // productList[i].id,
          // productList[i].title,
          // productList[i].imageUrl,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
