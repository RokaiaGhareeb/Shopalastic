import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/module/product.dart';
import 'package:shopalastic/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final _showFavs;
  ProductGrid(this._showFavs);
  
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<ProductsProvider>(context);
    final loadedProducts =  _showFavs? productContainer.favorites : productContainer.products;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
            value: loadedProducts[index],
            child : ProductItem(),
          );}
        );
}
  }