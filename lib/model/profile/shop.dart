/// Defines shop model
class Shop {
  /// Defines key values to extract from a map
  static const String SHOP_ID = "shopId";
  static const String USER_ID = "userId";
  static const String NAME = "name";
  static const String PRIMARY_PHONE = "primaryPhone";
  static const String SECONDARY_PHONE = "secondaryPhone";
  static const String EMAIL = "email";
  static const String WEBSITE = "website";
  static const String PHYSICAL_ADDRESS = "physicalAddress";
  static const String CO_ORDINATES = "coOrdinates";
  static const String IS_VIRTUAL = "isVirtual";
  static const String IS_VERIFIED = "isVerified";
  static const String SUBSCRIPTION_PACKAGE = "subscriptionPackage";
  static const String DESCRIPTION = "description";
  static const String CATEGORY = "category";
  static const String LOGO = "logo";

  String shopId;
  String userId;
  String name;
  String primaryPhone;
  String secondaryPhone;
  String email;
  String website;
  String physicalAddress;
  List<String> coOrdinates;
  bool isVirtual;
  bool isVerified;
  String subscriptionPackage;
  String description;
  String category;
  dynamic logo;

  Shop(
      {this.shopId,
      this.userId,
      this.name,
      this.primaryPhone,
      this.secondaryPhone,
      this.email,
      this.website,
      this.physicalAddress,
      this.coOrdinates,
      this.isVirtual,
      this.isVerified,
      this.subscriptionPackage,
      this.description,
      this.category,
      this.logo});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Shop shop) {
    return {
      SHOP_ID: shop.shopId,
      USER_ID: shop.userId,
      NAME: shop.name,
      PRIMARY_PHONE: shop.primaryPhone,
      SECONDARY_PHONE: shop.secondaryPhone,
      EMAIL: shop.email,
      WEBSITE: shop.website,
      PHYSICAL_ADDRESS: shop.physicalAddress,
      CO_ORDINATES: shop.coOrdinates,
      IS_VIRTUAL: shop.isVirtual,
      IS_VERIFIED: shop.isVerified,
      SUBSCRIPTION_PACKAGE: shop.subscriptionPackage,
      DESCRIPTION: shop.description,
      CATEGORY: shop.category,
      LOGO: shop.logo,
    };
  }

  /// Converts Map to Model
  static Shop toModel(Map<String, dynamic> map) {
    return Shop(
      shopId: map[SHOP_ID],
      userId: map[USER_ID],
      name: map[NAME],
      primaryPhone: map[PRIMARY_PHONE],
      secondaryPhone: map[SECONDARY_PHONE],
      email: map[EMAIL],
      website: map[WEBSITE],
      physicalAddress: map[PHYSICAL_ADDRESS],
      coOrdinates: map[CO_ORDINATES],
      isVirtual: map[IS_VIRTUAL],
      isVerified: map[IS_VERIFIED],
      subscriptionPackage: map[SUBSCRIPTION_PACKAGE],
      description: map[DESCRIPTION],
      category: map[CATEGORY],
      logo: map[LOGO],
    );
  }

  /// Changes List of Map to List of Model
  static List<Shop> toModelList(List<Map<String, dynamic>> maps) {
    List<Shop> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Shop> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Shop model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
