import 'package:flutter/material.dart';
import 'package:kelemapp/global.dart' as global;
import 'package:kelemapp/model/config/global.dart';

class CategoryMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryMenuState();
  }
}

class CategoryMenuState extends State<CategoryMenu> {
  @override
  void initState() {
    super.initState();
    print("Category build called");
    global.globalConfig.addListener(() {
      setState(() {
        print("Global config values changed.");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    print("Category menu build called");
    print("is categories null ? ${global.globalConfig.categories == null}");
    return global.globalConfig.categories == null
        ? IconButton(icon: Icon(Icons.more_vert,color: Colors.white),)
        : PopupMenuButton<String>(
            onSelected: (String result) {
              print("selected result : $result");
            },
            itemBuilder: (BuildContext buildContext) {
              List<PopupMenuEntry<String>> menu = List();

              List<Category> categories = global.globalConfig.categories;
              categories.forEach((Category category) {
                menu.add(PopupMenuItem(
                  value: category.name,
                  child: Text(category.name),
                ));
              });
              return menu;
            },
          );
  }
}
