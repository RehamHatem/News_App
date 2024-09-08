import 'package:news_app/screens/source/repository/source_repository.dart';
import 'package:news_app/shared/netwok/api_manager.dart';

import '../../../../models/SourceResponce.dart';

class DataSourceImpl implements SourceRemoteData{
  APImanager apImanager;
  DataSourceImpl({required this.apImanager});
  @override
  Future<SourceResponce> getSources(String sourceId) async {
    var response=await APImanager.getSourse(sourceId);
    return response;
  }

}