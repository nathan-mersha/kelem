import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelemapp/bloc/cart/cart_bloc.dart';
import 'package:kelemapp/bloc/down/down_bloc.dart';
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
                BlocProvider.of<DownBloc>(context).add(DownUnSelectedEvent());
                Navigator.pop(context);
                Navigator.pushNamed(context, RouteTo.PRODUCT_DETAIL,
                    arguments: product);
              },
            ),
            SizedBox(
              width: 2,
            ),
            cardButton(product)
          ],
        ),
      ],
    ),
  );
}

Expanded buildProductViewCart(
    Product product, BuildContext context, int index) {
  return Expanded(
    child: Stack(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AutoSizeText(
                            product.name,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                          ),
                          AutoSizeText(
                            product.authorOrManufacturer,
                            style: TextStyle(color: CustomColor.GRAY_LIGHT),
                          ),
                          AutoSizeText(
                            "${product.price.toString()} br",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                    child: Container(
                        width: 20,
                        child: TextFormField(
                          initialValue: product.quantity,
                          onChanged: (value) {
                            print("value here $value");
                            if (value != "" && value != "0") {
                              product.quantity = value;
                              BlocProvider.of<CartBloc>(context).add(
                                  ReplaceCartDetails(
                                      cartItem: product, index: index));
                            }
                          },
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.close,
              size: 15,
              color: CustomColor.GRAY_LIGHT,
            )),
      ],
    ),
  );
}

Widget cardButton(Product product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartGetItemState) {
            return Text("len ${state.cartItem.products.length}");
          }
          return Text(" ");
        },
      ),
      SizedBox(
        width: 2,
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartGetItemState) {
            if (state.cartItem != null) {
              for (int i = 0; i < state.cartItem.products.length; i++) {
                if (state.cartItem.products[i].productId == product.productId) {
                  print("product.quantity ${product.productId}");
                  return ElevatedButton(
                    child: Text("Remove from cart"),
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context)
                          .add(CardRemoveItem(cartItem: product));
                    },
                  );
                } else {
                  print(
                      "state.cartItem[i].name ${state.cartItem.products[i].name} and ${product.name}");
                }
              }
            }
          }
          return ElevatedButton(
            child: Text("Add to cart"),
            onPressed: () {
              // int add = cart != null ? int.parse(cart) : 0;
              // setState(() {
              //   cart = (add + 1).toString();
              // });

              BlocProvider.of<CartBloc>(context)
                  .add(CardAddItem(cartItem: product));
            },
          );
        },
      )
    ],
  );
}
