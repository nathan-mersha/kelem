import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kelemapp/widget/nav/menu.dart';

import '../../model/commerce/product.dart';
import '../../widget/icon/icons.dart';
import '../../widget/info/message.dart';
import '../../widget/product/product_view.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Wishlist"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Column(
          children: [
            buildSimilarItemsSection()

          ],
        ),
      ),
    );
  }
  Future<List<Product>> getRelatedProduct() async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection(Product.COLLECTION_NAME)
        .orderBy(Product.LAST_MODIFIED)
        .getDocuments();
    List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;

    List<Product> products = documentSnapshot.map((DocumentSnapshot documentSnapshot) {
      Product p = Product.toModel(documentSnapshot.data);
      return p;
    }).toList();

    return products;
  }

  Expanded buildSimilarItemsSection() {
    return Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          FutureBuilder(
              future: getRelatedProduct(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
                  return Message(
                    message: "Could not find related items",
                  );
                } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  List<Product> newProducts = snapshot.data;
                  return newProducts.isEmpty
                      ? Message(
                    message: "Could not find related items",
                  )
                      : Expanded(
                    child:  GridView.builder(
                        shrinkWrap: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisSpacing: 4,),
                        itemCount: newProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductView(newProducts[index]);
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Container(
                    child: Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: TextStyle(color: Colors.black45),
                        )),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Message(
                        icon: CustomIcons.getHorizontalLoading(),
                        message: "loading",
                      ),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }

}
