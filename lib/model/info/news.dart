/// Defines news model [News]

class News {
  /// Defines key values to extract from a map
  static const String NEWS_ID = "newsId";
  static const String VALUES = "values";
  static const String PUBLISHED_DATE = "publishedDate";
  static const String THUMB_NAIL = "thumbNail";
  static const String LINK = "link";
  static const String TAGS = "tags";
  static const String CATEGORY = "category";

  String newsId;
  List<NewsValue> values;
  DateTime publishedDate;
  String thumbnail;
  String link;
  List<String> tags;
  String category;

  News({this.newsId, this.values, this.publishedDate, this.thumbnail, this.link, this.tags, this.category});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(News news) {
    return {
      NEWS_ID: news.newsId,
      VALUES: NewsValue.toMapList(news.values),
      PUBLISHED_DATE: news.publishedDate,
      THUMB_NAIL: news.thumbnail,
      LINK: news.link,
      TAGS: news.tags,
      CATEGORY: news.category,
    };
  }

  /// Converts Map to Model
  static News toModel(Map<String, dynamic> map) {
    return News(
      newsId: map[NEWS_ID],
      values: NewsValue.toModelList(map[VALUES]),
      publishedDate: map[PUBLISHED_DATE],
      thumbnail: map[THUMB_NAIL],
      link: map[LINK],
      tags: map[TAGS],
      category: map[CATEGORY],
    );
  }

  /// Changes List of Map to List of Model
  static List<News> toModelList(List<Map<String, dynamic>> maps) {
    List<News> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<News> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((News model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}

/// Defines newsValue model [NewsValue]
class NewsValue {
  /// Defines key values to extract from a map
  static const String NEWS_VALUE_ID = "newsValueId";
  static const String LOCALE = "newsValueId";
  static const String PUBLISHER = "newsValueId";
  static const String TITLE = "newsValueId";
  static const String CONTENT = "newsValueId";

  String newsValueId;
  String locale; // todo : make enum
  String publisher;
  String title;
  String content;

  NewsValue({this.newsValueId, this.locale, this.publisher, this.title, this.content});

  /// Converts Model to Map
  static Map<String, dynamic> toMap(NewsValue newsValue) {
    return {
      NEWS_VALUE_ID: newsValue.newsValueId,
      LOCALE: newsValue.locale,
      PUBLISHER: newsValue.publisher,
      TITLE: newsValue.title,
      CONTENT: newsValue.content,
    };
  }

  /// Converts Map to Model
  static NewsValue toModel(Map<String, dynamic> map) {
    return NewsValue(
      newsValueId: map[NEWS_VALUE_ID],
      locale: map[LOCALE],
      publisher: map[PUBLISHER],
      title: map[TITLE],
      content: map[CONTENT],
    );
  }

  /// Changes List of Map to List of Model
  static List<NewsValue> toModelList(List<Map<String, dynamic>> maps) {
    List<NewsValue> modelList = [];
    maps.forEach((Map<String, dynamic> map) {
      modelList.add(toModel(map));
    });
    return modelList;
  }

  /// Changes List of Model to List of Map
  static List<Map<String, dynamic>> toMapList(List<NewsValue> models) {
    List<Map<String, dynamic>> mapList = [];
    models.forEach((NewsValue model) {
      mapList.add(toMap(model));
    });
    return mapList;
  }
}
