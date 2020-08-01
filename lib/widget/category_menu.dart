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
        ? IconButton(icon: Icon(Icons.more_vert,color: Colors.white),onPressed: (){},)
        : PopupMenuButton<Category>(
            onSelected: (Category result) {
              /// setting selected category to a global scope.
              global.localConfig.selectedCategory = result;
            },
            itemBuilder: (BuildContext buildContext) {
              List<PopupMenuEntry<Category>> menu = List();

              List<Category> categories = global.globalConfig.categories;
              categories.forEach((Category category) {
                menu.add(PopupMenuItem(
                  value: category,
                  child: Text(category.name),
                ));
              });
              return menu;
            },
          );
  }
}
