// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              //필요없는 정보는 넘기지 않고 최소한의 정보만을 넘겨서 관련된 더 많은 내용을 불러온다!!
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          //Consumer의 경우 provider.of와 거의 같다!! provider.of를 사용할 수 없을 때 사용!(safari bookmark 참조)
          //provider.of는 해당 위젯 전체를 rebuild하기 때문에 rebuild할 부분만 따로 widget으로 만들어 provider.of를 사용하거나
          //provider.of (.., listen: false) & Consumer을 사용하거나 둘 중 하나를 사용하면 됨!!
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              //child => rebuild 하지 않는 부분!!
              icon: product.isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
