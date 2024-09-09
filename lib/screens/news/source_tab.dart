import 'package:flutter/material.dart';
import 'package:news_app/models/SourceResponce.dart';
import 'package:news_app/screens/news/news_view_model.dart';
import 'package:news_app/shared/netwok/api_manager.dart';
import 'package:provider/provider.dart';

import '../source/soursce_item.dart';
import 'news_item.dart';

class SourceTab extends StatefulWidget {
  List<Sources>sources;
   SourceTab({super.key,required this.sources});

  @override
  State<SourceTab> createState() => _SourceTabState();

}

class _SourceTabState extends State<SourceTab> {
  int selectedindex=0;
  NewsViewModel viewModel=NewsViewModel();
  void initState() {
    super.initState();
    viewModel.getNews(widget.sources[selectedindex].id ?? "");
  }
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Column(
        children: [
          DefaultTabController(length:widget.sources.length, child:
              TabBar(
                isScrollable: true,
                indicatorColor: Colors.green,
                onTap: (value) {
                  setState(() {
                    selectedindex=value;
                    viewModel.getNews(widget.sources[selectedindex].id??"");
                    // viewModel.News;

                  });
                },
                tabs: widget.sources.map((e) => Tab(
                  child: SourceItem
                    (isSelected:widget.sources.elementAt(selectedindex)==e
                      ,sources:e ),)).toList(),
              )
          ),
          Expanded(
            child: Consumer<NewsViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.News == null) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                } else if (viewModel.News!.isEmpty) {
                  return Center(
                    child: Text("No News Available"),
                  );
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: (context, index) {
                      return NewsItem(artical: viewModel.News![index]);
                    },
                    itemCount: viewModel.News!.length,
                  );
                }
              },
            ),
          ),


          // FutureBuilder(future: APImanager.getNews(widget.sources[selectedindex].id??""), builder: (context, snapshot) {
          //   if(snapshot.connectionState==ConnectionState.waiting){
          //     return Center(child: CircularProgressIndicator());
          //   }
          //   if(snapshot.hasError){
          //     return Text("something went wtong");
          //   }
          //   var newsList=snapshot.data?.articles??[];
          //   if(newsList.isEmpty){
          //     return Text("No News");
          //   }
          //   return Expanded(
          //     child: ListView.separated(
          //       separatorBuilder: (context, index) {
          //         return SizedBox(height: 10,);
          //       },
          //       itemBuilder: (context, index) {
          //       return NewsItem(artical:newsList[index]);
          //     },itemCount: newsList.length,),
          //   );
          // },)
        ],
      ),
    ) ;
  }
}
