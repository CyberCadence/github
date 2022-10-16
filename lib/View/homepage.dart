import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:github/Services/dbservice.dart';
import 'package:github/model/Modeldata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: Scaffold(appBar: AppBar(title: Text('Db data'),),
      
      
      body:SafeArea(child: Column(children: [FutureBuilder<List<Modeldata>?>(
        future: DBservice().getallDBdata(),
        builder: ( (context,  AsyncSnapshot<List<Modeldata>?> snapshot) {
        
if(snapshot.hasData){

print(snapshot.data);
return const Center(child: Text('loading'),);

} else{


return const Center(child: CircularProgressIndicator(),);

}

 

      }
      
      
      
      ))],),)
      
       ),);
    
  }
}