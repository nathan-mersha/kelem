import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/config/global.dart';
import 'package:kelemapp/rsr/theme/color.dart';
import 'package:kelemapp/widget/info/loading.dart';
import 'package:kelemapp/widget/info/no_internet.dart';
import 'package:kelemapp/widget/product/product_placeholder.dart';
import 'package:kelemapp/global.dart' as global;

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
  double _childAspectRatio;
  // total amount of data to be retrieved once.
  static const int PRODUCT_LIMIT = 4;

  // true if item is being retrieved from fire store
  bool _loading = false;
  bool _noMoreItem = false;
  DocumentSnapshot _lastDocumentSnapShot;
  List<Product> _products = [];
  ScrollController _scrollController = ScrollController();
  String _subCategory;
  Category _category;

  @override
  void initState() {
    super.initState();
    _category = widget._category;
    _subCategory = widget._subCategory;

    _scrollController.addListener(() {
      // Reached at 70% of bottom
      num currentPosition = _scrollController.position.pixels;
      num maxScrollExtent = _scrollController.position.maxScrollExtent * 0.7;
      if (currentPosition == maxScrollExtent) {
        setState(() {
          _loading = true;
        });

        // Retrieving next products and adding to existing list.
        getProducts().then((bool loaded) {
          setState(() {
            _loading = false;
          });
        });
      }
    });

    // listening on global config.
    global.localConfig.addListener(() {
      setState(() {
        // Category value changed from the currently displayed.
        _products.removeRange(0, _products.length);
        _category = global.localConfig.selectedCategory;
        _subCategory = global.localConfig.selectedSubCategory;

      });
    });
  }


  @override
  Widget build(BuildContext context) {
    _childAspectRatio = widget._category.name == "book" ? 0.6 : 1;
    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder(
            future: getProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData == null) {
                // Connection terminated and no data available
                return NoInternet();
              } else if (snapshot.data != null) {
                // Got data here
                return GridView.builder(
                    controller: _scrollController,
                    shrinkWrap: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisSpacing: 8, childAspectRatio: _childAspectRatio),
                    itemCount: _products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductPlaceholder(_products[index]);
                    });
              } else {
                // todo : respond with loading message.
                return Loading(
                  message: "loading $_subCategory",
                );
              }
            },
          ),
        ),
        _loading && !_noMoreItem
            ? SpinKitThreeBounce(
                color: Color(ColorCustom.GRAY),
                size: 20,
              )
            : Container(),
      ],
    );
  }

  Future<bool> getProducts() async {
    QuerySnapshot querySnapshot = _lastDocumentSnapShot != null
        ? await Firestore.instance
            .collection(Product.COLLECTION_NAME)
            .where(Product.CATEGORY, isEqualTo: _category.name)
            .where(Product.SUB_CATEGORY, isEqualTo: _subCategory)
            .limit(PRODUCT_LIMIT)
            .orderBy(Product.LAST_MODIFIED)
            .startAfterDocument(_lastDocumentSnapShot)
            .getDocuments()
        // if there is a previous document query begins searching from the last document.
        : await Firestore.instance
            .collection(Product.COLLECTION_NAME)
            .where(Product.CATEGORY, isEqualTo: _category.name)
            .where(Product.SUB_CATEGORY, isEqualTo: _subCategory)
            .limit(PRODUCT_LIMIT)
            .orderBy(Product.LAST_MODIFIED)
            .getDocuments();

    List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;

    // Assigning the last document snapshot for future query
    if (documentSnapshot.length > 0) {
      _lastDocumentSnapShot = documentSnapshot.last;
      _noMoreItem = false;
    } else {
      _noMoreItem = true;
    }

    // Adding products if there is still available in fire store.
    if (!_noMoreItem) {
      List<Product> products = documentSnapshot.map((DocumentSnapshot documentSnapshot) {
        Product p = Product.toModel(documentSnapshot.data);
        return p;
      }).toList();
      _products.addAll(products);
    }

    return true;
  }
}
