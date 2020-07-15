import 'package:kelemapp/model/profile/shop.dart';

/// Defines ratingShop model [RatingShop]

class RatingShop {
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

  String ratingShopId;
  Shop shop;
  double cumulative;
  double reliabilityRate;
  double deliverableRate;
  double supportRate;
  double richnessRate;
  double pricingRate;
  double activityRate;

  RatingShop(
      {this.ratingShopId,
      this.shop,
      this.cumulative,
      this.reliabilityRate,
      this.deliverableRate,
      this.supportRate,
      this.richnessRate,
      this.pricingRate,
      this.activityRate});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(RatingShop ratingShop) {
    return {
      RATING_SHOP_ID: ratingShop.ratingShopId,
      SHOP: Shop.toMap(ratingShop.shop),
      CUMULATIVE: ratingShop.cumulative,
      RELIABILITY_RATE: ratingShop.reliabilityRate,
      DELIVERABLE_RATE: ratingShop.deliverableRate,
      SUPPORT_RATE: ratingShop.supportRate,
      RICHNESS_RATE: ratingShop.richnessRate,
      PRICING_RATE: ratingShop.pricingRate,
      ACTIVITY_RATE: ratingShop.activityRate,
    };
  }

  /// Converts Map to Model
  static RatingShop toModel(Map<String, dynamic> map) {
    return RatingShop(
      ratingShopId: map[RATING_SHOP_ID],
      shop: map[SHOP],
      cumulative: map[CUMULATIVE],
      reliabilityRate: map[RELIABILITY_RATE],
      deliverableRate: map[DELIVERABLE_RATE],
      supportRate: map[SUPPORT_RATE],
      richnessRate: map[RICHNESS_RATE],
      pricingRate: map[PRICING_RATE],
      activityRate: map[ACTIVITY_RATE],
    );
  }

  /// Changes List of Map to List of Model
  static List<RatingShop> toModelList(List<Map<String, dynamic>> maps) {
    List<RatingShop> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
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
