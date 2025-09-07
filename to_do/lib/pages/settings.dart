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
                subtitle: Text(
                  'Toggle between light and dark theme',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                  ),
                ),
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
            // Coming Soon Section
            Center(
              child: Text(
                "Lefty Mode and signin options coming soon",
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}