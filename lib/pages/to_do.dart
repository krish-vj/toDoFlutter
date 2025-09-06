import 'package:flutter/material.dart';
import 'package:to_do/pages/drawer.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("To Do's"),
        
      ),
    );
  }
}