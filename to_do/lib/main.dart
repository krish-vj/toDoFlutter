import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/pages/developer.dart';
import 'package:to_do/pages/profile.dart';
import 'package:to_do/pages/settings.dart';
import 'package:to_do/pages/to_do.dart';




void main() async{
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoPage(),
      routes: {
        '/todos': (context)=>ToDoPage(),
        '/settings': (context)=>Settings(),
        '/profile': (context)=>Profile(),
        '/developer': (context)=>Developer()
      },
    );
  }
}
  