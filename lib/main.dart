import 'package:flutter/material.dart';
import 'package:shopalastic/module/order.dart';
import 'package:shopalastic/module/product.dart';
import 'package:shopalastic/screens/products_overview_screen.dart';
import 'package:shopalastic/screens/view_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/module/cart.dart';
import 'package:shopalastic/screens/cart_screen.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:shopalastic/screens/orders_screen.dart';
import 'package:shopalastic/screens/your_products_screen.dart';


void main() => runApp(
  // DevicePreview(
  //   builder: (context) => MyApp(),
  // ),
  MyApp(),
);
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
         ChangeNotifierProvider(
          create: (ctx) => OrderProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopalastic',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.orangeAccent,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ViewProduct.routeName: (ctx) => ViewProduct(),
          CartScreen.routeName : (ctx) => CartScreen(),
          OrdersScreen.routeName : (ctx) => OrdersScreen(),
          ProductsOverviewScreen.routeName : (ctx) => ProductsOverviewScreen(),
          YourProductsScreen.routeName : (ctx) => YourProductsScreen(),
        },
      ),
    );
  }
}
