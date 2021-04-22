import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/config/global.dart';
import 'package:kelemapp/widget/icon/icons.dart';
import 'package:kelemapp/widget/info/message.dart';
import 'package:kelemapp/global.dart' as global;
import 'package:kelemapp/widget/nav/search.dart';
import 'package:kelemapp/widget/product/product_view.dart';

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
  bool _initialProductsLoaded = false;
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
        getProducts().then((List<Product> products) {
          if (products.isNotEmpty) {
            _products.addAll(products);
            setState(() {
              _loading = false;
            });
          }
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
            future:  getProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {


              if (snapshot.connectionState == ConnectionState.done && snapshot.data == null) {
                // Connection terminated and no data available
                return Message(
                  icon: CustomIcons.noInternet(),
                  message: "No internet",
                );
              } else if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                // Got data and connection is done

                List<Product> newProducts = snapshot.data;
                if (newProducts.isNotEmpty && !_initialProductsLoaded) {
                  _products.addAll(newProducts);
                  _initialProductsLoaded = true;
                }

                // Got data here
                return _products.isEmpty
                    ? Message(
                        message: "No $_subCategory ${_category.name}s found",
                        icon: Icon(
                          Icons.whatshot,
                          color: Theme.of(context).primaryColor,
                          size: 45,
                        ),
                      )
                    : GridView.builder(
                        controller: _scrollController,
                        shrinkWrap: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, mainAxisSpacing: 4, childAspectRatio: _childAspectRatio),
                        itemCount: _products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductView(_products[index]);
                        });
              } else {
                return Message(
                  icon: SpinKitFadingFour(
                    color: Theme.of(context).primaryColor,
                  ),
                  message: "loading $_subCategory ${_category.name}s",
                );
              }
            },
          ),
        ),
        _loading && !_noMoreItem
            ? SpinKitThreeBounce(
                color: Theme.of(context).primaryColor,
                size: 20,
              )
            : Container(),
      ],
    );
  }

  Future<List<Product>> getProducts() async {
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

    print("Document snapshot : $documentSnapshot");

    // Assigning the last document snapshot for future query
    if (documentSnapshot.length > 0) {
      _lastDocumentSnapShot = documentSnapshot.last;
      _noMoreItem = false;
    } else {
      _noMoreItem = true;
    }
    int i =0;
    List<Product> products = documentSnapshot.map((DocumentSnapshot documentSnapshot) {
      Product p = Product.toModel(documentSnapshot.data);
      //this is only for test
      if(SearchState.googleBooks!=null && i < SearchState.googleBooks.length){
        p.name= SearchState.googleBooks[i]["volumeInfo"]["title"] ?? p.name;
        p.authorOrManufacturer= SearchState.googleBooks[i]["volumeInfo"]["authors"][0] ?? p.authorOrManufacturer;
        p.description=SearchState.googleBooks[i]["volumeInfo"]["description"] ?? p.description;
        p.image=SearchState.googleBooks[i]["volumeInfo"]["imageLinks"]["smallThumbnail"] ?? p.image;
        i=i+1;
      }
      return p;
    }).toList();

    return products;
  }
}
