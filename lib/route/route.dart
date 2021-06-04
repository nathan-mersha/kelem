import 'package:flutter/material.dart';
import 'package:kelemapp/db/k_shared_preference.dart';
import 'package:kelemapp/page/info/contact_us.dart';
import 'package:kelemapp/page/info/help.dart';
import 'package:kelemapp/page/info/news.dart';
import 'package:kelemapp/page/info/terms_and_conditions.dart';
import 'package:kelemapp/page/info/version_and_update.dart';
import 'package:kelemapp/page/info/welcome.dart';
import 'package:kelemapp/page/order/cart.dart';
import 'package:kelemapp/page/order/checkout.dart';
import 'package:kelemapp/page/order/order.dart';
import 'package:kelemapp/page/product/best_sellers.dart';
import 'package:kelemapp/page/product/detail.dart';
import 'package:kelemapp/page/product/edit.dart';
import 'package:kelemapp/page/product/home.dart';
import 'package:kelemapp/page/profile/language.dart';
import 'package:kelemapp/page/profile/signin.dart';
import 'package:kelemapp/page/profile/wishlist.dart';
import 'package:kelemapp/page/setting/general/general.dart';
import 'package:kelemapp/page/setting/general/payment_and_delivery.dart';
import 'package:kelemapp/page/setting/wallet/cash_out_method.dart';
import 'package:kelemapp/page/setting/wallet/change_password.dart';
import 'package:kelemapp/page/setting/wallet/general.dart';
import 'package:kelemapp/page/setting/wallet/setup_password.dart';
//import 'package:kelemapp/page/shop/add_item.dart';
import 'package:kelemapp/page/shop/admin.dart';
import 'package:kelemapp/page/shop/detail.dart';
import 'package:kelemapp/page/shop/edit.dart';
import 'package:kelemapp/page/shop/issue_coupon.dart';
import 'package:kelemapp/page/shop/rating.dart';
import 'package:kelemapp/page/wallet/cash_out.dart';
import 'package:kelemapp/page/wallet/dashboard.dart';
import 'package:kelemapp/page/wallet/login.dart';
import 'package:kelemapp/page/wallet/send_credit.dart';

class RouteTo {
  // Root path
  static const String ROOT = "/";

  // Info pages
  static const String INFO_CONTACT_US = "/info/contactUs";
  static const String INFO_HELP = "/info/help";
  static const String INFO_NEWS = "/info/news";
  static const String INFO_TERMS_AND_CONDITIONS = "/info/termsAndConditions";
  static const String INFO_VERSION_AND_UPDATE = "/info/versionAndUpdate";
  static const String INFO_WELCOME = "/info/welcome";

  // Product pages
  static const String PRODUCT_BEST_SELLERS = "/product/bestSellers";
  static const String PRODUCT_DETAIL = "/product/detail";
  static const String PRODUCT_EDIT = "/product/edit";
  static const String HOME = "/product/list";

  // Order pages
  static const String ORDER_CART = "/order/cart";
  static const String ORDER_CHECK_OUT = "/order/checkOut";
  static const String ORDER_VIEW = "/order/view";

  // Profile pages
  static const String PROFILE_LANGUAGE_SELECTOR = "/profile/languageSelector";
  static const String PROFILE_SIGN_IN = "/profile/signIn";
  static const String PROFILE_WISH_LIST = "/profile/wishList";

  // General settings pages
  static const String SETTING_GENERAL = "/setting/general";
  static const String SETTING_PAYMENT_AND_DELIVERY =
      "/setting/paymentAndDelivery";

  // Wallet settings page
  static const String SETTING_WALLET_CASH_OUT_METHODS =
      "/setting/wallet/cashOutMethods";
  static const String SETTING_WALLET_CHANGE_PASSWORD =
      "/setting/wallet/changePassword";
  static const String SETTING_WALLET_GENERAL = "/setting/wallet/general";
  static const String SETTING_WALLET_SETUP_PASSWORD =
      "/setting/wallet/setupPassword";

  // Shop pages
  static const String SHOP_ADMIN = "/shop/admin";
  static const String SHOP_DETAIL = "/shop/detail";
  static const String SHOP_EDIT = "/shop/edit";
  static const String SHOP_ISSUE_COUPON = "/shop/issueCoupon";
  static const String SHOP_RATING = "/shop/rating";
  static const String SHOP_ADD_ITEM = "/shop/add_item";

