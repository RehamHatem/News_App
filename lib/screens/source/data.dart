
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/source/source_states.dart';
import 'package:news_app/screens/source/source_view_model.dart';

import '../../shared/netwok/api_manager.dart';
import '../news/source_tab.dart';


class DataTab extends StatelessWidget {
  String categoryId;

  DataTab({required this.categoryId, super.key});

  SourceViewModel viewModel=SourceViewModel();

  @override
  Widget build(BuildContext context) {

    viewModel.getSources(categoryId);
    return BlocBuilder<SourceViewModel,SourceStates>(
        // bloc: viewModel,
        builder: (context, state) {
          if(state is SourceLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          else if(state is SourceErrorState){
            return Text("something went wtong");
          }
          else if(state is SourceSuccessState){
            return SourceTab(sources: state.sourcesList,);

          }
          return Container();

        },);




    //   FutureBuilder(future:APImanager.getSourse(categoryId),builder: (context, snapshot) {
    //   if(snapshot.connectionState==ConnectionState.waiting){
    //     return Center(child: CircularProgressIndicator());
    //   }
    //   if(snapshot.hasError){
    //     return Text("something went wtong");
    //   }
    //   var sourcesList=snapshot.data?.sources??[];
    //   if(sourcesList.isEmpty){
    //     return Text("No Sources");
    //   }
    //   return SourceTab(sources: sourcesList,);
    //
    // }, );
  }
}