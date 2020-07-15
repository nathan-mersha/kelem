import 'package:kelemapp/model/commerce/order.dart';
import 'package:kelemapp/model/commerce/product.dart';

class Cart {
  /// Defines key values to extract from a map
  static const String CART_ID = "cartId";
  static const String PRODUCTS = "products";
  static const String AMOUNT = "amount";

  String cartId;
  List<Product> products;
  Amount amount;

  Cart({
    this.cartId,
    this.products,
    this.amount
  });

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Cart cart) {
    return {
      CART_ID: cart.cartId,
      PRODUCTS: Product.toMapList(cart.products),
      AMOUNT: Amount.toMap(cart.amount),
    };
  }

  /// Converts Map to Model
  static Cart toModel(Map<String, dynamic> map) {
    return Cart(
      cartId: map[CART_ID],
      products: Product.toModelList(map[PRODUCTS]),
      amount: Amount.toModel(map[AMOUNT]),
    );
  }

  /// Changes List of Map to List of Model
  static List<Cart> toModelList(List<Map<String, dynamic>> maps) {
    List<Cart> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Cart> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Cart model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
