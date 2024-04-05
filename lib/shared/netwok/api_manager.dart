import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/SourceResponce.dart';

import '../../models/NewsResponse.dart';

// class APImanager {
//   //https://newsapi.org/v2/top-headlines/sources?apiKey=9365513b6c0f47dab2db80306e36c6f1
//   static Future<SourceResponce> getSourse() async {
//     Uri url=Uri.https("newsapi.org","/v2/top-headlines/sources",{
//       "apiKey":"9365513b6c0f47dab2db80306e36c6f1"
//     });
//     http.Response response= await get(url);
//     var json=jsonDecode(response.body);
//     return SourceResponce.fromJson(json);
//   }
//   static Future<NewsResponse> getNews(String sourceId) async {
//     Uri url=Uri.https("newsapi.org","/v2/everything",{
//       "sources":"sourceId",
//     });
//     http.Response response= await get(url,headers: {
//       "x-api-key":"9365513b6c0f47dab2db80306e36c6f1"
//
//     });
//     var json=jsonDecode(response.body);
//     return NewsResponse.fromJson(json);
//   }
// }

class APImanager {
// https://newsapi.org/v2/top-headlines/sources?apiKey=
  static Future<SourceResponce> getSourse(String category) async {
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
        {"apiKey": "dc3d106e730c4256b8c275d9da58d090","category": category});
    http.Response resposne = await http.get(url);
    Map<String, dynamic> json = jsonDecode(resposne.body);

    return SourceResponce.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri url =
    Uri.https("newsapi.org", "/v2/everything", {"sources": sourceId});
    var resposne = await http
        .get(url, headers: {"x-api-key": "dc3d106e730c4256b8c275d9da58d090"});

    var json = jsonDecode(resposne.body);
    return NewsResponse.fromJson(json);
  }
}