/// Defines faq model [Faq]
class Faq {
  /// Defines key values to extract from a map
  static const String FAQ_ID = "faqId";
  static const String VALUES = "values";

  String faqId;
  List<FaqValue> values;

  Faq({this.faqId, this.values});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Faq faq) {
    return {
      FAQ_ID: faq.faqId,
      VALUES: FaqValue.toMapList(faq.values),
    };
  }

  /// Converts Map to Model
  static Faq toModel(Map<String, dynamic> map) {
    return Faq(faqId: map[FAQ_ID], values: FaqValue.toModelList(map[VALUES]));
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

  String faqValueId;
  String locale; // todo : make enum
  String question;
  String answer;

  FaqValue({this.faqValueId, this.locale, this.question, this.answer});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(FaqValue faqValue) {
    return {
      FAQ_VALUE_ID: faqValue.faqValueId,
      LOCALE: faqValue.locale,
      QUESTION: faqValue.question,
      ANSWER: faqValue.answer,
    };
  }

  /// Converts Map to Model
  static FaqValue toModel(Map<String, dynamic> map) {
    return FaqValue(
      faqValueId: map[FAQ_VALUE_ID],
      locale: map[LOCALE],
      question: map[QUESTION],
      answer: map[ANSWER],
    );
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
