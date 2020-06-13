import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String imgurl;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.quantity,
      @required this.imgurl});
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _item = {};

  Map<String, CartItem> get items {
    return {..._item};
  }

  int get noItemsInCart {
    return _item == null ? 0 : _item.length;
  }

  double get totalMoney {
    double sum = 0.0;
    _item.forEach((key, cartItem) {
      sum += cartItem.price * cartItem.quantity;
    });
    return sum;
  }

  void addToCart(String id, String title, double price, String imgurl) {
    if (_item.containsKey(id)) {
      _item.update(
          id,
          (existingItem) => CartItem(
              id: existingItem.id,
              price: existingItem.price,
              title: existingItem.title,
              quantity: existingItem.quantity + 1,
              imgurl: existingItem.imgurl));
    } else {
      _item.putIfAbsent(
          id,
          () => CartItem(
              id: id, title: title, price: price, quantity: 1, imgurl: imgurl));
    }
    notifyListeners();
  }

  void removeItemCart(String id) {
    _item.removeWhere((val, cartItem) => cartItem.id == id);
    notifyListeners();
  }

  void amountInc(String id) {
    _item.update(
        id,
        (existingItem) => CartItem(
            id: existingItem.id,
            price: existingItem.price,
            title: existingItem.title,
            quantity: existingItem.quantity + 1,
            imgurl: existingItem.imgurl));
    notifyListeners();
  }

  void amountDec(String id) {
    _item.update(
        id,
        (existingItem) => CartItem(
            id: existingItem.id,
            price: existingItem.price,
            title: existingItem.title,
            quantity: existingItem.quantity - 1,
            imgurl: existingItem.imgurl));
    notifyListeners();
  }

  void removeOneItem(String id) {
    if (!_item.containsKey(id)) {
      return;
    }
    if (_item[id].quantity > 1) {
      _item.update(
          id,
          (existingItem) => CartItem(
              id: existingItem.id,
              price: existingItem.price,
              title: existingItem.title,
              quantity: existingItem.quantity - 1,
              imgurl: existingItem.imgurl));
    }else{
      _item.remove(id);
    }
    notifyListeners();
  }

  void clear() {
    _item = {};
    notifyListeners();
  }
}
