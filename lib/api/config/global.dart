import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kelemapp/model/config/global.dart';
import 'package:kelemapp/global.dart' as global;

class ApiGlobalConfig {
  static const String GLOBAL_KEY_ID = "snlopoku8ggZD0x7ZDX8";
  static get() {
    Firestore.instance
        .collection("globalConfig")
        .document(GLOBAL_KEY_ID)
        .snapshots()
        .listen((DocumentSnapshot globalConfigSnapShot) {
      var globalConfigCloud = globalConfigSnapShot.data;

      GlobalConfig globalConfig;

      /// Extracting additional fees
      AdditionalFee additionalFee = AdditionalFee.toModel(globalConfigCloud[GlobalConfig.ADDITIONAL_FEE]);

      /// Extracting subscription packages
      List<SubscriptionPackage> subscriptionPackages =
          SubscriptionPackage.toModelList(globalConfigCloud[GlobalConfig.SUBSCRIPTION_PACKAGES]);

      /// Extracting categories
      List<Category> categories = Category.toModelList(globalConfigCloud[GlobalConfig.CATEGORIES]);

      /// Extracting features config
      FeaturesConfig featuresConfig = FeaturesConfig.toModel(globalConfigCloud[GlobalConfig.FEATURES_CONFIG]);

      /// Extracting bank config
      List<BankConfig> bankConfigs = BankConfig.toModelList(globalConfigCloud[GlobalConfig.BANK_CONFIG]);

      globalConfig = GlobalConfig(
          additionalFee: additionalFee,
          subscriptionPackages: subscriptionPackages,
          categories: categories,
          featuresConfig: featuresConfig,
          bankConfigs: bankConfigs);

      print("change occured ${Category.toMapList(categories)}");

      // Assigning global config value to global variable.
      global.globalConfig = globalConfig;
    });
  }
}
