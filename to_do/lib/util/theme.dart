import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  // Define colors for light and dark modes
  Color get primaryColor => _isDarkMode ? Colors.white : Colors.black;
  Color get secondaryColor => _isDarkMode ? Colors.black : Colors.white;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notify all listeners of the change
  }
}
ThemeData getLightTheme(ThemeProvider themeProvider) {
  return ThemeData(
    primaryColor: themeProvider.primaryColor,
    scaffoldBackgroundColor: themeProvider.secondaryColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: themeProvider.primaryColor),
      bodyMedium: TextStyle(color: themeProvider.primaryColor),
    ),
    // Add other theme properties as needed (e.g., buttonTheme, appBarTheme)
  );
}

ThemeData getDarkTheme(ThemeProvider themeProvider) {
  return ThemeData(
    primaryColor: themeProvider.primaryColor,
    scaffoldBackgroundColor: themeProvider.secondaryColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: themeProvider.primaryColor),
      bodyMedium: TextStyle(color: themeProvider.primaryColor),
    ),
    // Add other theme properties as needed
  );
}