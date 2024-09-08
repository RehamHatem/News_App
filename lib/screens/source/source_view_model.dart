import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/source/repository/data_source/data_source_impl.dart';
import 'package:news_app/screens/source/repository/repository/source_repository_impl.dart';
import 'package:news_app/screens/source/repository/source_repository.dart';
import 'package:news_app/screens/source/source_states.dart';
import 'package:news_app/shared/netwok/api_manager.dart';

class SourceViewModel extends Cubit<SourceStates>{
  late SourceRepository sourceRepository;
  late SourceRemoteData sourceRemoteData;
  late APImanager apImanager;
  SourceViewModel():super(SourceLoadingState()){
    apImanager=APImanager();
    sourceRemoteData=DataSourceImpl(apImanager: apImanager);
    sourceRepository=SourceRepositoryImpl(remoteData: sourceRemoteData);

  }
  //todo hold data - handel logic

void getSources(String id)async{
  try{
  emit(SourceLoadingState());
  var response= await sourceRepository.getSources(id);
  if(response!.status=="error"){
    emit(SourceErrorState(message:"response error" ));
    return;
  }
  if(response.status=="ok"){
    emit(SourceSuccessState(sourcesList: response.sources!));
    return;
  }
  }
  catch(e){
    emit(SourceErrorState(message: e.toString()));
    return;
  }

}


}