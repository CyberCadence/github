import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:github/Services/Services/repository.dart';
import 'package:sqflite/sqflite.dart';


class HOmePage extends StatefulWidget {
  const HOmePage({Key? key}) : super(key: key);

  @override
  State<HOmePage> createState() => _HOmePageState();
}

class _HOmePageState extends State<HOmePage> {


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Github Repositories'),
        actions: [IconButton(onPressed: ( ){Repository().getdataApi();
 

        }, icon: Icon(Icons.add))],
      ),
    );
  }
}

