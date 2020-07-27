import 'package:kelemapp/model/commerce/transaction.dart';

/// Defines top level user model
class User {
  static const String USER_ID = "userId";
  static const String USER_NAME = "userName";
  static const String DISPLAY_NAME = "displayName";
  static const String EMAIL = "email";
  static const String PHONE_NUMBER = "phoneNumber";
  static const String IS_EMAIL_VERIFIED = "isEmailVerified";
  static const String PROFILE_PICTURE = "profilePicture";
  static const String GENDER = "gender";
  static const String LAST_SEEN = "lastSeen";
  static const String MEMBERSHIP_PACKAGE = "membershipPackage";
  static const String BANNED = "banned";
  static const String PAYMENT_PREFERENCE = "paymentPreference";
  static const String GENERAL_SETTINGS = "generalSettings";
  static const String CASH_OUT_PREFERENCE = "cashOutPreference";
  static const String WALLET = "wallet";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String userId;
  String userName;
  String displayName;
  String email;
  String phoneNumber;
  bool isEmailVerified;
  String profilePicture;
  String gender;
  DateTime lastSeen;
  String memberShipPackage;
  bool banned;
  PaymentAndDeliveryPreference paymentPreference;
  GeneralSettings generalSettings;
  CashOutPreference cashOutPreference;
  Wallet wallet;
  DateTime firstModified;
  DateTime lastModified;

  User(
      {this.userId,
      this.userName,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.isEmailVerified,
      this.profilePicture,
      this.gender,
      this.lastSeen,
      this.memberShipPackage,
      this.banned,
      this.paymentPreference,
      this.generalSettings,
      this.cashOutPreference,
      this.wallet,
      this.firstModified,
      this.lastModified});

  /// Converts User to Map
  static Map<String, dynamic> toMap(User user) {
    return {
      USER_ID: user.userId,
      USER_NAME: user.userName,
      DISPLAY_NAME: user.displayName,
      EMAIL: user.email,
      PHONE_NUMBER: user.phoneNumber,
      IS_EMAIL_VERIFIED: user.isEmailVerified,
      PROFILE_PICTURE: user.profilePicture,
      GENDER: user.gender,
      LAST_SEEN: user.lastSeen,
      MEMBERSHIP_PACKAGE: user.memberShipPackage,
      BANNED: user.banned,
      PAYMENT_PREFERENCE: PaymentAndDeliveryPreference.toMap(user.paymentPreference),
      GENERAL_SETTINGS: GeneralSettings.toMap(user.generalSettings),
      CASH_OUT_PREFERENCE: CashOutPreference.toMap(user.cashOutPreference),
      WALLET: Wallet.toMap(user.wallet),
      FIRST_MODIFIED: user.firstModified,
      LAST_MODIFIED: user.lastModified
    };
  }

