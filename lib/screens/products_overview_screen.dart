import 'package:flutter/material.dart';
import 'package:shopalastic/widgets/product_grid.dart';
import 'package:shopalastic/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/module/cart.dart';
import 'package:shopalastic/screens/cart_screen.dart';
import 'package:shopalastic/widgets/side_drawer.dart';


enum FilterOptions { Favorits, All }

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = "/products_overview_screen";
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    final cartContainer = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopalastic'),
          actions: <Widget>[
            Consumer<CartProvider>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cartContainer.noItemsInCart.toString(),
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: FilterOptions.Favorits,
                  child: Text("Only Favorites"),
                ),
                PopupMenuItem(
                  value: FilterOptions.All,
                  child: Text("Show All"),
                ),
              ],
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorits) {
                    _showFavoritesOnly = true;
                  } else {
                    _showFavoritesOnly = false;
                  }
                });
              },
            ),
          ],
        ),
        drawer: SideDrawer(),
        body: ProductGrid(_showFavoritesOnly));
  }
}
