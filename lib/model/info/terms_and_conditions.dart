/// Defines termsAndConditions model [TermsAndConditions]
class TermsAndConditions {
  /// Defines key values to extract from a map
  static const String TERMS_AND_CONDITIONS_ID = "termsAndConditionsId";
  static const String VALUES = "values";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String termsAndConditionsId;
  List<TacValue> values;
  DateTime firstModified;
  DateTime lastModified;

  TermsAndConditions({this.termsAndConditionsId, this.values, this.firstModified, this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(TermsAndConditions termsAndConditions) {
    return {
      TERMS_AND_CONDITIONS_ID: termsAndConditions.termsAndConditionsId,
      VALUES: TacValue.toMapList(termsAndConditions.values),
      FIRST_MODIFIED: termsAndConditions.firstModified,
      LAST_MODIFIED: termsAndConditions.lastModified
    };
  }

  /// Converts Map to Model
  static TermsAndConditions toModel(Map<String, dynamic> map) {
    return TermsAndConditions(
        termsAndConditionsId: map[TERMS_AND_CONDITIONS_ID],
        values: TacValue.toModelList(map[VALUES]),
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<TermsAndConditions> toModelList(List<Map<String, dynamic>> maps) {
    List<TermsAndConditions> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<TermsAndConditions> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((TermsAndConditions model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

class TacValue {
  /// Defines key values to extract from a map
  static const String TAC_VALUE_ID = "tacValueId";
  static const String LOCALE = "locale";
  static const String TERMS = "terms";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String tacValueId;
  String locale;
  String terms;
  DateTime firstModified;
  DateTime lastModified;

  TacValue({this.tacValueId, this.locale, this.terms, this.firstModified, this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(TacValue tacValue) {
    return {
      TAC_VALUE_ID: tacValue.tacValueId,
      LOCALE: tacValue.locale,
      TERMS: tacValue.terms,
      FIRST_MODIFIED: tacValue.firstModified,
      LAST_MODIFIED: tacValue.lastModified
    };
  }

  /// Converts Map to Model
  static TacValue toModel(Map<String, dynamic> map) {
    return TacValue(
        tacValueId: map[TAC_VALUE_ID],
        locale: map[LOCALE],
        terms: map[TERMS],
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<TacValue> toModelList(List<Map<String, dynamic>> maps) {
    List<TacValue> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<TacValue> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((TacValue model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
