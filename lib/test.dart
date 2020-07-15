import 'package:kelemapp/model/commerce/coupon.dart';
import 'package:kelemapp/model/info/news.dart';
import 'package:kelemapp/model/profile/shop.dart';

main(){

  Shop shop = Shop(category: "iot", coOrdinates: ["1.3", "3.4"]);
  Coupon coupon = Coupon(code: "12345", shop: shop);
  List<NewsValue> newsValues = [NewsValue(content: "content")];
  News news = News(newsId: "id1", tags: ["one", "two"],values: newsValues);


  print(news.newsId);
  print(News.toMap(news));


}