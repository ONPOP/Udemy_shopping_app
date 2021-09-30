import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //처음 생성할 때에는 create 활용 
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.amber,
          textTheme: TextTheme(),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName : (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

