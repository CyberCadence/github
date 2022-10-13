import 'package:bloc/bloc.dart';
import 'package:github/model/Modeldata.dart';
import 'package:meta/meta.dart';

import '../Services/repository.dart';

part 'data_event.dart';
part 'data_state.dart';

class ModelBloc extends Bloc<ModelEvent, ModelState> {
  final Repository repo;
  ModelBloc({required this.repo}) : super(ModelInitialstate()) {
    on<ModelEvent>((event, emit) async {
      if (event is LoaddataEvent) {
        emit(ModelLoadingstate());

        List<Modeldata>? modelclass = await repo.getdata();
        if (modelclass == null) {
          emit(Errorstate());
        } else {
          emit(LoadedState(modelclass: modelclass));
        }
      }
    });
  }
}