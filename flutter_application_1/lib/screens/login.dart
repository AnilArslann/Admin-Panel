import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'home.dart';
import '../login_bar.dart';
import '../theme.dart';
import '../page_transition.dart';


class LoginPage extends StatefulWidget {
  final bool isDarkTheme;
  final VoidCallback onToggleTheme;

  LoginPage({required this.isDarkTheme, required this.onToggleTheme});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  void _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog('Ooops Something went wrong!');
      return;
    }


    /*final response = await http.post(
      Uri.parse('https://p7y0pin0cl.execute-api.us-east-2.amazonaws.com/default/AdminPanelLogin'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final Map<String, dynamic> data = jsonDecode(response.body);
      print('Login successful: ${data['token']}');
    } else {
      // If the server did not return a 200 OK response, print an error message
      print('Failed to login: ${response.statusCode}');
    }
    */

    const String token = 'test_token';
    final DateTime now = DateTime.now();
    final DateTime expiryDate = now.add(const Duration(days: 14));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('expiryDate', expiryDate.toIso8601String());
    Navigator.pushReplacement(context,NoTransitionPageRoute(page: HomePage()));
                        

  }

void _showErrorDialog(String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).cardColor, // Set the background color
        content: Container(
          height: 500,
          width: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              Image.asset('assets/oops_icon.png'),
              const SizedBox(height: 48),
              Text(
                message,
                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 32),
              Center(
                // Wrap the ElevatedButton with Center
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).cardColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0), 
                        topRight: Radius.circular(8.0), 
                        bottomRight: Radius.circular(24.0), 
                        bottomLeft: Radius.circular(24.0), 
                      ),
                      side: BorderSide(
                        color: Color.fromARGB(255, 233, 117, 156),
                        width: 3,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Container( // Wrap the text with a container to set padding
                    padding:const  EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Adjust padding as needed
                    child: const Text(
                      'Try Again',
                      style: TextStyle(fontSize: 20,color:Color.fromARGB(255, 194, 84, 121)), // Adjust text size as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDarkTheme: widget.isDarkTheme,
        onToggleTheme: widget.onToggleTheme,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: 800,
            height: 500,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(32.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('UserName', style: TextStyle(fontSize: 20)),
                ),
                TextField(
                  controller: _usernameController,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password', style: Theme.of(context).textTheme.bodyMedium),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 70),
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text('Login', style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}