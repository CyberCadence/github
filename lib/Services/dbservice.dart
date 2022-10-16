import 'package:github/model/Modeldata.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
late Database db;
class DBservice{
//initializing data
Future<void> initDataBase() async {

  var dbPath=await getDatabasesPath();
final path=join(dbPath,'Github.db');
  db = await openDatabase('Github_details', version: 1,
      onCreate: (db, version) async {
    await db.execute(
        'CREATE TABLE Github (id INTEGER PRIMARY KEY, name TEXT,description TEXT,stars TEXT,username TEXT,image TEXT)');
  });
}

// Insert data

Future insertdata(Modeldata modeldata) async {



  var dbPath=await getDatabasesPath();
final path=join(dbPath,'Github.db');
 await deletedb();
 
await db.insert('Github',modeldata.toMap());
  // final data = await db.rawInsert(


    
  //     'INSERT INTO Github(id,name,description,stars,username,avatar_url)VALUES(?,?,?,?,?,?)',
  //     [
  //       modeldata.id,
  //       modeldata.name,
  //       modeldata.description,
  //       modeldata.stars,
  //       modeldata.username,
  //       modeldata.avatar_url
  //     ]);

  getallDBdata();
}
//getdata

Future<List<Modeldata >?>getallDBdata() async {

  List<Modeldata>collections=[];
  final values = await db.query('Github');

  values.forEach((data) {
    final modeldata = Modeldata.fromMap(data);
collections.add(modeldata);
    
    
  }
  );return collections;

}

 Future<void>deletedb( )async{

await db .rawDelete('DELETE FROM Github');

 }}

