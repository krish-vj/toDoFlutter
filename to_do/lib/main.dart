import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:to_do/pages/developer.dart';
import 'package:to_do/pages/settings.dart';
import 'package:to_do/pages/to_do.dart';
import 'package:to_do/providers/theme_provider.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  await Hive.openBox('theme_box');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'To Do App',
            theme: themeProvider.themeData,
            home: ToDoPage(),
            routes: {
              '/todos': (context) => ToDoPage(),
              '/settings': (context) => Settings(),
              
              '/developer': (context) => Developer()
            },
          );
        },
      ),
    );
  }
}