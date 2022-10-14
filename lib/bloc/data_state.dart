part of 'data_bloc.dart';

  class DataState {}
class ModelState {}

class ModelInitialstate extends ModelState {}

class ModelLoadingstate extends ModelState {}

class LoadedState extends ModelState {
  List <Modeldata> modelclass;

   LoadedState({required this.modelclass});
}



class Errorstate extends ModelState {

  
}
class LoadDBData extends ModelState{
 
 
List<Modeldata> modeldata;
LoadDBData({required this.modeldata});

}
