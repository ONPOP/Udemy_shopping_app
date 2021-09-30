import 'package:flutter/material.dart';

import '../widgets/girdview_list.dart';

class ProductsOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('MyShop'),
      ),
      body: GridViewWidget(),
    );
  }
}

