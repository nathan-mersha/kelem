import 'package:flutter/material.dart';
import 'package:kelemapp/rsr/theme/main_theme.dart';
import 'package:kelemapp/widget/loading.dart';
import 'package:kelemapp/widget/menu.dart';
import 'package:kelemapp/widget/no_internet.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: Menu.getAppBar(context, "Home"),
      drawer: Menu.getSideDrawer(context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: MainTheme.getPagePadding(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Card(
              child: TextFormField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(left: 15,),
                    hintText: "search",
                    labelText: "",
                    isDense: true,
                ),
                maxLines: 1,
                autocorrect: true,
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Container(
                margin: EdgeInsets.only(top: 65),
                child: FutureBuilder(
                  future: getProducts(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> projectSnap) {
                    if (projectSnap.connectionState == ConnectionState.none && projectSnap.hasData == null) {
                      return Loading();
                    } else if (projectSnap.data != null) {
                      if (projectSnap.data == true) {
//                        return GridView.builder(
//                            shrinkWrap: false,
//                            gridDelegate:
//                            SliverGridDelegateWithFixedCrossAxisCount(
//                                crossAxisCount: 3,
//                                mainAxisSpacing: 8,
//                                childAspectRatio: 0.6),
//                            itemCount: 0, // todo : make products.length
//                            itemBuilder: (BuildContext context, int index) {
//                              return Container();
////                              return ProductView(products[index]);
//                            });
                        return NoInternet(
                          onRetry: () {},
                        );
                      } else {
                        print("here 2");
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            NoInternet(
                              onRetry: () {
                                setState(() {
                                  getProducts();
                                });
                              },
                            ),
                          ],
                        );
                      }
                    } else {
                      print("here 3");
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Loading(),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> getProducts() {
    return Future.value(true);
  }
}
