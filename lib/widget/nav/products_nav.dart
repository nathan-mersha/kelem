import 'package:flutter/material.dart';
import 'package:kelemapp/global.dart' as global;
import 'package:kelemapp/model/config/global.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/widget/icon/icons.dart';
import 'package:kelemapp/widget/info/message.dart';
import 'package:kelemapp/widget/nav/search.dart';
import 'package:kelemapp/widget/product/product_list.dart';

class ProductNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductNavigationState();
  }
}

class _ProductNavigationState extends State<ProductNavigation> {
  Category category;
  List<dynamic> subCategories;

  @override
  void initState() {
    super.initState();
    // Will be called when there is a change in the local config.
    global.localConfig.addListener(() {
      // set state for sub categories.
      setState(() {
        category = global.localConfig.selectedCategory;
        subCategories = global.localConfig.selectedCategory.subCategories;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    global.localConfig.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return subCategories == null
        ? Center(
            child: Message(
            icon: CustomIcons.noInternet(),
            message: "No internet",
          ))
        : Column(
            children: <Widget>[
              SearchView(),
              Expanded(
                child: DefaultTabController(
                  length: subCategories.length,
                  child: Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      backgroundColor: Theme.of(context).backgroundColor,
                      elevation: 0.0,
                      title: TabBar(
                          isScrollable: true,
                          tabs: subCategories.map((dynamic subCategory) {
                            return Tab(
                              child: Text(
                                subCategory.toString(),
                                style: TextStyle(color: Color(ColorCustom.GRAY)),
                              ),
                            );
                          }).toList()),
                    ),
                    body: TabBarView(
                        children: subCategories.map((subCategory) {
                      return ProductList(category, subCategory.toString());
                    }).toList()),
                  ),
                ),
              )
            ],
          );
  }
}
