import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/search_email.dart'; // Import the other screens
import 'screens/search_id.dart';
import 'screens/search_date.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkTheme = (ThemeMode.system == ThemeMode.dark);
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    setState(() {
      _isLoggedIn = token != null;
    });
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Toggle Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      initialRoute: _isLoggedIn ? '/home' : '/login',
      routes: {
        '/login': (context) => LoginPage(
          isDarkTheme: _isDarkTheme,
          onToggleTheme: _toggleTheme,
        ),
        '/home': (context) => HomePage(),
        '/search_email': (context) => SearchByMail(),
        '/search_id': (context) => SearchById(),
        '/search_date': (context) => SearchByDate(),
      },
    );
  }
}
