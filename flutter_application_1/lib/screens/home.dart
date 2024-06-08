import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_bar.dart';
import 'login.dart';
import 'search_email.dart';
import 'search_id.dart';
import 'search_date.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isHorizontal = true;
  

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
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Image.asset(
            'assets/cubtale logo1.png',
            height: 60,
          ),
          SizedBox(width: 10),
          Image.asset(
            'assets/Cubtale watermark.png',
            height: 60,
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchByMail()),
              );
            },
            child: Text('Search By Mail', style: TextStyle(color: Colors.teal,fontSize: 20,fontWeight: FontWeight.bold)),
          ),
          Image.asset('assets/vertical_divider.png', width:10),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchById()),
              );
            },
            child: Text('Search By ID',style: TextStyle(color: Colors.teal,fontSize: 20,fontWeight: FontWeight.bold)),
          ),
          Image.asset('assets/vertical_divider.png', width:10),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SearchByDate()),
              );
            },
            child: Text('Search By Date',style: TextStyle(color: Colors.teal,fontSize: 20,fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              showDialog(
                barrierColor: Colors.black.withOpacity(0.5),
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    content: Container(
                      width: 300,
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                'assets/profile_image_light.png'), // Replace with your profile image path
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name:',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                'Olivia Starkey',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.teal),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Role:',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                'Manager',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.teal),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              _logout(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                            ),
                            child: Text(
                              'Logout',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
    
    ],
  ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 32.0,
          mainAxisSpacing: 32.0,
          childAspectRatio: 5 / 2, // Adjust the aspect ratio to make the cards smaller
          children: [
            InfoCard(
              title: 'TODAYS NEW USERS',
              content: Column(
                children: [
                  UserRow(name: 'John Doe', email: 'johndoe@gmail.com'),
                  UserRow(name: 'Sammy Johnson', email: 'sammyjohnson@gmail.com'),
                  UserRow(name: 'Pricila Miller', email: 'pricilamiller@gmail.com'),
                ],
              ),
            ),
            InfoCard(title: 'Dummy Card 1', content: Container()),
            InfoCard(title: 'Dummy Card 2', content: Container()),
            InfoCard(title: 'Dummy Card 3', content: Container()),
          ],
        ),
      ),
    );
  }

  void showCustomMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Custom Menu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/cubtale logo1.png', height: 60),
              SizedBox(height: 10),
              Text('Additional information'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class CustomThreeLinesIcon extends StatefulWidget {
  @override
  _CustomThreeLinesIconState createState() => _CustomThreeLinesIconState();
}

class _CustomThreeLinesIconState extends State<CustomThreeLinesIcon> {
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          rotationAngle = rotationAngle == 0.0 ? 1.5708 : 0.0;
        });
      },
      child: Transform.rotate(
        angle: rotationAngle, // Rotate 90 degrees if rotationAngle is 1.5708
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              height: 4.0,
              width: 24.0,
              color: Colors.teal,
            );
          }),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final Widget content;

  InfoCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: Colors.teal[800],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.teal[700]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}

class UserRow extends StatelessWidget {
  final String name;
  final String email;

  UserRow({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0), // Adjust the vertical padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(color: Colors.white, fontSize: 10)), // Adjust the font size
          Text(email, style: TextStyle(color: Colors.white, fontSize: 10)), // Adjust the font size
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 10), // Adjust the icon size
        ],
      ),
    );
  }
}