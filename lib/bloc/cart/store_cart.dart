import 'package:kelemapp/global.dart';
import 'package:kelemapp/model/commerce/cart.dart';
import 'package:kelemapp/model/commerce/order.dart';
import 'package:kelemapp/model/commerce/product.dart';

class StoreCart {
  StoreCart._privateConstructor();
  static final StoreCart _instance = StoreCart._privateConstructor();

  factory StoreCart() {
    return _instance;
  }
  List<Product> _productListData = [];
  Cart _cartListData = Cart();
  void setCartMode(Product product) {
    _cartListData.products = _productListData;
    Amount amount = Amount(
      handlingFee: globalConfig.additionalFee.deliveryFeeValue,
      transactionFee: globalConfig.additionalFee.transactionFeeValue,
      tax: globalConfig.additionalFee.taxFeeValue,
    );
    double subTotal = 0;
    for (int i = 0; i < _productListData.length; i++) {
      subTotal = subTotal +
          (_productListData[i].price * num.parse(_productListData[i].quantity));
    }
    amount.subTotal = subTotal;
    amount.total = amount.subTotal + amount.handlingFee + amount.transactionFee;
    //amount.tax = (globalConfig.additionalFee.taxFeeValue ?? 15 / 100) * amount.total;
    _cartListData.amount = amount;
  }

  void storeCartDetails(Product product) {
    _productListData.add(product);
    setCartMode(product);
    // Cart cart=Cart(products: _productListData);
    // _cartListData.add(cart);
  }

  void removeCartDetails(Product product) {
    for (int i = 0; i < _productListData.length; i++) {
      if (_productListData[i].productId == product.productId) {
        _productListData.removeAt(i);
      }
    }
    setCartMode(product);

    //    _cartListData.products = _productListData;

    // Cart cart=Cart(products: _productListData);
    // _cartListData.add(cart);
  }

  void replaceCartDetails(Product product, index) {
    _productListData.removeAt(index);
    _productListData.insert(index, product);
    setCartMode(product);

    //    _cartListData.products = _productListData;

    // Cart cart=Cart(products: _productListData);
    // _cartListData.add(cart);
  }

  Cart retrieveFoodDetails() {
    return _cartListData;
  }
}
