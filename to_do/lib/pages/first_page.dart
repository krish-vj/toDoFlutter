import 'package:flutter/material.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("first page"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.cyan,
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.logo_dev, size: 50,)), 
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {Navigator.pop(context); Navigator.pushNamed(context, '/home'); },

            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () => Navigator.pushNamed(context, '/settings'),

              
            )
          ],
        ),
      ),
    ); 
  }
}