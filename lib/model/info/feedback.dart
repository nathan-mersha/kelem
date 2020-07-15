/// Defines feedback model
class Feedback {
  /// Defines key values to extract from a map

  static const String FEEDBACK_ID = "feedbackId";
  static const String USER_ID = "userId";
  static const String TITLE = "title";
  static const String MESSAGE = "message";

  String feedbackId;
  String userId;
  String title;
  String message;

  Feedback({this.feedbackId, this.userId, this.title, this.message});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(Feedback feedback) {
    return {
      FEEDBACK_ID: feedback.feedbackId,
      USER_ID: feedback.userId,
      TITLE: feedback.title,
      MESSAGE: feedback.message,
    };
  }

  /// Converts Map to Model
  static Feedback toModel(Map<String, dynamic> map) {
    return Feedback(
      feedbackId: map[FEEDBACK_ID],
      userId: map[USER_ID],
      title: map[TITLE],
      message: map[MESSAGE],
    );
  }

  /// Changes List of Map to List of Model
  static List<Feedback> toModelList(List<Map<String, dynamic>> maps) {
    List<Feedback> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<Feedback> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((Feedback model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
