/// Defines globalConfig model
class GlobalConfig {
  /// Defines key values to extract from a map
  static const String GLOBAL_CONFIG_ID = "globalConfigId";
  static const String ADDITIONAL_FEE = "additionalFee";
  static const String SUBSCRIPTION_PACKAGE = "subscriptionPackages";
  static const String FEATURE_PACKAGE = "featurePackage";
  static const String BANK_CONFIG = "bankConfig";
  static const String FORCE_NEWS_ON_HOME = "forceNewsOnHome";

  String globalConfigId;
  AdditionalFee additionalFee;
  List<SubscriptionPackage> subscriptionPackages;
  FeaturesConfig featuresConfig;
  List<BankConfig> bankConfigs;
  bool forceNewsOnHome;

  GlobalConfig(
      {this.globalConfigId,
      this.additionalFee,
      this.subscriptionPackages,
      this.featuresConfig,
      this.bankConfigs,
      this.forceNewsOnHome});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(GlobalConfig globalConfig) {
    return {
      GLOBAL_CONFIG_ID: globalConfig.globalConfigId,
      ADDITIONAL_FEE: AdditionalFee.toMap(globalConfig.additionalFee),
      SUBSCRIPTION_PACKAGE: SubscriptionPackage.toMapList(globalConfig.subscriptionPackages),
      FEATURE_PACKAGE: FeaturesConfig.toMap(globalConfig.featuresConfig),
      BANK_CONFIG: BankConfig.toMapList(globalConfig.bankConfigs),
      FORCE_NEWS_ON_HOME: globalConfig.forceNewsOnHome
    };
  }

  /// Converts Map to Model
  static GlobalConfig toModel(Map<String, dynamic> map) {
    return GlobalConfig(
        globalConfigId: map[GLOBAL_CONFIG_ID],
        additionalFee: AdditionalFee.toModel(map[ADDITIONAL_FEE]),
        subscriptionPackages: SubscriptionPackage.toModelList(map[SUBSCRIPTION_PACKAGE]),
        featuresConfig: FeaturesConfig.toModel(map[FEATURE_PACKAGE]),
        bankConfigs: BankConfig.toModelList(map[BANK_CONFIG]),
        forceNewsOnHome: map[FORCE_NEWS_ON_HOME]);
  }

