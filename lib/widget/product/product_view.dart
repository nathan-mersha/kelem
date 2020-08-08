import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/route/route.dart';
import 'package:kelemapp/widget/product/product_placeholder.dart';

class ProductView extends StatelessWidget {
  final Product _product;

  ProductView(this._product);

  static Widget getThumbnailView(Product product, {bool expand = true}) {
    return product.image == null || product.image.isEmpty
        // todo: begin from here : problem here because of not being wrapped in expanded an
        ? expand
            ? Expanded(child: ProductPlaceholder(product))
            : ProductPlaceholder(product) // If no image is provided, uses Product place holder
        : Expanded(
            child: CachedNetworkImage(
              imageUrl: product.image,
              useOldImageOnUrlChange: true,
              placeholderFadeInDuration: Duration(seconds: 1),
              placeholder: (BuildContext context, String imageURL) {
                return ProductPlaceholder(product);
              },
            ),
          );
  }

  static Widget getPricingView(BuildContext context, Product product,
      {double priceFontSize = 15, double regularPriceFontSize = 13}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "${product.price.toString()} br",
          maxLines: 2,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.w800, fontSize: priceFontSize),
        ),
        product.regularPrice == null || product.regularPrice == product.price
            ? Container()
            : Text(
                "${product.regularPrice.toString()} br",
                maxLines: 1,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.left,
                softWrap: false,
                style: TextStyle(
                    color: Colors.red.withOpacity(0.6), decoration: TextDecoration.lineThrough, fontSize: regularPriceFontSize),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// Navigating to item detail page
        Navigator.pushNamed(context, RouteTo.PRODUCT_DETAIL, arguments: _product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Image thumbnail or image place holder
          getThumbnailView(_product),

          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Product name
                Text(
                  _product.name,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                  softWrap: false,
                  style: TextStyle(color: Colors.black54),
                ),

                // Product Author / Manufacturer
                Text(
                  _product.authorOrManufacturer,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                  softWrap: false,
                  style: TextStyle(color: Colors.black26),
                ),

                // Price and regular price
                SizedBox(
                  height: 4,
                ),

                getPricingView(context, _product)

                // Product price and regular price
              ],
            ),
          )
        ],
      ),
    );
  }
}
