import 'package:flutter/cupertino.dart';
import 'package:news_app/shared/netwok/api_manager.dart';

import '../../models/NewsResponse.dart';

class NewsViewModel extends ChangeNotifier{
  List<Articles>?News;
  String? errorMesaage="";
  void getNews(String sourceId,int page) async{
    News=null;
    errorMesaage=null;
    notifyListeners();
    var response= await APImanager.getNews(sourceId,page);
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