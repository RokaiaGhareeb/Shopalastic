import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/widgets/order_item.dart';
import 'package:shopalastic/widgets/side_drawer.dart';
import 'package:shopalastic/module/order.dart';

class OrdersScreen extends StatelessWidget {
    static const routeName = "/orders_screen";

  @override
  Widget build(BuildContext context) {
    final orderContainer = Provider.of<OrderProvider>(context);
    return Scaffold(        backgroundColor: Colors.blueGrey[50],

      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          "O R D E R S",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
      ),
      drawer: SideDrawer(),
      body:  ListView.builder(
          itemCount: orderContainer.items.length,
          itemBuilder: (context, i) => OrderItem(total: orderContainer.items[i].total, orderedItems: orderContainer.items[i].orderedProducts,),
        ),
      
    );
  }
}