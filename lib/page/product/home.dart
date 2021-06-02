import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelemapp/bloc/down/down_bloc.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/page/product/detail.dart';
import 'package:kelemapp/route/route.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/rsr/theme/main_theme.dart';
import 'package:kelemapp/widget/nav/menu.dart';
import 'package:kelemapp/widget/nav/products_nav.dart';
import 'package:kelemapp/widget/product/product_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Expanded buildProductViewSection(Product product, BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Menu.getAppBar(context, "Home", showCategory: true),
      drawer: Menu.getSideDrawer(context),
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocListener<DownBloc, DownState>(
        listener: (context, state) {
          // TODO: implement listener}
          if (state is DownSelected) {
            Scaffold.of(context).showBottomSheet(
              (context) {
                return WillPopScope(
                  onWillPop: () {
                    BlocProvider.of<DownBloc>(context)
                        .add(DownUnSelectedEvent());
                    return Future.value(true);
                  },
                  child: Container(
                    height: 300,
                    child: buildProductViewSection(state.product, context),
                  ),
                );
              },
              elevation: 3,
            );
          }
        },
        child: Padding(
          padding: MainTheme.getPagePadding(),
          child: ProductNavigation(),
        ),
      ),
    );
  }
}
