import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login.dart';
import 'screens/home.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Toggle Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: ThemeTogglePage(),
    );
  }
}

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? expiryDateStr = prefs.getString('expiryDate');

    if (token != null && expiryDateStr != null) {
      DateTime expiryDate = DateTime.parse(expiryDateStr);
      if (DateTime.now().isBefore(expiryDate)) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        return;
      }
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class ThemeTogglePage extends StatefulWidget {
  @override
  _ThemeTogglePageState createState() => _ThemeTogglePageState();
}

class _ThemeTogglePageState extends State<ThemeTogglePage> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? lightTheme : darkTheme,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
            title: Row(
            children: [
              Image.asset(
                'assets/cubtale logo1.png',
                height: 60, 
              ),
              SizedBox(width: 10),
              Image.asset('assets/Cubtale watermark.png', height: 60)
            ],
          ),

          actions: [
            IconButton(
              icon: Image.asset(
                _isDarkTheme ? 'assets/darkmode_icon.png' : 'assets/lightmode_icon.png',
                width: 60,
                height: 60,
              ),
              onPressed: _toggleTheme,
            ),
            Text(_isDarkTheme ? 'Dark Mode' : 'Light Mode', style: TextStyle(fontSize: 20)),
          ],

        ),
        body: Center(
          child: LoginPage()
        ),
      ),
    );
  }
}