  /// Converts Map to User
  static User toModel(Map<String, dynamic> map) {
    return User(
        userId: map[USER_ID],
        userName: map[USER_NAME],
        displayName: map[DISPLAY_NAME],
        email: map[EMAIL],
        phoneNumber: map[PHONE_NUMBER],
        isEmailVerified: map[IS_EMAIL_VERIFIED],
        profilePicture: map[PROFILE_PICTURE],
        gender: map[GENDER],
        lastSeen: map[LAST_SEEN],
        memberShipPackage: map[MEMBERSHIP_PACKAGE],
        banned: map[BANNED],
        paymentPreference: PaymentAndDeliveryPreference.toModel(map[PAYMENT_PREFERENCE]),
        generalSettings: GeneralSettings.toModel(map[GENERAL_SETTINGS]),
        cashOutPreference: CashOutPreference.toModel(map[CASH_OUT_PREFERENCE]),
        wallet: Wallet.toModel(map[WALLET]),
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<User> toModelList(List<Map<String, dynamic>> maps) {
    List<User> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<User> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((User model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines User's Payment preference
class PaymentAndDeliveryPreference {
  static const String PRIMARY_METHOD = "primaryMethod";
  static const String CUSTOMER_NAME = "customerName";
  static const String CUSTOMER_PHONE_NUMBER = "customerPhoneNumber";
  static const String DELIVERY_ADDRESS = "deliveryAddress";
  static const String DELIVERY_DETAIL = "deliveryDetail";
  static const String CUSTOMER_REPUTATION = "customerReputation";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String primaryMethod;
  String customerName;
  String customerPhoneNumber;
  String deliveryAddress;
  String deliveryDetail;
  String customerReputation;
  DateTime firstModified;
  DateTime lastModified;

  PaymentAndDeliveryPreference(
      {this.primaryMethod,
      this.customerName,
      this.customerPhoneNumber,
      this.deliveryAddress,
      this.deliveryDetail,
      this.customerReputation,
      this.firstModified,
      this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(PaymentAndDeliveryPreference paymentPreference) {
    return {
      PRIMARY_METHOD: paymentPreference.primaryMethod,
      CUSTOMER_NAME: paymentPreference.customerName,
      CUSTOMER_PHONE_NUMBER: paymentPreference.customerPhoneNumber,
      DELIVERY_ADDRESS: paymentPreference.deliveryAddress,
      DELIVERY_DETAIL: paymentPreference.deliveryDetail,
      CUSTOMER_REPUTATION: paymentPreference.customerReputation,
      FIRST_MODIFIED: paymentPreference.firstModified,
      LAST_MODIFIED: paymentPreference.lastModified
    };
  }

  /// Converts Map to Model
  static PaymentAndDeliveryPreference toModel(Map<String, dynamic> map) {
    return PaymentAndDeliveryPreference(
        primaryMethod: map[PRIMARY_METHOD],
        customerName: map[CUSTOMER_NAME],
        customerPhoneNumber: map[CUSTOMER_PHONE_NUMBER],
        deliveryAddress: map[DELIVERY_ADDRESS],
        deliveryDetail: map[DELIVERY_DETAIL],
        customerReputation: map[CUSTOMER_REPUTATION],
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<PaymentAndDeliveryPreference> toModelList(List<Map<String, dynamic>> maps) {
    List<PaymentAndDeliveryPreference> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<PaymentAndDeliveryPreference> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((PaymentAndDeliveryPreference model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines user's general settings
class GeneralSettings {
  /// Defines key values to extract from a map
  static const String LANGUAGE = "language";
  static const String SHOW_GENERAL_NOTIFICATIONS = "showGeneralNotifications";
  static const String SHOW_ITEM_NOTIFICATIONS = "showItemNotifications";
  static const String SHOW_NEWS_NOTIFICATIONS = "showNewsNotifications";
  static const String NEWS_PREFERENCES = "newsPreferences";
  static const String SHOW_NEWS_IN_HOME = "showNewsInHome";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String language;
  bool showGeneralNotifications;
  bool showItemNotifications;
  bool showNewsNotifications;
  List<String> newsPreferences;
  bool showNewsInHome;
  DateTime firstModified;
  DateTime lastModified;

  GeneralSettings(
      {this.language,
      this.showGeneralNotifications,
      this.showItemNotifications,
      this.showNewsNotifications,
      this.newsPreferences,
      this.showNewsInHome,
      this.firstModified,
      this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(GeneralSettings generalSettings) {
    return {
      LANGUAGE: generalSettings.language,
      SHOW_GENERAL_NOTIFICATIONS: generalSettings.showGeneralNotifications,
      SHOW_ITEM_NOTIFICATIONS: generalSettings.showItemNotifications,
      SHOW_NEWS_NOTIFICATIONS: generalSettings.showNewsNotifications,
      NEWS_PREFERENCES: generalSettings.newsPreferences,
      SHOW_NEWS_IN_HOME: generalSettings.showNewsInHome,
      FIRST_MODIFIED: generalSettings.firstModified,
      LAST_MODIFIED: generalSettings.lastModified
    };
  }

  /// Converts Map to Model
  static GeneralSettings toModel(Map<String, dynamic> map) {
    return GeneralSettings(
        language: map[LANGUAGE],
        showGeneralNotifications: map[SHOW_GENERAL_NOTIFICATIONS],
        showItemNotifications: map[SHOW_ITEM_NOTIFICATIONS],
        showNewsNotifications: map[SHOW_NEWS_NOTIFICATIONS],
        newsPreferences: map[NEWS_PREFERENCES],
        showNewsInHome: map[SHOW_NEWS_IN_HOME],
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<GeneralSettings> toModelList(List<Map<String, dynamic>> maps) {
    List<GeneralSettings> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<GeneralSettings> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((GeneralSettings model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines user's cash out preference
class CashOutPreference {
  /// Defines key values to extract from a map
  static const String BANK_NAME = "bankName";
  static const String ACCOUNT_NUMBER = "accountNumber";
  static const String ACCOUNT_HOLDER_NAME = "accountHolderName";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String bankName;
  String accountNumber;
  String accountHolderName;
  DateTime firstModified;
  DateTime lastModified;

  CashOutPreference({this.bankName, this.accountNumber, this.accountHolderName, this.firstModified, this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(CashOutPreference cashOutPreference) {
    return {
      BANK_NAME: cashOutPreference.bankName,
      ACCOUNT_NUMBER: cashOutPreference.accountNumber,
      ACCOUNT_HOLDER_NAME: cashOutPreference.accountHolderName,
      FIRST_MODIFIED: cashOutPreference.firstModified,
      LAST_MODIFIED: cashOutPreference.lastModified
    };
  }

  /// Converts Map to Model
  static CashOutPreference toModel(Map<String, dynamic> map) {
    return CashOutPreference(
        bankName: map[BANK_NAME],
        accountNumber: map[ACCOUNT_NUMBER],
        accountHolderName: map[ACCOUNT_HOLDER_NAME],
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<CashOutPreference> toModelList(List<Map<String, dynamic>> maps) {
    List<CashOutPreference> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<CashOutPreference> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((CashOutPreference model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines user's wallet
class Wallet {
  /// Defines key values to extract from a map
  static const String WALLET_ID = "walletId";
  static const String ACCOUNT_NUMBER = "accountNumber";
  static const String AVAILABLE_CREDIT = "availableCredit";
  static const String RECENT_TRANSACTIONS = "recentTransactions";
  static const String ANONYMOUS = "anonymous";
  static const String PASSWORD = "password";
  static const String LOCKED = "locked";
  static const String RETRY_COUNT = "retryCount";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String walletId;
  String accountNumber;
  double availableCredit;
  List<Transaction> recentTransactions; // recent 20 transactions
  bool anonymous;
  String password;
  bool locked;
  int retryCount;
  DateTime firstModified;
  DateTime lastModified;

  Wallet(
      {this.walletId,
      this.accountNumber,
      this.availableCredit,
      this.recentTransactions,
      this.anonymous,
      this.password,
      this.locked,
      this.retryCount,
      this.firstModified,
      this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Wallet wallet) {
    return {
      WALLET_ID: wallet.walletId,
      ACCOUNT_NUMBER: wallet.accountNumber,
      AVAILABLE_CREDIT: wallet.availableCredit,
      RECENT_TRANSACTIONS: Transaction.toMapList(wallet.recentTransactions),
      ANONYMOUS: wallet.anonymous,
      PASSWORD: wallet.password,
      LOCKED: wallet.locked,
      RETRY_COUNT: wallet.retryCount,
      FIRST_MODIFIED: wallet.firstModified,
      LAST_MODIFIED: wallet.lastModified
    };
  }

  /// Converts Map to Model
  static Wallet toModel(Map<String, dynamic> map) {
    return Wallet(
        walletId: map[WALLET_ID],
        accountNumber: map[ACCOUNT_NUMBER],
        availableCredit: map[AVAILABLE_CREDIT],
        recentTransactions: Transaction.toModelList(map[RECENT_TRANSACTIONS]),
        anonymous: map[ANONYMOUS],
        password: map[PASSWORD],
        locked: map[LOCKED],
        retryCount: map[RETRY_COUNT],
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<Wallet> toModelList(List<Map<String, dynamic>> maps) {
    List<Wallet> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Wallet> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Wallet model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
