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
  List googleBooks = [];
  String searchBooks = "a";

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
              SearchView(
                onComplete: (String search) {
                  print("search $search");
                  global.localConfig.selectedSearchBook = search;

                  // getBookByQuery(search);
                },
              ),
              Expanded(
                child: DefaultTabController(
                  length: subCategories.length,
                  child: Scaffold(
                    body: SafeArea(
                      child: Column(
                        children: [
                          TabBar(
                              isScrollable: true,
                              tabs: subCategories.map((dynamic subCategory) {
                                return Tab(
                                  child: Text(
                                    subCategory.toString(),
                                    style: TextStyle(color: CustomColor.GRAY),
                                  ),
                                );
                              }).toList()),
                          Expanded(
                            child: TabBarView(
                                children: subCategories.map((subCategory) {
                              print(
                                  "subCategory.toString() ${subCategory.toString()} ");
                              return ProductList(category,
                                  subCategory.toString(), searchBooks ?? "b");
                            }).toList()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
  }
}
