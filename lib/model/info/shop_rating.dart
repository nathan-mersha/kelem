import 'package:kelemapp/model/profile/shop.dart';

/// Defines ratingShop model [RatingShop]

class RatingShop {
  static const String COLLECTION_NAME = "shopRating";

  /// Defines key values to extract from a map
  static const String RATING_SHOP_ID = "ratingShopId";
  static const String SHOP = "shop";
  static const String CUMULATIVE = "cumulative";
  static const String RELIABILITY_RATE = "reliabilityRate";
  static const String DELIVERABLE_RATE = "deliverableRate";
  static const String SUPPORT_RATE = "supportRate";
  static const String RICHNESS_RATE = "richnessRate";
  static const String PRICING_RATE = "pricingRate";
  static const String ACTIVITY_RATE = "activityRate";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String ratingShopId;
  Shop shop;
  num cumulative;
  num reliabilityRate;
  num deliverableRate;
  num supportRate;
  num richnessRate;
  num pricingRate;
  num activityRate;
  DateTime firstModified;
  DateTime lastModified;

  RatingShop(
      {this.ratingShopId,
      this.shop,
      this.cumulative,
      this.reliabilityRate,
      this.deliverableRate,
      this.supportRate,
      this.richnessRate,
      this.pricingRate,
      this.activityRate,
      this.firstModified,
      this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(RatingShop ratingShop) {
    return {
      RATING_SHOP_ID: ratingShop.ratingShopId,
      SHOP: ratingShop.shop == null ? null : Shop.toMap(ratingShop.shop),
      CUMULATIVE: ratingShop.cumulative,
      RELIABILITY_RATE: ratingShop.reliabilityRate,
      DELIVERABLE_RATE: ratingShop.deliverableRate,
      SUPPORT_RATE: ratingShop.supportRate,
      RICHNESS_RATE: ratingShop.richnessRate,
      PRICING_RATE: ratingShop.pricingRate,
      ACTIVITY_RATE: ratingShop.activityRate,
      FIRST_MODIFIED: ratingShop.firstModified,
      LAST_MODIFIED: ratingShop.lastModified
    };
  }

  /// Converts Map to Model
  static RatingShop toModel(dynamic map) {
    return RatingShop(
        ratingShopId: map[RATING_SHOP_ID],
        shop: map[SHOP] == null ? Shop() : Shop.toModel(map[SHOP]),
        cumulative: map[CUMULATIVE],
        reliabilityRate: map[RELIABILITY_RATE],
        deliverableRate: map[DELIVERABLE_RATE],
        supportRate: map[SUPPORT_RATE],
        richnessRate: map[RICHNESS_RATE],
        pricingRate: map[PRICING_RATE],
        activityRate: map[ACTIVITY_RATE],
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<RatingShop> toModelList(List<dynamic> maps) {
    List<RatingShop> modelList = [];
    maps.forEach((dynamic map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<RatingShop> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((RatingShop model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
