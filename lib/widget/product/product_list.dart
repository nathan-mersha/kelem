import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/config/global.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/widget/info/loading.dart';

class ProductList extends StatefulWidget {
  final Category _category;
  final String _subCategory;

  ProductList(this._category, this._subCategory);

  @override
  State<StatefulWidget> createState() {
    return _ProductListState();
  }
}

class _ProductListState extends State<ProductList> {
  // total amount of data to be retrieved once.
  static const int PRODUCT_LIMIT = 12;

  // true if item is being retrieved from fire store
  bool _loading = false; // todo : use flag to display loading animation at the bottom of the screen
  DocumentSnapshot _lastDocumentSnapShot;
  List<Product> _products = [];
  ScrollController _scrollController = new ScrollController();
  String _subCategory;
  Category _category;

  @override
  void initState() {
    super.initState();
    _category = widget._category;
    _subCategory = widget._subCategory;

//    _scrollController.addListener(() {
//      // Reached at 85% of bottom
//      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent * 0.85) {
//        print("Reached at the bottom");
//        setState(() {
//          _loading = true;
//        });
//
//        // Retrieving next products and adding to existing list.
//        getProducts().then((List<Product> nextProducts){
//          setState(() {
//            _loading = false;
//            _products.addAll(nextProducts);
//          });
//        });
//
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
    // todo put query for first product
    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder(
            future: getProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print("data -------------- : ${snapshot.data}");
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData == null) {
                // Connection terminated and no data available
                // todo : respond with no data message;
                print("1---------");
                return Center(child: Text("Connection state : done, and no data"));
              } else if (snapshot.connectionState == ConnectionState.active && snapshot.hasData == null) {
                // Still loading
                // todo : respond with loading message;
                return Center(child: Text("Connection state : active and no data"));
              } else if (snapshot.data != null) {
                // Got data here

                print("Got data ---------------------- ");
                print(snapshot.data);
                return ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (BuildContext context, int index) {
                    // todo : Replace product view thumbnail with the temp holder

                    // todo : Add loading message if retrieving product is not completed.
                    return Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 60),
                        child: Column(
                          children: <Widget>[
                            Text(_products[index].name),
//                        Text(_products[index].authorOrManufacturer),
                            Text(_products[index].subCategory)
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                // todo : respond with loading message.
                return Loading(
                  message: "loading from last",
                );
              }
            },
          ),
        ),
        _loading
            ? SpinKitThreeBounce(
                color: Color(ColorCustom.GRAY),
              )
            : Container()
      ],
    );
  }

  Future<bool> getProducts() async {
    // todo : should order by recent

    QuerySnapshot querySnapshot = _lastDocumentSnapShot == null
        ? await Firestore.instance
            .collection(Product.COLLECTION_NAME)
            .where(Product.CATEGORY, isEqualTo: _category.name)
            .where(Product.SUB_CATEGORY, isEqualTo: _subCategory)
            .limit(PRODUCT_LIMIT)
            .getDocuments()
        : await Firestore.instance
            .collection(Product.COLLECTION_NAME)
            .where(Product.CATEGORY, isEqualTo: _category.name)
            .where(Product.SUB_CATEGORY, isEqualTo: _subCategory)
            .limit(PRODUCT_LIMIT)
            .startAfterDocument(_lastDocumentSnapShot)
            .getDocuments();

    List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
    _lastDocumentSnapShot = documentSnapshot.last; // Assigning the last document snapshot for future query

    List<Product> products = documentSnapshot.map((DocumentSnapshot documentSnapshot) {
      Product p = Product.toModel(documentSnapshot.data);
      return p;
    }).toList();

    _products.addAll(products);

    return true;
  }
}
