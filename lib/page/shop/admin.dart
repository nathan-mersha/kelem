import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kelemapp/route/route.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/commerce/product.dart';
import '../../model/profile/shop.dart';
import '../../rsr/theme/color.dart';
import '../../widget/icon/icons.dart';
import '../../widget/info/message.dart';
import '../../widget/product/product_view.dart';

class ShopAdminPage extends StatefulWidget {
  @override
  _ShopAdminPageState createState() => _ShopAdminPageState();
}

class _ShopAdminPageState extends State<ShopAdminPage> {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;

    final Shop shop = product.shop;
    return Scaffold(
      appBar: Menu.getAppBar(context, "Shop Admin"),
      drawer: Menu.getSideDrawer(context),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: shop.shopId != "1"
                                ? Image.asset(shop.logo)
                                : Text("B"),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                shop.name ?? "shopName",
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                    color: CustomColor.GRAY_DARK, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteTo.SHOP_ISSUE_COUPON,
                                      arguments: shop);
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      8.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("issue coupon",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  shop.primaryPhone ?? "primaryPhone",
                                  textScaleFactor: 1.2,
                                  style: TextStyle(
                                      color: CustomColor.GRAY_LIGHT,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  shop.secondaryPhone ?? "secondaryPhone",
                                  textScaleFactor: 1.2,
                                  style: TextStyle(
                                      color: CustomColor.GRAY_LIGHT,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  // "abebe.shop@gmail.com",
                                  // style: TextStyle(fontSize: 10),
                                  shop.email ?? "shopEmail",
                                  textScaleFactor: 1.2,
                                  style: TextStyle(
                                      color: CustomColor.GRAY_LIGHT,
                                      fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                // Text("click here to verify shop", style: TextStyle(fontSize: 10,color: Colors.red[200]),),
                                shop.isVerified
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.verified_user,
                                            color: Colors.lightGreen,
                                            size: 12,
                                          ),
                                          Text(
                                            "verified",
                                            textScaleFactor: 0.9,
                                            style: TextStyle(
                                                color: Colors.lightGreen),
                                          )
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.security,
                                              color:
                                                  Colors.red.withOpacity(0.6)),
                                          Text("unverified")
                                        ],
                                      ),
                              ],
                            ),
                            Container(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _lunchMapsUrl();
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text("set Location",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, RouteTo.SHOP_ADD_ITEM,
                                          arguments: shop);
                                    },
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        Text("Add Item",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                color: CustomColor.GRAY_VERY_LIGHT,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "click here",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "to upgrade to premium package",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: CustomColor.GRAY,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            buildSimilarItemsSection(product)
          ],
        ),
      ),
    );
  }

  Future<List<Product>> getRelatedProduct(Product product) async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection(Product.COLLECTION_NAME)
        .where(Product.CATEGORY, isEqualTo: product.category)
        .where(Product.SUB_CATEGORY, isEqualTo: product.subCategory)
        // .where(Product.TAG, arrayContainsAny: product.tag)
        .orderBy(Product.LAST_MODIFIED)
        .getDocuments();
    List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;

    List<Product> products =
        documentSnapshot.map((DocumentSnapshot documentSnapshot) {
      Product p = Product.toModel(documentSnapshot.data);
      return p;
    }).toList();

    return products;
  }

  Expanded buildSimilarItemsSection(Product product) {
    return Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FutureBuilder(
              future: getRelatedProduct(product),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return Message(
                    message: "Could not find related items",
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  List<Product> newProducts = snapshot.data;
                  return newProducts.isEmpty
                      ? Message(
                          message: "Could not find related items",
                        )
                      : Expanded(
                          child: GridView.builder(
                              shrinkWrap: false,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                              ),
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

  void _lunchMapsUrl() async {
    final url = 'https://www.google.com/maps';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }
}
