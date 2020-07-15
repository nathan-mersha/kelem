/// Defines versionAndUpdate model [VersionAndUpdate]
class VersionAndUpdate {
  /// Defines key values to extract from a map
  static const String VERSION_AND_UPDATE_ID = "versionAndUpdateId";
  static const String VALUES = "values";

  String versionAndUpdateId;
  List<VersionAndUpdateValue> values;

  VersionAndUpdate({this.versionAndUpdateId, this.values});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(VersionAndUpdate versionAndUpdate) {
    return {
      VERSION_AND_UPDATE_ID: versionAndUpdate.versionAndUpdateId,
      VALUES: VersionAndUpdateValue.toMapList(versionAndUpdate.values)
    };
  }

  /// Converts Map to Model
  static VersionAndUpdate toModel(Map<String, dynamic> map) {
    return VersionAndUpdate(
      versionAndUpdateId: map[VERSION_AND_UPDATE_ID],
      values: VersionAndUpdateValue.toModelList(map[VALUES]),
    );
  }

  /// Changes List of Map to List of Model
  static List<VersionAndUpdate> toModelList(List<Map<String, dynamic>> maps) {
    List<VersionAndUpdate> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<VersionAndUpdate> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((VersionAndUpdate model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines versionAndUpdateValues model [VersionAndUpdateValue]
class VersionAndUpdateValue {
  /// Defines key values to extract from a map
  static const String VERSION_AND_UPDATE_VALUE_ID = "versionAndUpdateValueId";
  static const String LOCALE = "locale";
  static const String DESCRIPTION = "description";

  String versionAndUpdateValueId;
  String locale; // todo : make enum
  String description;

  VersionAndUpdateValue({this.versionAndUpdateValueId, this.locale, this.description});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(VersionAndUpdateValue versionAndUpdateValues) {
    return {
      VERSION_AND_UPDATE_VALUE_ID: versionAndUpdateValues.versionAndUpdateValueId,
      LOCALE: versionAndUpdateValues.locale,
      DESCRIPTION: versionAndUpdateValues.description,
    };
  }

  /// Converts Map to Model
  static VersionAndUpdateValue toModel(Map<String, dynamic> map) {
    return VersionAndUpdateValue(
      versionAndUpdateValueId: map[VERSION_AND_UPDATE_VALUE_ID],
      locale: map[LOCALE],
      description: map[DESCRIPTION],
    );
  }

  /// Changes List of Map to List of Model
  static List<VersionAndUpdateValue> toModelList(List<Map<String, dynamic>> maps) {
    List<VersionAndUpdateValue> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<VersionAndUpdateValue> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((VersionAndUpdateValue model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
