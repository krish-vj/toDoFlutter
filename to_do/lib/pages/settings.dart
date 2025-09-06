import 'package:flutter/material.dart';
import 'package:to_do/pages/drawer.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text("Dark Mode, Lefty Mode and signin options coming soon", style: TextStyle(fontSize: 30),),
      )),
    );
  }
}