import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'search_email.dart';
import 'search_date.dart';
import 'login.dart';
import '../home_bar.dart';

class SearchById extends StatefulWidget {
  @override
  _SearchByIdState createState() => _SearchByIdState();
}

class _SearchByIdState extends State<SearchById> {
   bool showInfo = false;
  String infoText = '';

  void performSearch(String email) {
    // Simulate a search operation
    setState(() {
      showInfo = true;
      infoText = 'Showing results for: $email'; // Update with actual search results
    });
  }
  Future<void> _logout(BuildContext context) async {
    bool _isDarkTheme = (ThemeMode.system==ThemeMode.dark);
    void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }
    // Delete the token from local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('expiryDate');

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(isDarkTheme: (ThemeMode.system==ThemeMode.dark), onToggleTheme: (){})));

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          width: 800,
          height: 600,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Search by Id',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Id',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onSubmitted: (value) {
                        performSearch(value);
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      performSearch('sample@example.com');
                    },
                    child: Text('Search'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (showInfo)
                Column(
                  children: [
                    if (Theme.of(context).brightness == Brightness.dark)
                      Image.asset('assets/profile_image_dark.png', height: 200)
                    else
                      Image.asset('assets/profile_image_light.png', height: 200),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [Text(
                                'Name:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                'Olivia',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),],),
                              
                              SizedBox(height: 10),
                              Row(children: [ Text(
                                'Surname:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                'Starkey',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),],),
                             
                              SizedBox(height: 10),
                              Row(children:[Text(
                                'Verified:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                'Yes',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),]),
                              
                            ],
                          ),
                        ),
                        SizedBox(width: 50), 
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children:[
                              Text(
                                'Email:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                'oliviastarkey@gmail.com',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),]),
                              SizedBox(height: 10),
                              Row(children: [Text(
                                'Creation Date:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                '01/11/2023',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),],),
                              
                              SizedBox(height: 10),
                              Row(children:[Text(
                                'Account Id:',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                              Text(
                                '123456',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
                              ),]),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
