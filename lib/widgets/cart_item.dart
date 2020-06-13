import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopalastic/module/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final String id;
  final double price;
  final int amount;
  final String imgurl;

  CartItemWidget(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.amount,
      @required this.imgurl});
  @override
  Widget build(BuildContext context) {
     final cartContainer = Provider.of<CartProvider>(context);
    return Dismissible(
      onDismissed: (val){
          cartContainer.removeItemCart(id);
      },
      key: ValueKey(id),
      background: Container(
        padding: EdgeInsets.all(10),
        color: Theme.of(context).primaryColor,
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white, size: 40,),
      ),
      child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.only(top : 10 , bottom: 10, left: 5,),
            child: ListTile(
              leading: Image.asset(
                imgurl,
                fit: BoxFit.cover,
              ),
              title: Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "\$$price",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              trailing: Container(
                height: 40,
                width: 140,
                              child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_left, size: 20, color: Theme.of(context).primaryColor),
                      onPressed: () {
                        if(amount <= 0 ){
                          return;
                        }
                        cartContainer.amountDec(id);
                        },
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        amount.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_right, size: 20, color: Theme.of(context).primaryColor),
                      onPressed: () {cartContainer.amountInc(id);},
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
