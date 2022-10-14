import 'package:github/model/Modeldata.dart';
import 'package:sqflite/sqflite.dart';

late Database db;

//initializing data
Future<void> initDataBase() async {
  db = await openDatabase('Github_details', version: 1,
      onCreate: (db, version) async {
    await db.execute(
        'CREATE TABLE Github (id INTEGER PRIMARY KEY, name TEXT,description TEXT,stars TEXT,username TEXT,image TEXT, age INTEGER)');
  });
}

// Insert data

Future insertdata(Modeldata modeldata) async {
  final data = await db.rawInsert(
      'INSERT INTO Github(id,name,description,stars,username,avatar_url)VALUES(?,?,?,?,?,?)',
      [
        modeldata.id,
        modeldata.name,
        modeldata.description,
        modeldata.stars,
        modeldata.username,
        modeldata.avatar_url
      ]);

  getallDBdata();
}


Future<List<Modeldata >?>getallDBdata() async {

  List<Modeldata>collections=[];
  final values = await db.query('Github');

  values.forEach((data) {
    final modeldata = Modeldata.fromMap(data);
collections.add(modeldata);
    
    
  }
  );return collections;

}

// Future fetchdata() async {
//   final database = await db;
//   final labels = await database.query('Github');

//   if (labels.isNotEmpty) {}
// }
