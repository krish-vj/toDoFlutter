import 'package:flutter/material.dart';
import 'package:to_do/pages/drawer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}