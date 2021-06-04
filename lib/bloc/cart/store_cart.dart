import 'package:kelemapp/model/commerce/cart.dart';
import 'package:kelemapp/model/commerce/product.dart';

class StoreCart {
  StoreCart._privateConstructor();
  static final StoreCart _instance = StoreCart._privateConstructor();

  factory StoreCart() {
    return _instance;
  }
  List<Product> _productListData = [];
  Cart _cartListData = Cart();

  void storeCartDetails(Product product) {
    _productListData.add(product);
    _cartListData.products = _productListData;
    // Cart cart=Cart(products: _productListData);
    // _cartListData.add(cart);
  }

  void removeCartDetails(Product product) {
    _productListData.remove(product);
    _cartListData.products = _productListData;
    // Cart cart=Cart(products: _productListData);
    // _cartListData.add(cart);
  }

  List<Product> retrieveFoodDetails() {
    return _cartListData.products;
  }
}
