import 'package:kelemapp/model/commerce/product.dart';

class StoreCart {
  StoreCart._privateConstructor();
  static final StoreCart _instance = StoreCart._privateConstructor();

  factory StoreCart() {
    return _instance;
  }
  List<Product> _productListData = [];
// List<Cart> _cartListData=[];

  void storeCartDetails(Product product) {
    _productListData.add(product);
    // Cart cart=Cart(products: _productListData);
    // _cartListData.add(cart);
  }

  void removeCartDetails(Product product) {
    _productListData.remove(product);
    // Cart cart=Cart(products: _productListData);
    // _cartListData.add(cart);
  }

  List<Product> retrieveFoodDetails() {
    return _productListData;
  }
}
