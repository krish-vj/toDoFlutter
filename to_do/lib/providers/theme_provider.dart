import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  late Box _box;
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    _box = await Hive.openBox('theme_box');
    _isDarkMode = _box.get('isDarkMode', defaultValue: false);
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _box.put('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  ThemeData get themeData {
    return _isDarkMode ? _darkTheme : _lightTheme;
  }

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
    ),
    cardColor: Colors.white,
    dividerColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.black),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.grey,
      surface: Colors.white,
      background: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
    ),
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    cardColor: Colors.black,
    dividerColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.black,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.grey,
      surface: Colors.black,
      background: Colors.black,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
    ),
  );
}