
import 'package:flutter/material.dart';
import 'package:news_app/screens/source_tab.dart';

import '../shared/netwok/api_manager.dart';

class DataTab extends StatelessWidget {
  String categoryId;

  DataTab({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:APImanager.getSourse(categoryId),builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      if(snapshot.hasError){
        return Text("something went wtong");
      }
      var sourcesList=snapshot.data?.sources??[];
      if(sourcesList.isEmpty){
        return Text("No Sources");
      }
      return SourceTab(sources: sourcesList,);

    }, );
  }
}