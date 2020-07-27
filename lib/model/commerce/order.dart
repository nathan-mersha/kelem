import 'package:kelemapp/model/commerce/product.dart';
import 'package:kelemapp/model/profile/user.dart';
import 'package:kelemapp/page/setting/general/payment_and_delivery.dart';

/// Defines order model
class Order {
  /// Defines key values to extract from a map
  static const String ORDER_ID = "orderId";
  static const String PRODUCTS_DELIVERY_STATUS = "productsDeliveryStatus";
  static const String STATUS = "status"; // todo : make enum value
  static const String AMOUNT = "amount";
  static const String NOTE = "note";
  static const String REFUNDED = "refunded"; // When order fails to be delivered
  static const String PAYMENT_AND_DELIVERY_PREFERENCE = "paymentAndDeliveryPreference";
  static const String PRE_PAID = "prePaid";
  static const String USER = "user";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String orderId;
  List<ProductDeliveryStatus> productsDeliveryStatus;
  String status;
  Amount amount;
  String note;
  bool refunded;
  PaymentAndDeliveryPreference paymentAndDeliveryPreference;
  bool prePaid;
  User user;
  DateTime firstModified;
  DateTime lastModified;

  Order(
      {this.orderId,
      this.productsDeliveryStatus,
      this.status,
      this.amount,
      this.note,
      this.refunded,
      this.paymentAndDeliveryPreference,
      this.prePaid,
      this.user,
      this.firstModified,
      this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Order order) {
    return {
      ORDER_ID: order.orderId,
      PRODUCTS_DELIVERY_STATUS: ProductDeliveryStatus.toMapList(order.productsDeliveryStatus),
      STATUS: order.status,
      AMOUNT: Amount.toMap(order.amount),
      NOTE: order.note,
      REFUNDED: order.refunded,
      PAYMENT_AND_DELIVERY_PREFERENCE: PaymentAndDeliveryPreference.toMap(order.paymentAndDeliveryPreference),
      PRE_PAID: order.prePaid,
      USER: order.user,
      FIRST_MODIFIED: order.firstModified,
      LAST_MODIFIED: order.lastModified
    };
  }

  /// Converts Map to Model
  static Order toModel(Map<String, dynamic> map) {
    return Order(
        orderId: map[ORDER_ID],
        productsDeliveryStatus: ProductDeliveryStatus.toModelList(map[PRODUCTS_DELIVERY_STATUS]),
        status: map[STATUS],
        amount: Amount.toModel(map[AMOUNT]),
        note: map[NOTE],
        refunded: map[REFUNDED],
        paymentAndDeliveryPreference: PaymentAndDeliveryPreference.toModel(map[PAYMENT_AND_DELIVERY_PREFERENCE]),
        prePaid: map[PRE_PAID],
        user: map[USER],
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<Order> toModelList(List<Map<String, dynamic>> maps) {
    List<Order> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Order> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Order model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines productDeliveryStatus model
class ProductDeliveryStatus {
  /// Defines key values to extract from a map
  static const String PRODUCT_DELIVERY_STATUS_ID = "productDeliveryStatusId";
  static const String PRODUCT = "product";
  static const String QUANTITY = "quantity";
  static const String STATUS = "status";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String productDeliveryStatusId;
  Product product;
  int quantity;
  String status;
  DateTime firstModified;
  DateTime lastModified;

  ProductDeliveryStatus(
      {this.productDeliveryStatusId, this.product, this.quantity, this.status, this.firstModified, this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(ProductDeliveryStatus productDeliveryStatus) {
    return {
      PRODUCT_DELIVERY_STATUS_ID: productDeliveryStatus.productDeliveryStatusId,
      PRODUCT: Product.toMap(productDeliveryStatus.product),
      QUANTITY: productDeliveryStatus.quantity,
      STATUS: productDeliveryStatus.status,
      FIRST_MODIFIED: productDeliveryStatus.firstModified,
      LAST_MODIFIED: productDeliveryStatus.lastModified
    };
  }

  /// Converts Map to Model
  static ProductDeliveryStatus toModel(Map<String, dynamic> map) {
    return ProductDeliveryStatus(
        productDeliveryStatusId: map[PRODUCT_DELIVERY_STATUS_ID],
        product: Product.toModel(map[PRODUCT]),
        quantity: map[QUANTITY],
        status: map[STATUS],
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<ProductDeliveryStatus> toModelList(List<Map<String, dynamic>> maps) {
    List<ProductDeliveryStatus> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<ProductDeliveryStatus> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((ProductDeliveryStatus model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines amount model
class Amount {
  /// Defines key values to extract from a map
  static const String AMOUNT_ID = "amountId";
  static const String SUB_TOTAL = "subTotal";
  static const String COUPON_DISCOUNT = "couponDiscount";
  static const String HANDLING_FEE = "handlingFee";
  static const String TRANSACTION_FEE = "transactionFee";
  static const String TAX = "tax";
  static const String TOTAL = "total";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String amountId;
  double subTotal;
  double couponDiscount;
  double handlingFee;
  double transactionFee;
  double tax;
  double total;
  DateTime firstModified;
  DateTime lastModified;

  Amount(
      {this.amountId,
      this.subTotal,
      this.couponDiscount,
      this.handlingFee,
      this.transactionFee,
      this.tax,
      this.total,
      this.firstModified,
      this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Amount amount) {
    return {
      AMOUNT_ID: amount.amountId,
      SUB_TOTAL: amount.subTotal,
      COUPON_DISCOUNT: amount.couponDiscount,
      HANDLING_FEE: amount.handlingFee,
      TRANSACTION_FEE: amount.transactionFee,
      TAX: amount.tax,
      TOTAL: amount.total,
      FIRST_MODIFIED: amount.firstModified,
      LAST_MODIFIED: amount.lastModified
    };
  }

  /// Converts Map to Model
  static Amount toModel(Map<String, dynamic> map) {
    return Amount(
      amountId: map[AMOUNT_ID],
      subTotal: map[SUB_TOTAL],
      couponDiscount: map[COUPON_DISCOUNT],
      handlingFee: map[HANDLING_FEE],
      transactionFee: map[TRANSACTION_FEE],
      tax: map[TAX],
      total: map[TOTAL],
      firstModified: map[FIRST_MODIFIED],
      lastModified: map[LAST_MODIFIED],
    );
  }

  /// Changes List of Map to List of Model
  static List<Amount> toModelList(List<Map<String, dynamic>> maps) {
    List<Amount> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Amount> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Amount model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
