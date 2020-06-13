import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/module/product.dart';

class ViewProduct extends StatelessWidget {
  static const routeName = "/view_product_screen";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedProduct =
        Provider.of<ProductsProvider>(context, listen: false).findById(id);
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(selectedProduct.title),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(50))),
                elevation: 10,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50)),
                  child: Container(
                    height: mq.size.height * 0.5,
                    width: mq.size.width,
                    child:
                        Image.asset(selectedProduct.imgUrl, fit: BoxFit.scaleDown),
                  ),
                ),
              ),
              Positioned(
                  top: mq.size.height * 0.40,
                  right: mq.size.width * 0.1,
                  child: Icon(
                    selectedProduct.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text("${selectedProduct.price.toString()}\$",
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
                      child: Container(
              padding: EdgeInsets.all(20),
              height: mq.size.height * 0.20,
              width: mq.size.width,
              decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20) ),
              ),
              child: SingleChildScrollView(
                            child: Text(
                  selectedProduct.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
