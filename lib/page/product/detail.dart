import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kelemapp/bloc/description/description_cubit.dart';
import 'package:kelemapp/bloc/images/image_cubit.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/profile/shop.dart';
import 'package:kelemapp/route/route.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/rsr/theme/main_theme.dart';
import 'package:kelemapp/widget/icon/icons.dart';
import 'package:kelemapp/widget/info/message.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:kelemapp/widget/product/bottom_sheet_product.dart';
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
  List<Product> cartItem = [];

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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // Section 1, Image, title, add to cart rating.
                buildProductViewSection(product, context),

                buildInfoData(product),
                // Section 2, Introduction
                //buildIntroductionSection(product),

                // Divider(
                //   height: 20,
                // ),
                // Section 3, Shop Information

                //buildShopInformationSection(shop, context, product),

                // Divider(
                //   color: Theme.of(context).primaryColor,
                //   height: 20,
                // ),
                // Section 4, Similar Items
                //buildSimilarItemsSection(product)
              ],
            ),
          )),
    );
  }

  Widget buildProductViewSection(Product product, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 200,
        child: BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            if (state is ImageInitial) {
              return Stack(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: product.image[state.currentIndex],
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    useOldImageOnUrlChange: true,
                    fit: BoxFit.cover,
                    placeholderFadeInDuration: Duration(microseconds: 200),
                    placeholder: (BuildContext context, String imageURL) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.0)),
                        ),
                      );
                    },
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: NetworkImage(product.image),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 150,
                          child: ProductView.getThumbnailView(product,
                              expand: false, size: ProductView.SIZE_SMALL),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: product.image.length > 1,
                          child: Container(
                            height: 20,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: ListView.builder(
                                  itemCount: product.image.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 2.0),
                                      child: Icon(
                                        Icons.circle,
                                        size: 10,
                                        color: state.currentIndex == index
                                            ? Colors.white
                                            : Theme.of(context).accentColor,
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: product.image.length > 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  // imageIndex =
                                  //     imageIndex > 0 ? imageIndex - 1 : imageIndex;
                                  // print(" imageIndex $imageIndex");
                                  // setState(() {});
                                  BlocProvider.of<ImageCubit>(context)
                                      .emitPreviceImage(product.image.length);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: CustomColor.GRAY_VERY_LIGHT,
                                  size: 20,
                                )),
                            IconButton(
                                onPressed: () {
                                  // imageIndex =
                                  //     imageIndex < 2 ? imageIndex + 1 : imageIndex;
                                  // print(" imageIndex $imageIndex");
                                  // setState(() {});
                                  BlocProvider.of<ImageCubit>(context)
                                      .emitNextImage(product.image.length);
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: CustomColor.GRAY_VERY_LIGHT,
                                  size: 20,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget buildInfoData(Product product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AutoSizeText(
            product.name.substring(0, 10),
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
                product.tag.toString().replaceAll("[", "").replaceAll("]", ""),
                style: TextStyle(color: CustomColor.GRAY_LIGHT),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ProductDetailPage.getRatingStarView(product),
                  TextButton(
                    child: Text(
                      "to wishlist",
                      textScaleFactor: 0.9,
                    ),
                    onPressed: () {
                      // todo : Add to wish list
                    },
                  ),
                  cardButton(product),
                ],
              ),
            ],
          ),
          buildIntroductionSection(product),
          Center(
            child: BlocBuilder<DescriptionCubit, DescriptionState>(
              builder: (context, state) {
                if (state is DescriptionInitial) {
                  return IconButton(
                      onPressed: () {
                        // showDescription = !showDescription;
                        // setState(() {});
                        BlocProvider.of<DescriptionCubit>(context)
                            .emitDescription();
                      },
                      icon: state.showDescription
                          ? Icon(Icons.keyboard_arrow_up_outlined)
                          : Icon(Icons.keyboard_arrow_down_outlined));
                }
                return Container();
              },
            ),
          ),
          SizedBox(
            height: 5,
          ),
          buildShopInformationSection(product.shop, context, product),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 10,
          ),
          buildSimilarItemsSection(product)
        ],
      ),
    );
  }

  Widget buildIntroductionSection(Product product) {
    return BlocBuilder<DescriptionCubit, DescriptionState>(
      builder: (context, state) {
        if (state is DescriptionInitial && state.showDescription) {
          return Container(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              product.description,
              softWrap: true,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.justify,
              style: TextStyle(color: CustomColor.GRAY),
            ),
          );
        }

        return Container(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            product.description,
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.justify,
            style: TextStyle(color: CustomColor.GRAY),
          ),
        );
      },
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
              Navigator.pushNamed(context, RouteTo.SHOP_DETAIL,
                  arguments: _product);
            },
            child: Text(
              shop.name ?? "a",
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
                          textScaleFactor: 0.7,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _lunchMapsUrl(
                                shop.coOrdinates[0], shop.coOrdinates[1]);
                            // Open map application to show the shops physical location
                          },
                          child: Text(
                            "view on map",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                            textScaleFactor: 0.9,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Theme.of(context).accentColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.facebook,
                          color: Theme.of(context).accentColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.facebook,
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // todo : change this with shop's logo
              CircleAvatar(
                child: shop.logo == null
                    ? Text(
                        "${shop.name.substring(0, 1)}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: shop.logo,
                        useOldImageOnUrlChange: false,
                        placeholderFadeInDuration: Duration(seconds: 1),
                        placeholder: (BuildContext context, String imageURL) {
                          return Text(
                            "${shop.name.substring(0, 1).toUpperCase()}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          );
                        },
                      ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSimilarItemsSection(Product product) {
    return Container(
      height: 155,
      child: Column(
        children: [
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
              }),
        ],
      ),
    );
  }

  Future<List<Product>> getRelatedProduct(Product product) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(Product.COLLECTION_NAME)
        .where(Product.CATEGORY, isEqualTo: product.category)
        .where(Product.SUB_CATEGORY, isEqualTo: product.subCategory)
        //.where(Product.TAG, arrayContainsAny: product.tag)
        .limit(relatedProductLimit)
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

  void _lunchMapsUrl(double lat, double long) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    if (await canLaunch(url)) {
      try {
        await launch(url);
      } catch (e) {
        print('Could not Launch $e');
      }
    } else {
      print('Could not Launch $url');
    }
  }
}
