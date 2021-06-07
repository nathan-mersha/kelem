import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  Shop shop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu.getAppBar(context, "Shop Admin"),
      drawer: Menu.getSideDrawer(context),
      body: FutureBuilder(
        future: getShop(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasData) {
            return Center(
                child: Message(
              icon: CustomIcons.noInternet(),
              message: "No internet",
            ));
          } else if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != false) {
              shop = snapshot.data;
            } else {
              shop = null;
            }

            return Container(
              child: Column(
                children: [
                  Container(
                    child: Builder(
                      builder: (context) {
                        if (shop != null) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 10, 0.0, 0.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pushNamed(
                                                context, RouteTo.SHOP_EDIT,
                                                arguments: shop);
                                          },
                                          child: CircleAvatar(
                                            radius: 50,
                                            child: shop.logo == null
                                                ? CircleAvatar(
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                    radius: 50,
                                                    child: Text(
                                                      "${shop.name.substring(0, 1)}",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl: shop.logo,
                                                    useOldImageOnUrlChange:
                                                        false,
                                                    placeholderFadeInDuration:
                                                        Duration(seconds: 1),
                                                    placeholder:
                                                        (BuildContext context,
                                                            String imageURL) {
                                                      return CircleAvatar(
                                                        backgroundColor:
                                                            Theme.of(context)
                                                                .primaryColor,
                                                        radius: 50,
                                                        child: Text(
                                                          "${shop.name.substring(0, 1).toUpperCase()}",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 40,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                            backgroundColor: Colors.transparent,
                                          ),
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
                                                  color: CustomColor.GRAY_DARK,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0.0, 10, 0.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8.0, 8.0, 0.0, 8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    RouteTo.SHOP_ISSUE_COUPON,
                                                    arguments: shop);
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        8.0, 8.0, 0.0, 8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text("issue coupon",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
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
                                                shop.primaryPhone ??
                                                    "primaryPhone",
                                                textScaleFactor: 1.2,
                                                style: TextStyle(
                                                    color:
                                                        CustomColor.GRAY_LIGHT,
                                                    fontSize: 10),
                                              ),
                                              SizedBox(
                                                height: 1,
                                              ),
                                              Text(
                                                shop.secondaryPhone ??
                                                    "secondaryPhone",
                                                textScaleFactor: 1.2,
                                                style: TextStyle(
                                                    color:
                                                        CustomColor.GRAY_LIGHT,
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
                                                    color:
                                                        CustomColor.GRAY_LIGHT,
                                                    fontSize: 10),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              // Text("click here to verify shop", style: TextStyle(fontSize: 10,color: Colors.red[200]),),
                                              shop.isVerified
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.verified_user,
                                                          color:
                                                              Colors.lightGreen,
                                                          size: 12,
                                                        ),
                                                        Text(
                                                          "verified",
                                                          textScaleFactor: 0.9,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .lightGreen),
                                                        )
                                                      ],
                                                    )
                                                  : Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(Icons.security,
                                                            color: Colors.red
                                                                .withOpacity(
                                                                    0.6)),
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
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                      Text("set Location",
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
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
                                                    Navigator.pushNamed(context,
                                                        RouteTo.SHOP_ADD_ITEM,
                                                        arguments: shop);
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Icon(
                                                        Icons.add,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                      Text("Add Item",
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
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
                          );
                        }
                        return Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(
                                      context, RouteTo.SHOP_EDIT);
                                },
                                child: Text(
                                  "click here",
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                              Text(
                                "to setup your first shop",
                                style: TextStyle(
                                  color: CustomColor.GRAY_LIGHT,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Container(
                      height: 40,
                      color: CustomColor.GRAY_VERY_LIGHT,
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Builder(
                        builder: (context) {
                          if (shop != null) {
                            return GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "click here",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
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
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Builder(
                      builder: (context) {
                        if (shop != null) {
                          //to do
                          return buildSimilarItemsSection(shop);
                        }
                        return Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "click here",
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                              Text(
                                "to setup your first shop",
                                style: TextStyle(
                                  color: CustomColor.GRAY_LIGHT,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Message(
              icon: SpinKitFadingFour(
                color: Theme.of(context).primaryColor,
              ),
              message: "loading shop",
            );
          }
        },
      ),
    );
  }

  Future<List<Product>> getRelatedProduct(Shop shop) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(Product.COLLECTION_NAME)
        .where(Product.CATEGORY, isEqualTo: shop.category)
        .where("shop.name", isEqualTo: shop.name)
        .orderBy(Product.LAST_MODIFIED)
        .get();

    List<DocumentSnapshot> documentSnapshot = querySnapshot.docs;

    List<Product> products =
        documentSnapshot.map((DocumentSnapshot documentSnapshot) {
      Product p = Product.toModel(documentSnapshot.data());
      p.productId = documentSnapshot.id;
      return p;
    }).toList();

    return products;
  }

  Expanded buildSimilarItemsSection(Shop shop) {
    return Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FutureBuilder(
              future: getRelatedProduct(shop),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return Message(
                    message: "Could not find shop items",
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  List<Product> newProducts = snapshot.data;
                  return newProducts.isEmpty
                      ? Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(
                                      context, RouteTo.SHOP_ADD_ITEM,
                                      arguments: shop);
                                },
                                child: Text(
                                  "click here",
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                              Text(
                                "to setup your first shop",
                                style: TextStyle(
                                  color: CustomColor.GRAY_LIGHT,
                                ),
                              )
                            ],
                          ),
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
                  print("error ${snapshot.error.toString()}");
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

  Future<dynamic> getShop() async {
    // await getBookByQuery(query: search ?? "b");

    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection(Shop.COLLECTION_NAME)
        .doc("VHSWxOCNn0eI84R1A8Fa")
        .get();

    if (documentSnapshot.data() == null) return false;
    print("her to stay ${Shop.toModel(documentSnapshot.data())}");

    Shop shopData = Shop.toModel(documentSnapshot.data());
    return shopData;
  }
}
