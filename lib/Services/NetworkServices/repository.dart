

import 'dart:convert';

 
import 'package:github/model/Modeldata.dart';
import 'package:http/http.dart'as http;
class Repository{





   Future<List<Modeldata>?> getdataApi()async{
  List <Modeldata> collections=[];

const url=
'https://api.github.com/search/repositories?q=created:%3E2022-04-29&sort=stars&order=desc';

try {


 http.Response response= await http.get(Uri.parse(url));

   if(response.statusCode==200){


  final decodeddata= jsonDecode(response.body);
  

    List data=decodeddata['items'];
    for(var value in data){

Modeldata modeldata=Modeldata.fromMap(value);
collections.add(modeldata);
    

    }return collections;

   }
 



  
  
} catch (e) {
  print(e);
}

 




}

}


