import 'package:flutter/material.dart';
import 'package:shopalastic/module/product.dart';
import 'package:shopalastic/screens/view_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/module/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productContanier = Provider.of<Product>(context, listen: false);
    final cartContanier = Provider.of<CartProvider>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GridTile(
          child: GestureDetector(
            onTap : () => Navigator.of(context).pushNamed(ViewProduct.routeName, arguments: productContanier.id),
                      child: Image.asset(
              productContanier.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
                builder: (ctx, product, child) => IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(product.isFavorite? Icons.favorite : Icons.favorite_border),
                onPressed: () {product.toggleFavoriteStatus();},
              ),
            ),
            title: Text(
              productContanier.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.shopping_cart),
                onPressed: () { 
                  cartContanier.addToCart(productContanier.id, productContanier.title, productContanier.price, productContanier.imgUrl);
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Added To cart"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: "UNDO",
                      onPressed: (){
                        cartContanier.removeItemCart(productContanier.id);
                      },
                    ),
                  ));
                },
          ),
          
        ),
      ),
    ));
  }
}
