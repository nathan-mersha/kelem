import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kelemapp/model/commerce/product.dart';

class ProductPlaceholder extends StatelessWidget {
  final Product product;

  ProductPlaceholder(this.product);

  static final List<dynamic> colorList = [
    0xff220055,
    0xff0b0b28,
    0xff22002b,
    0xff1c241f,
    0xff0b2822,
    0xff00222b,
    0xff280b17,
    0xff241c1f,
    0xff222b00,
    0xff280b0b,
    0xff2b2200,
  ];

  final random = Random().nextInt(colorList.length);

  @override
  Widget build(BuildContext context) {
    return product.category == "book" ? bookView(product) : iotView(product);
  }

  Widget bookView(Product product) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Card(
        color: Color(colorList[random]),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  product.name,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: <Widget>[
                    Text("by",
                        style: TextStyle(fontSize: 9, fontStyle: FontStyle.italic, color: Colors.white),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 4,
                    ),
                    Text(product.authorOrManufacturer,
                        style: TextStyle(fontSize: 12, color: Colors.white), textAlign: TextAlign.center)
                  ],
                ),
                Text(product.subCategory,
                    style: TextStyle(fontSize: 12, color: Colors.white), textAlign: TextAlign.center)
              ],
            )),
      ),
    );
  }

  Widget iotView(Product product) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        color: Color(colorList[random]),
        child: Center(
            child: Icon(
          Icons.developer_board,
          color: Colors.white.withOpacity(0.2),
          size: 50,
        )),
      ),
    );
  }
}
