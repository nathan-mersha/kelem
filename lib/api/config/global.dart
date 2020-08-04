import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kelemapp/model/config/global.dart';
import 'package:kelemapp/global.dart' as global;

class ApiGlobalConfig {
  static const String GLOBAL_KEY_ID = "snlopoku8ggZD0x7ZDX8";
  static get() {
    Firestore.instance
        .collection(GlobalConfig.COLLECTION_NAME)
        .document(GLOBAL_KEY_ID)
        .snapshots()
        .listen((DocumentSnapshot globalConfigSnapShot) {
      var globalConfigCloud = globalConfigSnapShot.data;

      /// Extracting global config id
      String globalConfigId = globalConfigCloud[GlobalConfig.GLOBAL_CONFIG_ID];

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

      // setting new values and notifying listeners.
      global.globalConfig.setConfig(
          globalConfigId: globalConfigId,
          additionalFee: additionalFee,
          subscriptionPackages: subscriptionPackages,
          categories: categories,
          featuresConfig: featuresConfig,
          bankConfigs: bankConfigs);

      global.localConfig.selectedCategory = categories[0];
    });
  }
}
