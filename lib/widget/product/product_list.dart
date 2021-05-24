import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kelemapp/api/kelemApi.dart';
import 'package:kelemapp/global.dart' as global;
import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/config/global.dart';
import 'package:kelemapp/model/profile/shop.dart';
import 'package:kelemapp/widget/icon/icons.dart';
import 'package:kelemapp/widget/info/message.dart';
import 'package:kelemapp/widget/product/product_view.dart';

_ProductListState productListState;

class ProductList extends StatefulWidget {
  final Category _category;
  final String _subCategory;
  final String _searchData;

  ProductList(this._category, this._subCategory, this._searchData);

  @override
  State<StatefulWidget> createState() {
    productListState = _ProductListState();
    return productListState;
  }
}

class _ProductListState extends State<ProductList> {
  double _childAspectRatio;
  // total amount of data to be retrieved once.
  static const int PRODUCT_LIMIT = 4;

  List googleBooks = [];
  // true if item is being retrieved from fire store
  bool _loading = false;
  bool _noMoreItem = false;
  bool _initialProductsLoaded = false;
  DocumentSnapshot _lastDocumentSnapShot;
  List<Product> _products = [];
  ScrollController _scrollController = ScrollController();
  String _subCategory;
  Category _category;
  Shop shopOne;
  Shop shopTwo;
  String search;
  List<int> money = [125, 350, 560, 300, 400, 800];
  //add the name of the book you dont want to find here !!!!!!!!!!
  List<String> notFoundList = ["wolf human", "cat"];
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  bool bookNotFound = false;
  @override
  void initState() {
    super.initState();
    shopOne = Shop(
      shopId: "1",
      userId: "user1",
      name: "Book world",
      primaryPhone: "0112345677",
      secondaryPhone: "0112345677",
      email: "bookworld@gmail.com",
      website: "bookworld.com",
      physicalAddress: "Book world",
      coOrdinates: ["23424234242", "234233424242"],
      isVirtual: true,
      isVerified: true,
      subscriptionPackage: "book",
      description: "book world is here",
      category: "book",
      logo: "asd",
      firstModified: DateTime.now(),
      lastModified: DateTime.now(),
    );
    shopTwo = Shop(
      shopId: "2",
      userId: "user2",
      name: "Reliable Educational Materials Supplier PLC",
      primaryPhone: "251911424324",
      secondaryPhone: "2511116631078",
      email: "manmohan.singh74@gmail.com",
      website: "www.reliablebooks.com",
      physicalAddress: "AFOMI Building",
      coOrdinates: ["8.989550", "38.786054"],
      isVirtual: true,
      isVerified: true,
      subscriptionPackage: "book",
      description: "book sa is here",
      category: "book",
      logo: "assets/images/reliable.png",
      firstModified: DateTime.now(),
      lastModified: DateTime.now(),
    );
    _category = widget._category;
    _subCategory = widget._subCategory;
    search = widget._searchData;

    print("widget.searchData ${global.localConfig.selectedSearchBook}");

    _scrollController.addListener(() {
      // Reached at 70% of bottom
      num currentPosition = _scrollController.position.pixels;
      num maxScrollExtent = _scrollController.position.maxScrollExtent * 0.7;
      if (currentPosition == maxScrollExtent) {
        setState(() {
          _loading = true;
        });

        // Retrieving next products and adding to existing list.
        getProducts();
      }
    });

    // listening on global config.
    global.localConfig.addListener(() {
      setState(() {
        // Category value changed from the currently displayed.
        _products.removeRange(0, _products.length);
        _category = global.localConfig.selectedCategory;
        _subCategory = global.localConfig.selectedSubCategory;
        search = global.localConfig.selectedSearchBook;
        print("here  search $search");
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
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data == null) {
                // Connection terminated and no data available
                if (notFoundList.contains(search.toString())) {
                  if (!bookNotFound) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Message(
                          icon: CustomIcons.getHorizontalLoading(),
                          message:
                              "book called \"$search\" not found do you want to request it", //No internet
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              child: Text("yes"),
                              onPressed: () {
                                bookNotFound = true;
                                setState(() {});
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RaisedButton(
                              child: Text("No"),
                              onPressed: () {
                                search = "b";
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Message(
                          icon: CustomIcons.getHorizontalLoading(),
                          message:
                              "book called $search  has been requested it", //No internet
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              child: Text("okay"),
                              onPressed: () {
                                search = "b";
                                bookNotFound = false;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                } else {
                  return Center(
                      child: Message(
                    icon: CustomIcons.noInternet(),
                    message: "No internet",
                  ));
                }
              } else if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                // Got data and connection is done

                List<Product> newProducts = snapshot.data;
                if (newProducts.isNotEmpty) {
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
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            childAspectRatio: _childAspectRatio),
                        itemCount: _products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductView(_products[index]);
                        });
              } else {
                return Message(
                  icon: SpinKitFadingFour(
                    color: Theme.of(context).primaryColor,
                  ),
                  message: "loading ${_subCategory ?? ""} ${_category.name}s",
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
    await getBookByQuery(query: search ?? "b");

    // QuerySnapshot querySnapshot = _lastDocumentSnapShot != null
    //     ? await Firestore.instance
    //         .collection(Product.COLLECTION_NAME)
    //         .where(Product.CATEGORY, isEqualTo: _category.name)
    //         .where(Product.SUB_CATEGORY, isEqualTo: _subCategory)
    //         .limit(PRODUCT_LIMIT)
    //         .orderBy(Product.LAST_MODIFIED)
    //         .startAfterDocument(_lastDocumentSnapShot)
    //         .getDocuments()
    //     // if there is a previous document query begins searching from the last document.
    //     : await Firestore.instance
    //         .collection(Product.COLLECTION_NAME)
    //         .where(Product.CATEGORY, isEqualTo: _category.name)
    //         .where(Product.SUB_CATEGORY, isEqualTo: _subCategory)
    //         .limit(PRODUCT_LIMIT)
    //         .orderBy(Product.LAST_MODIFIED)
    //         .getDocuments();
    //
    // List<DocumentSnapshot> documentSnapshot = querySnapshot.documents;
    //
    // print("Document snapshot : $documentSnapshot");
    //
    // // Assigning the last document snapshot for future query
    // if (documentSnapshot.length > 0) {
    //   _lastDocumentSnapShot = documentSnapshot.last;
    //   _noMoreItem = false;
    // } else {
    //   _noMoreItem = true;
    // }
    // int i =0;
    // List<Product> products = documentSnapshot.map((DocumentSnapshot documentSnapshot) {
    //   Product p = Product.toModel(documentSnapshot.data);
    //   //this is only for test
    //   if(SearchState.googleBooks!=null && i < SearchState.googleBooks.length){
    //     p.name= SearchState.googleBooks[i]["volumeInfo"]["title"] ?? p.name;
    //     p.authorOrManufacturer= SearchState.googleBooks[i]["volumeInfo"]["authors"][0] ?? p.authorOrManufacturer;
    //     p.description=SearchState.googleBooks[i]["volumeInfo"]["description"] ?? p.description;
    //     p.image=SearchState.googleBooks[i]["volumeInfo"]["imageLinks"]["smallThumbnail"] ?? p.image;
    //     i=i+1;
    //   }
    //   return p;
    // }).toList();

    //  return products;

    Random rnd = new Random();
    int numberRund;
    List<Product> products = googleBooks.map((book) {
      numberRund = money[rnd.nextInt(money.length)];
      Product p = Product(
        productId: book["id"],
        name: book["volumeInfo"]["title"] ?? "Could not find title",
        category: "book",
        subCategory: "fiction",
        authorOrManufacturer: book["volumeInfo"]["authors"] != null
            ? book["volumeInfo"]["authors"][0]
            : book["volumeInfo"]["publisher"] ?? "Could not find author",
        price: numberRund,
        regularPrice: numberRund + 10,
        tag: book["volumeInfo"]["categories"] ?? ["Could not find tag"],
        description:
            book["volumeInfo"]["description"] ?? "Could not find description",
        rating: 4,
        reference: book["volumeInfo"]["authors"].toString() ??
            "Could not find reference",
        availableStock: 20,
        image: book["volumeInfo"]["imageLinks"] != null
            ? book["volumeInfo"]["imageLinks"]["smallThumbnail"]
            : null,
        deliverable: true,
        metaData: book["volumeInfo"]["imageLinks"],
        publishedStatus: "published",
        shop: rnd.nextInt(50) % 2 != 0 ? shopOne : shopTwo,
        firstModified: DateTime.now(),
        lastModified: DateTime.now(),
      );
      return p;
    }).toList();
    return products;
  }

  Future getBookByQuery({String query}) async {
    print("query 123 $query");
    if (notFoundList.contains(query)) {
      googleBooks = null;
      return null;
    }
    return await BookAPI.getBooks(query).then((List result) {
      googleBooks = result.isEmpty ? null : result; //
      print("searchResults $googleBooks");
      if (googleBooks != null) {
        return true;
      }
      return false;
    });
  }
}
