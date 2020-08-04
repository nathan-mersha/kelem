import 'package:kelemapp/model/profile/shop.dart';

/// Defines product model
class Product {
  /// Defines key values to extract from a map

  static const String COLLECTION_NAME = "product";

  static const String PRODUCT_ID = "productId";
  static const String NAME = "name";
  static const String CATEGORY = "category";
  static const String SUB_CATEGORY = "subCategory";
  static const String AUTHOR_OR_MANUFACTURER = "authorOrManufacturer";
  static const String PRICE = "price";
  static const String REGULAR_PRICE = "regularPrice";
  static const String TAG = "tag";
  static const String DESCRIPTION = "description";
  static const String RATING = "rating";
  static const String REFERENCE = "reference";
  static const String AVAILABLE_STOCK = "availableStock";
  static const String IMAGE = "image";
  static const String DELIVERABLE = "deliverable";
  static const String META_DATA = "metaData";
  static const String PUBLISHED_STATUS = "publishedStatus";
  static const String SHOP = "shop";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String productId;
  String name;
  String category;
  String subCategory;
  String authorOrManufacturer;
  num price;
  num regularPrice;
  List<dynamic> tag;
  String description;
  num rating;
  String reference;
  num availableStock;
  String image;
  bool deliverable;
  dynamic metaData;
  String publishedStatus;
  Shop shop;
  DateTime firstModified;
  DateTime lastModified;

  Product(
      {this.productId,
      this.name,
      this.category,
      this.subCategory,
      this.authorOrManufacturer,
      this.price,
      this.regularPrice,
      this.tag,
      this.description,
      this.rating,
      this.reference,
      this.availableStock,
      this.image,
      this.deliverable,
      this.metaData,
      this.publishedStatus,
      this.shop,
      this.firstModified,
      this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Product product) {
    return {
      PRODUCT_ID: product.productId,
      NAME: product.name,
      CATEGORY: product.category,
      SUB_CATEGORY: product.subCategory,
      AUTHOR_OR_MANUFACTURER: product.authorOrManufacturer,
      PRICE: product.price,
      REGULAR_PRICE: product.regularPrice,
      TAG: product.tag,
      DESCRIPTION: product.description,
      RATING: product.rating,
      REFERENCE: product.reference,
      AVAILABLE_STOCK: product.availableStock,
      IMAGE: product.image,
      DELIVERABLE: product.deliverable,
      META_DATA: product.metaData,
      PUBLISHED_STATUS: product.publishedStatus,
      SHOP: product.shop == null ? null : Shop.toMap(product.shop),
      FIRST_MODIFIED: product.firstModified,
      LAST_MODIFIED: product.lastModified
    };
  }

  /// Converts Map to Model
  static Product toModel(dynamic map) {
    return Product(
        productId: map[PRODUCT_ID],
        name: map[NAME],
        category: map[CATEGORY],
        subCategory: map[SUB_CATEGORY],
        authorOrManufacturer: map[AUTHOR_OR_MANUFACTURER],
        price: map[PRICE],
        regularPrice: map[REGULAR_PRICE],
        tag: map[TAG],
        description: map[DESCRIPTION],
        rating: map[RATING],
        reference: map[REFERENCE],
        availableStock: map[AVAILABLE_STOCK],
        image: map[IMAGE],
        deliverable: map[DELIVERABLE],
        metaData: map[META_DATA],
        publishedStatus: map[PUBLISHED_STATUS],
        shop: map[SHOP] == null ? Shop() : Shop.toModel(map[SHOP]),
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<Product> toModelList(List<dynamic> maps) {
    List<Product> modelList = [];
    maps.forEach((dynamic map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Product> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Product model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
