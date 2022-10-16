import 'package:bloc/bloc.dart';
import 'package:github/Services/Services/repository.dart';
import 'package:github/Services/dbservice.dart';
import 'package:github/model/Modeldata.dart';


part 'data_event.dart';
part 'data_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  final Repository repo;
  ModelBloc({required this.repo}) : super(ModelInitialstate()) {
    on<ModelEvent>((event, emit) async {
      if (event is LoaddataEvent) {
        emit(ModelLoadingstate());

        List<Modeldata>? modelclass = await repo.getdataApi();
        //  List<Modeldata>? dbdata=await getallDBdata();
        if (modelclass == null) {
          emit(Errorstate(message: 'please check network'));
          // emit( LoadDBData(modeldata: dbdata));
        } else {
          emit(LoadedState(modelclass: modelclass));
        }

// if(dbdata==null){

// emit(Errorstate());

// }else{

// emit(LoadDBData(modeldata: dbdata));

// }
      }
    });
  }
}



// if(event is LoaddataTable){

// Future getdata()async{
// List<dynamic>collections=[];
//   final database= await db;
//   final data= await database.query('Github');

//   if(data.isNotEmpty){

// collections.add(data);



//   }else{

// final data=Repository().getdataApi();
// collections.add(data);

//   }



// }


// }