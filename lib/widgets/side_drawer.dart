import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/module/cart.dart';
import 'package:shopalastic/screens/cart_screen.dart';
import 'package:shopalastic/screens/orders_screen.dart';
import 'package:shopalastic/screens/products_overview_screen.dart';
import 'package:shopalastic/screens/your_products_screen.dart';
import 'package:shopalastic/widgets/badge.dart';

class SideDrawer extends StatelessWidget {

  @override
  
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
          final cartContainer = Provider.of<CartProvider>(context, listen: false);

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: mq.height * 0.1,
            ),
            Text("Shopalastic",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, ProductsOverviewScreen.routeName);
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.home,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Shop",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: Row(
                children: <Widget>[
                  
                  Consumer<CartProvider>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cartContainer.noItemsInCart.toString(),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart,
                    color: Theme.of(context).primaryColor,
                    size: 40,),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Cart",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, OrdersScreen.routeName);
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.payment,
                      color: Theme.of(context).primaryColor, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Orders",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, YourProductsScreen.routeName);
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.add_circle,
                      color: Theme.of(context).primaryColor, size: 40),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Your Products",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
