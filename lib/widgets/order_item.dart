import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopalastic/module/cart.dart';
import 'dart:math';

class OrderItem extends StatelessWidget {
  final double total;
  final List<CartItem> orderedItems;

  OrderItem({
    @required this.total,
    @required this.orderedItems,
  });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.all(20),
        height: mq.height * 0.5,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Order #${Random.secure().nextInt(10000)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).primaryColor),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.airport_shuttle,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Shipped",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()).toString(),
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orderedItems.length,
                itemBuilder: (context, i) => Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${orderedItems[i].title}",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Container(
                            width: 120,
                            child : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                            "${orderedItems[i].quantity} pcs",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          Text(
                            "\$${orderedItems[i].quantity * orderedItems[i].price}",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: mq.height * 0.1,
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.place,
                        color: Colors.white,
                      ),
                      Text(
                        "Ismailia",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "\$$total",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
