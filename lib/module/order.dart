import 'package:flutter/material.dart';
import 'package:shopalastic/module/cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> orderedProducts;
  final DateTime orderDate;
  final int status;

  Order({
    @required this.id,
    @required this.total,
    @required this.orderedProducts,
    @required this.orderDate,
    @required this.status
  });
}

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get items {
    return [..._orders];
  }

  void addOrders(List<CartItem> orderedProducts, double total, int status) {
    _orders.insert(
        0,
        Order(
          id: DateTime.now().toString(),
          total: total,
          orderDate: DateTime.now(),
          orderedProducts: orderedProducts,
          status: status,
        ));
    notifyListeners();
  }
}
