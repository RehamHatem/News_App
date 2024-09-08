import 'package:flutter/cupertino.dart';
import 'package:news_app/shared/netwok/api_manager.dart';

import '../../models/NewsResponse.dart';

class NewsViewModel extends ChangeNotifier{
  List<Articles>?News;
  String? errorMesaage="";
  void getNews(String sourceId) async{
    News=null;
    errorMesaage=null;
    notifyListeners();
    var response= await APImanager.getNews(sourceId);
    try{
      if (response.status=='error'){
        errorMesaage="server error";
      }
      else{
        News=response!.articles;
      }
    }catch(e){
      errorMesaage="error loading news";
    }
    notifyListeners();
  }


}