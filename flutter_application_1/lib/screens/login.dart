import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
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

    final response = await http.post(
      Uri.parse('https://your-auth-server.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
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
              SizedBox(height: 12),
              Image.asset('assets/oops_icon.png'),
              SizedBox(height: 48),
              Text(
                message,
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 32),
              Center(
                // Wrap the ElevatedButton with Center
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0), // Adjust border radius for top-left corner
                        topRight: Radius.circular(8.0), // Adjust border radius for top-right corner
                        bottomRight: Radius.circular(24.0), // Adjust border radius for bottom-right corner
                        bottomLeft: Radius.circular(24.0), // Adjust border radius for bottom-left corner
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Adjust padding as needed
                    child: Text(
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
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor, // Set the background color
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
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
                  child:Text('UserName',style: TextStyle(fontSize: 20))),
                TextField(
                  controller: _usernameController,
                ),
                const SizedBox(height: 20),
                 Align(alignment: Alignment.centerLeft,
                child:  Text('Password',style:Theme.of(context).textTheme.bodyMedium)),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                 
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: _login,
                    child:  Text('Login',style:Theme.of(context).textTheme.bodyLarge),
                     style: ElevatedButton.styleFrom(
    fixedSize: Size(200, 70),
    backgroundColor: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Adjust the border radius here
      ),
  ),  

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
