import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/page/product/detail.dart';
import 'package:kelemapp/route/route.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/widget/product/product_view.dart';

Expanded buildProductViewSectionBottomSheet(
    Product product, BuildContext context) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Center(
                  child: ProductView.getThumbnailView(product,
                      size: ProductView.SIZE_SMALL),
                )),
            Expanded(
              flex: 3,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        AutoSizeText(
          product.description,
          style: TextStyle(
            fontSize: 20,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
              child: Text("book detail"),
              onPressed: () {
                Navigator.pushNamed(context, RouteTo.PRODUCT_DETAIL,
                    arguments: product);
              },
            ),
            SizedBox(
              width: 2,
            ),
            ElevatedButton(
              child: Text("Add to cart"),
              onPressed: () {
                // int add = cart != null ? int.parse(cart) : 0;
                // setState(() {
                //   cart = (add + 1).toString();
                // });
              },
            ),
          ],
        ),
      ],
    ),
  );
}