  // Wallet pages
  static const String WALLET_CASH_OUT = "/wallet/cashOut";
  static const String WALLET_DASHBOARD = "/wallet/dashboard";
  static const String WALLET_LOGIN = "/wallet/login";
  static const String WALLET_SEND_CREDIT = "/wallet/send/credit";

  var routes;
  RouteTo() {
    routes = {
      ROOT: (BuildContext context) => FutureBuilder(
            builder: buildFirstPage,
            future: isFirstTime(),
          ),
      // ROOT: (BuildContext context) =>
      //     HomePage(), // todo uncomment the above code after internet

      /// Info pages
      INFO_CONTACT_US: (BuildContext context) => ContactUsPage(),
      INFO_HELP: (BuildContext context) => HelpPage(),
      INFO_NEWS: (BuildContext context) => NewsPage(),
      INFO_TERMS_AND_CONDITIONS: (BuildContext context) =>
          TermsAndConditionsPage(),
      INFO_VERSION_AND_UPDATE: (BuildContext context) => VersionAndUpdatePage(),
      INFO_WELCOME: (BuildContext context) => WelcomePage(),

      /// Product pages
      PRODUCT_BEST_SELLERS: (BuildContext context) => BestSellersPage(),
      PRODUCT_DETAIL: (BuildContext context) => ProductDetailPage(),
      PRODUCT_EDIT: (BuildContext context) => ProductEditPage(),
      HOME: (BuildContext context) => HomePage(),

      /// Order pages
      ORDER_CART: (BuildContext context) => CartPage(),
      ORDER_CHECK_OUT: (BuildContext context) => CheckOutPage(),
      ORDER_VIEW: (BuildContext context) => OrderPage(),

      /// Profile pages
      PROFILE_LANGUAGE_SELECTOR: (BuildContext context) => LanguagePage(),
      PROFILE_SIGN_IN: (BuildContext context) => SignInPage(),
      PROFILE_WISH_LIST: (BuildContext context) => WishListPage(),

      /// General settings pages
      SETTING_GENERAL: (BuildContext context) => GeneralSettingsPage(),
      SETTING_PAYMENT_AND_DELIVERY: (BuildContext context) =>
          PaymentAndDeliverySettingsPage(),

      /// Wallet settings pages
      SETTING_WALLET_CASH_OUT_METHODS: (BuildContext context) =>
          CashOutMethodWalletSettingsPage(),
      SETTING_WALLET_CHANGE_PASSWORD: (BuildContext context) =>
          ChangePasswordWalletSettingsPage(),
      SETTING_WALLET_GENERAL: (BuildContext context) => WalletSettingsPage(),
      SETTING_WALLET_SETUP_PASSWORD: (BuildContext context) =>
          SetupPasswordWalletSettingsPage(),

      /// Shop pages
      SHOP_ADMIN: (BuildContext context) => ShopAdminPage(),
      SHOP_DETAIL: (BuildContext context) => ShopDetailPage(),
      SHOP_EDIT: (BuildContext context) => EditShopPage(),
      SHOP_ISSUE_COUPON: (BuildContext context) => IssueCouponPage(),
      SHOP_RATING: (BuildContext context) => ShopRatingPage(),
      //SHOP_ADD_ITEM:(BuildContext context) => AddItemPage(),
      /// Wallet pages
      WALLET_CASH_OUT: (BuildContext context) => CashOutPage(),
      WALLET_DASHBOARD: (BuildContext context) => WalletDashboardPage(),
      WALLET_LOGIN: (BuildContext context) => LoginWalletPage(),
      WALLET_SEND_CREDIT: (BuildContext context) => SendCreditPage(),
    };
  }

  Widget buildFirstPage(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.connectionState == ConnectionState.none &&
        snapshot.hasData == null) {
      return CircularProgressIndicator();
    } else if (snapshot.data == true) {
      return LanguagePage();
    } else if (snapshot.data == false) {
      return HomePage(); // change to home page
    } else {
      return CircularProgressIndicator();
    }
  }

  Future<bool> isFirstTime() async {
    HSharedPreference localPreference = GetHSPInstance.hSharedPreference;
    return await localPreference
        .get(HSharedPreference.KEY_FIRST_TIME)
        .then((firstTime) => firstTime != null ? true : false);
  }
}