  /// Changes List of Map to List of Model
  static List<GlobalConfig> toModelList(List<Map<String, dynamic>> maps) {
    List<GlobalConfig> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<GlobalConfig> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((GlobalConfig model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines additionalFee model
class AdditionalFee {
  /// Defines key values to extract from a map
  static const String ADDITIONAL_FEE_ID = "additionalFeeId";
  static const String TRANSACTION_FEE_TYPE = "transactionFeeType"; // Defines calculation type, flat rate or percentage
  static const String TRANSACTION_FEE_VALUE = "transactionFeeValue";
  static const String DELIVERY_FEE_TYPE = "deliveryFeeType"; // Defines calculation type for delivery fee type, km or flat rate
  static const String DELIVERY_FEE_VALUE = "deliveryFeeValue";

  String additionalFeeId;
  String transactionFeeType;
  double transactionFeeValue;
  String deliveryFeeType;
  double deliveryFeeValue;

  AdditionalFee(
      {this.additionalFeeId, this.transactionFeeType, this.transactionFeeValue, this.deliveryFeeType, this.deliveryFeeValue});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(AdditionalFee additionalFee) {
    return {
      ADDITIONAL_FEE_ID: additionalFee.additionalFeeId,
      TRANSACTION_FEE_TYPE: additionalFee.transactionFeeType,
      TRANSACTION_FEE_VALUE: additionalFee.transactionFeeValue,
      DELIVERY_FEE_TYPE: additionalFee.deliveryFeeType,
      DELIVERY_FEE_VALUE: additionalFee.deliveryFeeValue,
    };
  }

  /// Converts Map to Model
  static AdditionalFee toModel(Map<String, dynamic> map) {
    return AdditionalFee(
      additionalFeeId: map[ADDITIONAL_FEE_ID],
      transactionFeeType: map[TRANSACTION_FEE_TYPE],
      transactionFeeValue: map[TRANSACTION_FEE_VALUE],
      deliveryFeeType: map[DELIVERY_FEE_TYPE],
      deliveryFeeValue: map[DELIVERY_FEE_VALUE],
    );
  }

  /// Changes List of Map to List of Model
  static List<AdditionalFee> toModelList(List<Map<String, dynamic>> maps) {
    List<AdditionalFee> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<AdditionalFee> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((AdditionalFee model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines subscriptionPackage model
class SubscriptionPackage {
  /// Defines key values to extract from a map
  static const String SUBSCRIPTION_PACKAGE_ID = "subscriptionPackageId";
  static const String NAME = "name";
  static const String FEATURES = "features";
  static const String MONTHLY_PRICE = "monthlyPrice";
  static const String YEARLY_PRICE = "yearlyPrice";

  String subscriptionPackageId;
  String name;
  List<String> features;
  double monthlyPrice;
  double yearlyPrice;

  SubscriptionPackage({this.subscriptionPackageId, this.name, this.features, this.monthlyPrice, this.yearlyPrice});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(SubscriptionPackage subscriptionPackage) {
    return {
      SUBSCRIPTION_PACKAGE_ID: subscriptionPackage.subscriptionPackageId,
      NAME: subscriptionPackage.name,
      FEATURES: subscriptionPackage.features,
      MONTHLY_PRICE: subscriptionPackage.monthlyPrice,
      YEARLY_PRICE: subscriptionPackage.yearlyPrice,
    };
  }

  /// Converts Map to Model
  static SubscriptionPackage toModel(Map<String, dynamic> map) {
    return SubscriptionPackage(
      subscriptionPackageId: map[SUBSCRIPTION_PACKAGE_ID],
      name: map[NAME],
      features: map[FEATURES],
      monthlyPrice: map[MONTHLY_PRICE],
      yearlyPrice: map[YEARLY_PRICE],
    );
  }

  /// Changes List of Map to List of Model
  static List<SubscriptionPackage> toModelList(List<Map<String, dynamic>> maps) {
    List<SubscriptionPackage> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<SubscriptionPackage> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((SubscriptionPackage model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines featuresConfig model
class FeaturesConfig {
  /// Defines key values to extract from a map
  static const String FEATURES_CONFIG_ID = "featuresConfigId";
  static const String BUY_CREDIT = "buyCredit";
  static const String WALLET = "wallet";
  static const String TRANSACTIONS = "transactions";
  static const String SHOP = "shop";
  static const String WISH_LIST = "wishList";
  static const String NEWS = "news";
  static const String ABOUT_US = "aboutUs";
  static const String ORDER = "order";
  static const String BEST_SELLERS = "bestSellers"; // If toggled on shows best sellers page
  static const String CASH_OUT = "cashOut"; // If toggled on, supports cash out
  static const String SHOP_DETAIL = "shopDetail"; // If toggled on, shows detail information about the shop
  static const String SHOP_INFORMATION = "shopInformation"; // If toggled on, shows the location of the item
  static const String PAYMENT_METHOD_CASH_ON_DELIVERY =
      "paymentMethodCashOnDelivery"; // If toggled on, shows cash on delivery payment method
  static const String PAYMENT_METHOD_KELEM_WALLET =
      "paymentMethodKelemWallet"; // If toggled on, shows Kelem wallet as a payment method
  static const String PAYMENT_METHOD_HISAB_WALLET =
      "paymentMethodHisabWallet"; // If toggled on, shows Hisab Wallet as a payment method.
  static const String CASH_OUT_SUPPORT_BANKS = "cashOutSupportBanks"; // Contains the list of banks that support cash out methods.
  static const String TIN = "tin"; // If toggled on, show tin input field in shop and when performing payment

  String featuresConfigId;
  bool buyCredit;
  bool wallet;
  bool transactions;
  bool shop;
  bool wishList;
  bool news;
  bool aboutUs;
  bool order;
  bool bestSellers;
  bool cashOut;
  bool shopDetail;
  bool shopInformation;
  bool paymentMethodCashOnDelivery;
  bool paymentMethodKelemWallet;
  bool paymentMethodHisabWallet;
  List<String> cashOutSupportBanks;
  bool tin;

  FeaturesConfig(
      {this.featuresConfigId,
      this.buyCredit,
      this.wallet,
      this.transactions,
      this.shop,
      this.wishList,
      this.news,
      this.aboutUs,
      this.order,
      this.bestSellers,
      this.cashOut,
      this.shopDetail,
      this.shopInformation,
      this.paymentMethodCashOnDelivery,
      this.paymentMethodKelemWallet,
      this.paymentMethodHisabWallet,
      this.cashOutSupportBanks,
      this.tin});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(FeaturesConfig featuresConfig) {
    return {
      FEATURES_CONFIG_ID: featuresConfig.featuresConfigId,
      BUY_CREDIT: featuresConfig.buyCredit,
      WALLET: featuresConfig.wallet,
      TRANSACTIONS: featuresConfig.transactions,
      SHOP: featuresConfig.shop,
      WISH_LIST: featuresConfig.wishList,
      NEWS: featuresConfig.news,
      ABOUT_US: featuresConfig.aboutUs,
      ORDER: featuresConfig.order,
      BEST_SELLERS: featuresConfig.bestSellers,
      CASH_OUT: featuresConfig.cashOut,
      SHOP_DETAIL: featuresConfig.shopDetail,
      SHOP_INFORMATION: featuresConfig.shopInformation,
      PAYMENT_METHOD_CASH_ON_DELIVERY: featuresConfig.paymentMethodCashOnDelivery,
      PAYMENT_METHOD_KELEM_WALLET: featuresConfig.paymentMethodKelemWallet,
      PAYMENT_METHOD_HISAB_WALLET: featuresConfig.paymentMethodHisabWallet,
      CASH_OUT_SUPPORT_BANKS: featuresConfig.cashOutSupportBanks,
      TIN: featuresConfig.tin,
    };
  }

  /// Converts Map to Model
  static FeaturesConfig toModel(Map<String, dynamic> map) {
    return FeaturesConfig(
      featuresConfigId: map[FEATURES_CONFIG_ID],
      buyCredit: map[BUY_CREDIT],
      wallet: map[WALLET],
      transactions: map[TRANSACTIONS],
      shop: map[SHOP],
      wishList: map[WISH_LIST],
      news: map[NEWS],
      aboutUs: map[ABOUT_US],
      order: map[ORDER],
      bestSellers: map[BEST_SELLERS],
      cashOut: map[CASH_OUT],
      shopDetail: map[SHOP_DETAIL],
      shopInformation: map[SHOP_INFORMATION],
      paymentMethodCashOnDelivery: map[PAYMENT_METHOD_CASH_ON_DELIVERY],
      paymentMethodKelemWallet: map[PAYMENT_METHOD_KELEM_WALLET],
      paymentMethodHisabWallet: map[PAYMENT_METHOD_HISAB_WALLET],
      cashOutSupportBanks: map[CASH_OUT_SUPPORT_BANKS],
      tin: map[TIN],
    );
  }

  /// Changes List of Map to List of Model
  static List<FeaturesConfig> toModelList(List<Map<String, dynamic>> maps) {
    List<FeaturesConfig> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<FeaturesConfig> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((FeaturesConfig model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines dialling pattern
class BankConfig {
  /// Defines key values to extract from a map
  static const String BANK_CONFIG_ID = "bankConfigId";
  static const String BANK_NAME = "bankName";
  static const String DEPOSIT_TO_DIALLING_PATTERN = "depositToDiallingPattern";
  static const String KELEM_BANK_ACCOUNT = "kelemBankAccount";

  String bankConfigId;
  String bankName;
  String depositToDiallingPattern;
  String kelemBankAccount;

  BankConfig({this.bankConfigId, this.bankName, this.depositToDiallingPattern, this.kelemBankAccount});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(BankConfig bankConfig) {
    return {
      BANK_CONFIG_ID: bankConfig.bankConfigId,
      BANK_NAME: bankConfig.bankName,
      DEPOSIT_TO_DIALLING_PATTERN: bankConfig.depositToDiallingPattern,
      KELEM_BANK_ACCOUNT: bankConfig.kelemBankAccount,
    };
  }

  /// Converts Map to Model
  static BankConfig toModel(Map<String, dynamic> map) {
    return BankConfig(
      bankConfigId: map[BANK_CONFIG_ID],
      bankName: map[BANK_CONFIG_ID],
      depositToDiallingPattern: map[BANK_CONFIG_ID],
      kelemBankAccount: map[BANK_CONFIG_ID],
    );
  }

  /// Changes List of Map to List of Model
  static List<BankConfig> toModelList(List<Map<String, dynamic>> maps) {
    List<BankConfig> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<BankConfig> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((BankConfig model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines kelemWalletUssdDialPatterns model [KelemWalletUssdDialPatterns]
class KelemWalletUssdDialPatterns {
  /// Defines key values to extract from a map
  static const String KELEM_WALLET_USSD_DIAL_PATTERNS_ID = "kelemWalletUssdDialPatternsId";
  static const String GET_TRANSACTION_HISTORY = "getTranscationHistory";
  static const String CHECK_BALANCE = "checkBalance";
  static const String SEND_CREDIT = "sendCredit";

  String kelemWalletUssdDialPatternsId;
  String getTransactionHistory;
  String checkBalance;
  String sendCredit;

  KelemWalletUssdDialPatterns({this.kelemWalletUssdDialPatternsId, this.getTransactionHistory, this.checkBalance, this.sendCredit});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(KelemWalletUssdDialPatterns kelemWalletUssdDialPatterns) {
    return {
      KELEM_WALLET_USSD_DIAL_PATTERNS_ID: kelemWalletUssdDialPatterns.kelemWalletUssdDialPatternsId,
      GET_TRANSACTION_HISTORY: kelemWalletUssdDialPatterns.getTransactionHistory,
      CHECK_BALANCE: kelemWalletUssdDialPatterns.checkBalance,
      SEND_CREDIT: kelemWalletUssdDialPatterns.sendCredit,
    };
  }

  /// Converts Map to Model
  static KelemWalletUssdDialPatterns toModel(Map<String, dynamic> map) {
    return KelemWalletUssdDialPatterns(
        kelemWalletUssdDialPatternsId: map[KELEM_WALLET_USSD_DIAL_PATTERNS_ID],
        getTransactionHistory: map[GET_TRANSACTION_HISTORY],
        checkBalance: map[CHECK_BALANCE],
        sendCredit: map[SEND_CREDIT]);
  }

  /// Changes List of Map to List of Model
  static List<KelemWalletUssdDialPatterns> toModelList(List<Map<String, dynamic>> maps) {
    List<KelemWalletUssdDialPatterns> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<KelemWalletUssdDialPatterns> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((KelemWalletUssdDialPatterns model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }

}
