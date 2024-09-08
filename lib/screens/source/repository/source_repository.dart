import '../../../models/SourceResponce.dart';

abstract class SourceRepository{

  Future<SourceResponce>? getSources(String sourceId){}

}
abstract class SourceRemoteData {
  Future<SourceResponce>?getSources(String sourceId){

  }
}
abstract class SourceLocalData {
  Future<SourceResponce>?getSources(String sourceId){}
}

