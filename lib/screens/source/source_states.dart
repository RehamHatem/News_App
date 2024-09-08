import '../../models/SourceResponce.dart';

abstract class SourceStates{}
class SourceLoadingState extends SourceStates{}
class SourceSuccessState extends SourceStates{
  List<Sources> sourcesList;
  SourceSuccessState({required this.sourcesList});
}
class SourceErrorState extends SourceStates{
  String? message;
  SourceErrorState({required this.message});
}