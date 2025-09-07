import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/pages/drawer.dart';
import 'package:to_do/providers/theme_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dark Mode Toggle
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.dark_mode,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                // subtitle: Text(
                //   'Invert Colors',
                //   style: TextStyle(
                //     color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                //   ),
                // ),
                trailing: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey.withOpacity(0.3),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Lefty Mode Toggle
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.swap_horiz,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  'Lefty Mode',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                // subtitle: Text(
                //   'Move controls to the left side',
                //   style: TextStyle(
                //     color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                //   ),
                // ),
                trailing: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Switch(
                      value: themeProvider.isLeftyMode,
                      onChanged: (value) {
                        themeProvider.toggleLeftyMode();
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey.withOpacity(0.3),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            
          ],
        ),
      ),
    );
  }
}