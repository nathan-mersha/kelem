import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/profile/shop.dart';
import 'package:kelemapp/widget/icon/icons.dart';
import 'package:kelemapp/widget/info/message.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:kelemapp/widget/product/product_view.dart';

class ProductDetailPage extends StatelessWidget {
  final num relatedProductLimit = 4;

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    double childAspectRatio = product.category == "book" ? 0.6 : 1;

    final Shop shop = product.shop;
    return Scaffold(
      appBar: Menu.getAppBar(context, product.name),
      drawer: Menu.getSideDrawer(context),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Section 1, Image, title, add to cart rating.
         Expanded(flex: 8, child:  Row(

           children: <Widget>[
             ProductView.getThumbnailView(product, expand: false),
             Expanded(child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text(product.name),
                 Text(product.authorOrManufacturer),
                 ProductView.getPricingView(context, product),
                 Text(product.tag.toString().replaceAll("[", "").replaceAll("]", "")),
                 Row(
                   children: <Widget>[
                     getRatingStarView(product),
                     FlatButton(
                       child: Text("to wishlist"),
                       onPressed: () {
                         // todo : Add to wish list
                       },
                     )
                   ],
                 ),
                 Row(
                   children: <Widget>[],
                 )
               ],
             ),)
           ],
         ),),

          // Section 2, Introduction
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Introduction",
                textAlign: TextAlign.left,
              ),
              Text(
                product.description,
                softWrap: true,
                maxLines: 4,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.justify,
              )
            ],
          ),

          // Section 3, Shop Information
          Column(
            children: <Widget>[
              Text(shop.name),
              shop.isVerified
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.verified_user,
                    color: Colors.lightGreen,
                  ),
                  Text("verified")
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Icon(Icons.security, color: Colors.red.withOpacity(0.6)), Text("unverified")],
              ),
              Text(shop.primaryPhone ?? "no phone number found"),
              Text(shop.secondaryPhone ?? "-"),
              Text(shop.email ?? "no email found"),
              Row(
                children: <Widget>[
                  Text(shop.physicalAddress ?? "no physical address"),
                  FlatButton(
                    child: Text("view on map"),
                    onPressed: () {
                      // Open map application to show the shops physical location
                    },
                  )
                ],
              )
            ],
          ),

          // Section 4, Similar Items
          Expanded(
            flex: 7,
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Similar items"),
              FutureBuilder(
                  future: getRelatedProduct(product),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
                      return Message(
                        message: "Could not find related items",
                      );
                    } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                      List<Product> newProducts = snapshot.data;
                      print("Similar products : ${newProducts}");
                      return newProducts.isEmpty
                          ? Message(
                        message: "Could not find related items",
                      )
                          : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
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
                      return Message(
                        icon: CustomIcons.getHorizontalLoading(),
                        message: "loading",
                      );
                    }
                  })
            ],
          ),)
        ],
      )),
    );
  }

  static getRatingStarView(Product product) {
    return RatingBar(
      itemSize: 20,
      initialRating: product.rating.toDouble() ?? 0,
      minRating: 1,
      direction: Axis.horizontal,
      glow: true,
      maxRating: 5,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // Send rating information to server
        // show pop animation and notify user of the updated rating info.
      },
    );
  }

  Future<List<Product>> getRelatedProduct(Product product) async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection(Product.COLLECTION_NAME)
        .where(Product.CATEGORY, isEqualTo: product.category)
        .where(Product.SUB_CATEGORY, isEqualTo: product.subCategory)
        .where(Product.TAG, arrayContainsAny: product.tag)
        .limit(relatedProductLimit)
        .orderBy(Product.LAST_MODIFIED)
        .getDocuments();

    List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;

    List<Product> products = documentSnapshot.map((DocumentSnapshot documentSnapshot) {
      Product p = Product.toModel(documentSnapshot.data);
      return p;
    }).toList();

    return products;
  }
}
