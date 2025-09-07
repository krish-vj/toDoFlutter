import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text(
              'My App Drawer',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              "To Do's",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/todos');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Theme.of(context).iconTheme.color,
            ),
            title: Text(
              'Developer',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/developer');
            },
          ),
        ],
      ),
    );
  }
}