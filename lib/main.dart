import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
 
import 'package:github/View/Homepage.dart';
import 'package:github/model/Modeldata.dart';

import 'Services/repository.dart';
import 'bloc/data_bloc.dart';

void main() {
  runApp( BlocProvider(
    create: (context) => ModelBloc(repo: Repository()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: BlocBuilder<ModelBloc, ModelState>(
        builder: (context, state) {
          if (state is ModelInitialstate) {
            context.read<ModelBloc>().add(LoaddataEvent());
          }
          if (state is ModelLoadingstate) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return buildwidget(state.modelclass);
          }
          if (state is Errorstate) {
            return const Center(
              child: Text('ERRORSTATE'),
            );
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.yellow,
          ));
        },
      )),
    );
  }
}

Widget buildwidget(List<Modeldata> model) {
  return Scaffold(
    body: Center(
        child: ListView.builder(
            itemCount: model.length,
            itemBuilder: (context, index) {
              Modeldata modelclass = model[index];
              return ListTile(leading: Text(modelclass.name),trailing: Image.network(modelclass.avatar_url),);
            })),
  );
}