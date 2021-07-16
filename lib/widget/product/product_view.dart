import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelemapp/bloc/down/down_bloc.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/route/route.dart';
import 'package:kelemapp/widget/product/product_placeholder.dart';

class ProductView extends StatelessWidget {
  final Product _product;
  final String size;
  bool pageAdmin;

  static const String SIZE_SMALL = "SIZE_SMALL";
  static const String SIZE_MEDIUM = "SIZE_MEDIUM";
  static const String SIZE_LARGE = "SIZE_LARGE";

  ProductView(this._product, {this.size = SIZE_MEDIUM, this.pageAdmin = false});

  static Widget getThumbnailView(Product product,
      {bool expand = true, String size = SIZE_MEDIUM}) {
    return product.image == null || product.image.isEmpty
        ? ProductPlaceholder(
            product: product,
            size: size,
          )
        : CachedNetworkImage(
            imageUrl: product.image[0],
            useOldImageOnUrlChange: true,
            placeholderFadeInDuration: Duration(seconds: 1),
            placeholder: (BuildContext context, String imageURL) {
              return ProductPlaceholder(product: product);
            },
          );
  }

  static Widget getPricingView(BuildContext context, Product product,
      {double priceFontSize = 15,
      double regularPriceFontSize = 13,
      size = ProductView.SIZE_MEDIUM}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: size == ProductView.SIZE_LARGE
          ? MainAxisAlignment.start
          : MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "${product.price.toString()} br",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w800,
              fontSize: priceFontSize),
        ),
        SizedBox(
          width: size == ProductView.SIZE_LARGE ? 10 : 0,
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
                    color: Colors.red.withOpacity(0.6),
                    decoration: TextDecoration.lineThrough,
                    fontSize: regularPriceFontSize),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// Navigating to item detail page
        if (!pageAdmin) {
          BlocProvider.of<DownBloc>(context)
              .add(DownSelectedEvent(product: _product, context: context));
        } else {
          Navigator.pushNamed(context, RouteTo.SHOP_ADD_ITEM,
              arguments: _product);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Image thumbnail or image place holder
          Expanded(
            flex: 1,
            child: getThumbnailView(_product, size: ProductView.SIZE_SMALL),
          ),

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
                  style: TextStyle(
                    color: Colors.black54,
                  ),
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

                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: getPricingView(context, _product))

                // Product price and regular price
              ],
            ),
          )
        ],
      ),
    );
  }
}
