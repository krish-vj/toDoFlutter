import 'package:flutter/material.dart';
import 'package:to_do/pages/drawer.dart';

class Developer extends StatelessWidget {
  const Developer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Developer Info"),
        
      ),
    );
  }
}