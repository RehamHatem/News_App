import 'package:news_app/screens/source/repository/source_repository.dart';

import '../../../../models/SourceResponce.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteData remoteData;
  // SourceLocalData localeData;
  SourceRepositoryImpl({required this.remoteData});

  @override
  Future<SourceResponce>? getSources(String sourceId) {
    return remoteData.getSources(sourceId) ;

  }
}