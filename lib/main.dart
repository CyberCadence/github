import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github/Services/Services/extension.dart';
import 'package:github/Services/Services/repository.dart';
import 'package:github/View/homepage.dart';
  
 
 
import 'package:github/model/Modeldata.dart';
 

import 'Services/dbservice.dart';
import 'bloc/data_bloc.dart';

void main()async {


WidgetsFlutterBinding.ensureInitialized();
// await DBservice().initDataBase();



  runApp( 
    
     BlocProvider(
    create: (context) => ModelBloc(repo:Repository()),
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
            return   Center(
              child: Text(state.message.toString()),
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
    backgroundColor: Colors.grey.shade400,
    appBar: AppBar(
    backgroundColor: Colors.black54,
    title: const Center(child: Text('Top Github repositories')),),
    body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            separatorBuilder: (context, index) => const SizedBox(height: 5,),
              itemCount: model.length,
              itemBuilder: (context, index) {
                Modeldata modelclass = model[index];
                return ListTile(shape: RoundedRectangleBorder(side: const BorderSide(width: 1,color: Colors.black45),borderRadius: BorderRadius.circular(20)),
                  
                  title: Text(modelclass. name.capitalizee() ,style: const TextStyle( fontWeight: FontWeight.w700,
                  fontSize:  15,color: Colors.black),)
                ,leading:
                 Column(
                   children: [const Text('☆☆☆',style: TextStyle(fontSize: 10,color: Colors.yellowAccent),),
                     Text(modelclass.stars.toString(),style: const TextStyle( color: Colors.black,fontWeight: FontWeight.w700),),
                   ],
                 ),
               subtitle: Text(modelclass. description.toString(),style: const TextStyle( fontSize: 10, 
               color: Colors.black87,fontWeight: FontWeight.w600),),
                trailing:CircleAvatar(backgroundImage: NetworkImage(modelclass.avatar_url),radius: 40,)
                //  Image.network(modelclass.avatar_url)
                ,
                );
              }),
        )),
  );
}



Widget buildDBwidget(List<Modeldata> model) {
  return Scaffold(appBar: AppBar(title: const Text('db data'),),
    body: Center(
        child: ListView.builder(
            itemCount: model.length,
            itemBuilder: (context, index) {
              Modeldata modelclass = model[index];
              return ListTile(leading: Text(modelclass.name),
            
              trailing: Image.network(modelclass.avatar_url),);
            })),
  );
}

 