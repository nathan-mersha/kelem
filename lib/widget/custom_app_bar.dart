import 'package:flutter/material.dart';
import 'package:kelemapp/global.dart' as global;
import 'package:kelemapp/model/config/global.dart';

class CategoryMenu extends StatefulWidget implements PreferredSizeWidget{
  final String title;
  final bool showCategory;

  CategoryMenu({@required this.title, this.showCategory = false});
  @override
  State<StatefulWidget> createState() {
    return CategoryMenuState();
  }

  @override
  Size get preferredSize => null;
}

class CategoryMenuState extends State<CategoryMenu> {
  GlobalConfig _globalConfig = global.globalConfig;

  @override
  Widget build(BuildContext context) {
    _globalConfig.addListener(() {
      setState(() {
        _globalConfig = global.globalConfig;
      });
    });
    ;
  }

  Widget getCategoryMenu() {
    return _globalConfig == null
        ? Icon(Icons.donut_large)
        : PopupMenuButton<String>(
            onSelected: (String result) {
              print("selected result : $result");
            },
            itemBuilder: (BuildContext buildContext) {
              List<PopupMenuEntry<String>> menu = List();

              List<Category> categories = _globalConfig.categories;
              categories.forEach((Category category) {
                menu.add(PopupMenuItem(
                  child: Text(category.name),
                ));
              });
              return menu;
            },
          );
  }
}
