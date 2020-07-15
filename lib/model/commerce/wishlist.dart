import 'package:kelemapp/model/profile/user.dart';

/// Defines wishList model
class WishList {

  /// Defines key values to extract from a map
  static const String WISH_LIST_ID = "wishListId";
  static const String USER = "user";
  static const String WISHES = "wishes";
  static const String VISIBILITY = "visibility";

  String wishListId;
  User user;
  List<Wish> wishes;
  bool visibility;

  WishList({
    this.wishListId,
    this.user,
    this.wishes,
    this.visibility
  });

  /// Converts Model to Map
  static Map<String, dynamic> toMap(WishList wishList) {
    return {
      WISH_LIST_ID: wishList.wishListId,
      USER: User.toMap(wishList.user),
      WISHES: Wish.toMapList(wishList.wishes),
      VISIBILITY: wishList.visibility,
    };
  }

  /// Converts Map to Model
  static WishList toModel(Map<String, dynamic> map) {
    return WishList(
      wishListId: map[WISH_LIST_ID],
      user: User.toModel(map[USER]),
      wishes: Wish.toModelList(map[WISHES]),
      visibility: map[VISIBILITY]
    );
  }

  /// Changes List of Map to List of Model
  static List<WishList> toModelList(List<Map<String, dynamic>> maps) {
    List<WishList> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<WishList> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((WishList model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines wish model
class Wish {
  static const String WISH_ID = "WISH_ID";
  static const String PRODUCT_ID = "PRODUCT_ID";
  static const String STATUS = "STATUS";
  static const String FULFILLED_BY = "FULFLILLED_BY";

  String wishId;
  String productId;
  String status;
  String fulfilledBy;

  Wish({
    this.wishId,
    this.productId,
    this.status,
    this.fulfilledBy
  });

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Wish wishList) {
    return {
      WISH_ID: wishList.wishId,
      PRODUCT_ID: wishList.productId,
      STATUS: wishList.status,
      FULFILLED_BY: wishList.fulfilledBy,
    };
  }

  /// Converts Map to Model
  static Wish toModel(Map<String, dynamic> map) {
    return Wish(
      wishId: map[WISH_ID],
      productId : map[PRODUCT_ID],
      status : map[STATUS],
      fulfilledBy : map[FULFILLED_BY]
    );
  }

  /// Changes List of Map to List of Model
  static List<Wish> toModelList(List<Map<String, dynamic>> maps) {
    List<Wish> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Wish> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Wish model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }

}
