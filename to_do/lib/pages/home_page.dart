import 'package:flutter/material.dart';
import 'package:to_do/pages/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo:"),
      ),
      drawer: MyDrawer()
    );
  }
}