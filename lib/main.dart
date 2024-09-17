import 'package:flutter/material.dart';
import 'package:app/screens/home/HomeScreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<ThemeData> themes = [
    ThemeData(
      primaryColor: Color(0xFF0077B3),
      scaffoldBackgroundColor: Color(0xFFE0F7FA),
      textTheme: TextTheme(
        displayMedium: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
      ),
    ),
    ThemeData(
      primaryColor: Color(0xFFFF6F61),
      scaffoldBackgroundColor: Color(0xFFFFF9E6),
      textTheme: TextTheme(
        displayMedium: TextStyle(color: Color(0xFF5D3F3F), fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Color(0xFF5D3F3F), fontSize: 16),
      ),
    ),
    ThemeData(
      primaryColor: Color(0xFF2ECC71),
      scaffoldBackgroundColor: Color(0xFFDFF9F2),
      textTheme: TextTheme(
        displayMedium: TextStyle(color: Color(0xFF2C3E50), fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Color(0xFF2C3E50), fontSize: 16),
      ),
    ),
    ThemeData(
      primaryColor: Color(0xFFA29BFE),
      scaffoldBackgroundColor: Color(0xFFFFF5E1),
      textTheme: TextTheme(
        displayMedium: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
      ),
    ),
    ThemeData(
      primaryColor: Color(0xFFC39BD3),
      scaffoldBackgroundColor: Color(0xFFEDEDED),
      textTheme: TextTheme(
        displayMedium: TextStyle(color: Color(0xFF3E2723), fontSize: 20, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Color(0xFF3E2723), fontSize: 16),
      ),
    ),
  ];

  int _selectedThemeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bengaluru Travel App[BTA]',
      theme: themes[_selectedThemeIndex],
      home: HomeScreen(
        onThemeChanged: (index) {
          setState(() {
            _selectedThemeIndex = index;
          });
        },
      ),
    );
  }
}