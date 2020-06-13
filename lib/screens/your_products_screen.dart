import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/module/product.dart';
import 'package:shopalastic/widgets/side_drawer.dart';
import 'package:shopalastic/widgets/your_product_Item.dart';

class YourProductsScreen extends StatelessWidget {
  static const routeName = "/your_products_screen";
  @override
  Widget build(BuildContext context) {
    final productConatiner = Provider.of<ProductsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          "Y O U R   P R O D U C T S",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                productConatiner.addProduct(id: 'p5', title: 'dress', price: 26.5, description: 'brand new dress', image: "assets/images/rdress.jpg");
              },
              icon: Icon(Icons.add, size: 30),
            ),
        ],
      ),
      drawer: SideDrawer(),

      body: ListView.builder(
          itemCount: productConatiner.products.length,
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: YourProductItem(id: productConatiner.products[i].id, title: productConatiner.products[i].title, price:  productConatiner.products[i].price, imgurl:  productConatiner.products[i].imgUrl,),
          ),
        ),
    );
  }
}