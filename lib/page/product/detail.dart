import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/profile/shop.dart';
import 'package:kelemapp/route/route.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/rsr/theme/main_theme.dart';
import 'package:kelemapp/widget/icon/icons.dart';
import 'package:kelemapp/widget/info/message.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:kelemapp/widget/product/product_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();

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
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final num relatedProductLimit = 4;

  String cart;

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;

    final Shop shop = product.shop;
    return Scaffold(
      appBar: Menu.getAppBar(context, product.name),
      drawer: Menu.getSideDrawer(context),
      body: Container(
          padding: MainTheme.getPagePadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Section 1, Image, title, add to cart rating.
              buildProductViewSection(product, context),

              // Section 2, Introduction
              buildIntroductionSection(product),

              Divider(
                height: 20,
              ),
              // Section 3, Shop Information

              buildShopInformationSection(shop, context, product),

              Divider(
                color: Theme.of(context).primaryColor,
                height: 20,
              ),
              // Section 4, Similar Items
              buildSimilarItemsSection(product)
            ],
          )),
    );
  }

  Expanded buildProductViewSection(Product product, BuildContext context) {
    return Expanded(
      flex: 8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Center(
                child: ProductView.getThumbnailView(product,
                    expand: false, size: ProductView.SIZE_SMALL),
              )),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      product.name,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.fade,
                    ),
                    AutoSizeText(
                      product.authorOrManufacturer,
                      style: TextStyle(color: CustomColor.GRAY_LIGHT),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ProductView.getPricingView(context, product,
                            size: ProductView.SIZE_LARGE),
                        Text(
                          product.tag
                              .toString()
                              .replaceAll("[", "")
                              .replaceAll("]", ""),
                          style: TextStyle(color: CustomColor.GRAY_LIGHT),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              ProductDetailPage.getRatingStarView(product),
                              FlatButton(
                                child: Text(
                                  "to wishlist",
                                  textScaleFactor: 0.9,
                                ),
                                onPressed: () {
                                  // todo : Add to wish list
                                },
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(cart ?? " "),
                            SizedBox(
                              width: 2,
                            ),
                            RaisedButton(
                              child: Text("Add to cart"),
                              onPressed: () {
                                int add = cart != null ? int.parse(cart) : 0;
                                setState(() {
                                  cart = (add + 1).toString();
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildIntroductionSection(Product product) {
    return Container(
      padding: EdgeInsets.only(top: 4),
      child: Text(
        product.description,
        softWrap: true,
        maxLines: 6,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.justify,
        style: TextStyle(color: CustomColor.GRAY),
      ),
    );
  }

  Container buildShopInformationSection(
      Shop shop, BuildContext context, Product _product) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              /// Navigating to item shop page
              Navigator.pushNamed(context, RouteTo.SHOP_ADMIN,
                  arguments: _product);
            },
            child: Text(
              shop.name,
              textScaleFactor: 1.2,
              style: TextStyle(
                color: CustomColor.GRAY_DARK,
              ),
            ),
          ),
          shop.isVerified
              ? Row(
                  children: <Widget>[
                    Icon(
                      Icons.verified_user,
                      color: Colors.lightGreen,
                      size: 12,
                    ),
                    Text(
                      "verified",
                      textScaleFactor: 0.9,
                      style: TextStyle(color: Colors.lightGreen),
                    )
                  ],
                )
              : Row(
                  children: <Widget>[
                    Icon(Icons.security, color: Colors.red.withOpacity(0.6)),
                    Text("unverified")
                  ],
                ),
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      shop.primaryPhone ?? "no phone number found",
                      style: TextStyle(color: CustomColor.GRAY_LIGHT),
                      textScaleFactor: 0.9,
                    ),
                    Text(
                      shop.secondaryPhone ?? "-",
                      style: TextStyle(color: CustomColor.GRAY_LIGHT),
                      textScaleFactor: 0.9,
                    ),
                    Text(
                      shop.email ?? "no email found",
                      style: TextStyle(color: CustomColor.GRAY_LIGHT),
                      textScaleFactor: 0.9,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          shop.physicalAddress ?? "no physical address",
                          style: TextStyle(color: CustomColor.GRAY),
                          textScaleFactor: 0.9,
                        ),
                        FlatButton(
                          child: Text("view on map"),
                          onPressed: () {
                            _lunchMapsUrl(shop.physicalAddress);
                            // Open map application to show the shops physical location
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),

              // todo : change this with shop's logo
              shop.logo == null
                  ? Icon(
                      Icons.shopping_basket,
                      color: Colors.orange,
                      size: 30,
                    )
                  : CircleAvatar(
                      child: Image.asset(shop.logo),
                    )
            ],
          )
        ],
      ),
    );
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
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: newProducts.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AspectRatio(
                                  aspectRatio: 0.7,
                                  child: ProductView(
                                    newProducts[index],
                                    size: ProductView.SIZE_SMALL,
                                  ),
                                );
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

  Future<List<Product>> getRelatedProduct(Product product) async {
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection(Product.COLLECTION_NAME)
        .where(Product.CATEGORY, isEqualTo: product.category)
        .where(Product.SUB_CATEGORY, isEqualTo: product.subCategory)
        //.where(Product.TAG, arrayContainsAny: product.tag)
        .limit(relatedProductLimit)
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

  void _lunchMapsUrl(String address) async {
    final url = 'https://www.google.com/maps/search/${Uri.encodeFull(address)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }
}
