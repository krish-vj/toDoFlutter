import 'package:flutter/material.dart';
import 'package:to_do/pages/drawer.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Settings"),
      ),
      drawer: MyDrawer(),
    );
  }
}