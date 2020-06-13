import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/module/product.dart';

class YourProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgurl;
  final double price;

  YourProductItem(
      {@required this.id, @required this.title, @required this.imgurl, @required this.price});

  @override
  Widget build(BuildContext context) {
    final productConatiner = Provider.of<ProductsProvider>(context);

    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage(imgurl),
          backgroundColor: Colors.transparent,
        ),
        title: Text(title),
        subtitle: Text(price.toStringAsFixed(2)),
        trailing: Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  productConatiner.removeOneItem(id);
                },
                icon: Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
