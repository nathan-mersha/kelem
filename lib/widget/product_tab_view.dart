import 'package:flutter/material.dart';
import 'package:kelemapp/global.dart' as global;
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/widget/no_internet.dart';
import 'package:kelemapp/widget/search.dart';

class ProductTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductTabViewState();
  }
}

class _ProductTabViewState extends State<ProductTabView> {
  List<dynamic> subCategories;

  @override
  void initState() {
    super.initState();
    // Will be called when there is a change in the local config.
    global.localConfig.addListener(() {
      // set state for sub categories.
      setState(() {
        subCategories = global.localConfig.selectedCategory.subCategories;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return subCategories == null
        ? Center(
            child: NoInternet(),
          )
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
                      return getProductTabViews(subCategory);
                    }).toList()),
                  ),
                ),
              )
            ],
          );
  }

  Widget getProductTabViews(dynamic subCategory) {
    // Should definetly return a future builder.
    return Center(
      child: Text("Products sub category : ${subCategory.toString()}"),
    );
  }
}
