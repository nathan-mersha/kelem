/// Defines faq model [Faq]
class Faq {
  /// Defines key values to extract from a map
  static const String FAQ_ID = "faqId";
  static const String VALUES = "values";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String faqId;
  List<FaqValue> values;
  DateTime firstModified;
  DateTime lastModified;

  Faq({this.faqId, this.values, this.firstModified, this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Faq faq) {
    return {
      FAQ_ID: faq.faqId,
      VALUES: FaqValue.toMapList(faq.values),
      FIRST_MODIFIED: faq.firstModified,
      LAST_MODIFIED: faq.lastModified
    };
  }

  /// Converts Map to Model
  static Faq toModel(Map<String, dynamic> map) {
    return Faq(
        faqId: map[FAQ_ID],
        values: FaqValue.toModelList(map[VALUES]),
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<Faq> toModelList(List<Map<String, dynamic>> maps) {
    List<Faq> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Faq> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Faq model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines faqValue model [FaqValue]

class FaqValue {
  /// Defines key values to extract from a map
  static const String FAQ_VALUE_ID = "faqValueId";
  static const String LOCALE = "locale";
  static const String QUESTION = "question";
  static const String ANSWER = "answer";
  static const String FIRST_MODIFIED = "firstModified";
  static const String LAST_MODIFIED = "lastModified";

  String faqValueId;
  String locale; // todo : make enum
  String question;
  String answer;
  DateTime firstModified;
  DateTime lastModified;

  FaqValue({this.faqValueId, this.locale, this.question, this.answer, this.firstModified, this.lastModified});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(FaqValue faqValue) {
    return {
      FAQ_VALUE_ID: faqValue.faqValueId,
      LOCALE: faqValue.locale,
      QUESTION: faqValue.question,
      ANSWER: faqValue.answer,
      FIRST_MODIFIED: faqValue.firstModified,
      LAST_MODIFIED: faqValue.lastModified
    };
  }

  /// Converts Map to Model
  static FaqValue toModel(Map<String, dynamic> map) {
    return FaqValue(
        faqValueId: map[FAQ_VALUE_ID],
        locale: map[LOCALE],
        question: map[QUESTION],
        answer: map[ANSWER],
        firstModified: map[FIRST_MODIFIED],
        lastModified: map[LAST_MODIFIED]);
  }

  /// Changes List of Map to List of Model
  static List<FaqValue> toModelList(List<Map<String, dynamic>> maps) {
    List<FaqValue> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<FaqValue> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((FaqValue model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
