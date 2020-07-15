import 'package:kelemapp/model/profile/shop.dart';

/// Defines coupon model [Coupon]

class Coupon {
  /// Defines key values to extract from a map
  static const String COUPON_ID = "couponId";
  static const String NAME = "name";
  static const String QUANTITY = "quantity";
  static const String EXPIRATION_DATE = "expirationDate";
  static const String CODE = "code";
  static const String DESCRIPTION = "description";
  static const String SHOP = "shop"; // Coupon issuer shop
  static const String REVOKED = "revoked"; // Coupon issuer shop
  static const String DISCOUNT_TYPE = "discountType";
  static const String DISCOUNT_VALUE = "discountValue";

  String couponId;
  String name;
  int quantity;
  DateTime expirationDate;
  String code;
  String description;
  Shop shop;
  bool revoked;
  String discountType; // todo : make enum
  double discountValue;

  Coupon({
     this.couponId,
     this.name,
     this.quantity,
     this.expirationDate,
     this.code,
     this.description,
     this.shop,
     this.revoked,
     this.discountType,
     this.discountValue
  });

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Coupon coupon) {
    return {
      COUPON_ID: coupon.couponId,
      NAME: coupon.name,
      QUANTITY: coupon.quantity,
      EXPIRATION_DATE: coupon.expirationDate,
      CODE: coupon.code,
      DESCRIPTION: coupon.description,
      SHOP: Shop.toMap(coupon.shop),
      REVOKED: coupon.revoked,
      DISCOUNT_TYPE: coupon.discountType,
      DISCOUNT_VALUE: coupon.discountValue,
    };
  }

  /// Converts Map to Model
  static Coupon toModel(Map<String, dynamic> map) {
    return Coupon(
      couponId: map[COUPON_ID],
      name: map[NAME],
      quantity: map[QUANTITY],
      expirationDate: map[EXPIRATION_DATE],
      code: map[CODE],
      description: map[DESCRIPTION],
      shop: Shop.toModel(map[SHOP]),
      revoked: map[REVOKED],
      discountType: map[DISCOUNT_TYPE],
      discountValue: map[DISCOUNT_VALUE],
    );
  }

  /// Changes List of Map to List of Model
  static List<Coupon> toModelList(List<Map<String, dynamic>> maps) {
    List<Coupon> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Coupon> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Coupon model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
