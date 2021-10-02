import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final double price;
  final String title;
  final int quantity;

  CartItem({
    required this.title,
    required this.id,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    //List 형식이 아니기 때문에 [] 사용 X!!
    return {..._items};
  }

  
  //notifyListeners를 설정하지 않는 이유는 
  //_items가 바뀌더라도 notifyListeners를 설정하지 않는 이유와 동일
  //즉 itemCount 내부에서는 change하지 않는다!
  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += (cartItem.price * cartItem.quantity);
    });
    return total;
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          title: existingCartItem.title,
          id: existingCartItem.id,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity+1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            title: title,
            id: DateTime.now().toString(),
            price: price,
            quantity: 1),
      );
    }
    print(_items.keys.toString());
    notifyListeners();
  }

  void removeItem (String productId){
    _items.remove(productId);
    notifyListeners();
  }

}
