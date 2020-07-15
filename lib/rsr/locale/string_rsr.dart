import 'package:flutter/material.dart';
import 'package:kelemapp/rsr/locale/lang/en.dart';
import 'package:kelemapp/rsr/locale/lang/et_am.dart';
import 'package:kelemapp/rsr/locale/lang/language_key.dart';

class StringRsr {
  static Map<String, String> languageMapping = {
    StringRsr.get(LanguageKey.AMHARIC_LC, lcl: LanguageKey.AMHARIC_LC): LanguageKey.AMHARIC_LC,
    StringRsr.get(LanguageKey.ENGLISH_LC, lcl: LanguageKey.ENGLISH_LC): LanguageKey.ENGLISH_LC,
    // todo : Add more languages here.
  };

  // Default locale setup
  static String locale = LanguageKey.ENGLISH_LC; // todo change language here.

  static Map<String, Map<String, String>> _localizedValues = {
    LanguageKey.ENGLISH_LC: EN.val,
    LanguageKey.AMHARIC_LC: ET_AM.val,
  };

  static StringRsr of(BuildContext context) {
    return Localizations.of<StringRsr>(context, StringRsr);
  }

  static String get(key, {firstCap = false, lcl}) {
    String localeVal = lcl == null ? locale : lcl;

    if (firstCap) {
      return '${_localizedValues[localeVal][key][0].toUpperCase()}${_localizedValues[localeVal][key].substring(1)}';
    } else {
      return _localizedValues[localeVal][key];
    }
  }
}
