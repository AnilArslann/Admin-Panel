import 'package:flutter/material.dart';
import 'screens/search_email.dart';
import 'screens/search_id.dart';
import 'screens/search_date.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login.dart';

class CustomHomeBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomHomeBarState createState() => _CustomHomeBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100); // Match the custom toolbar height
}

class _CustomHomeBarState extends State<CustomHomeBar> {
  Future<void> _logout(BuildContext context) async {
    bool isDarkTheme = (ThemeMode.system == ThemeMode.dark);

    void toggleTheme() {
      setState(() {
        isDarkTheme = !isDarkTheme;
      });
    }

    // Delete the token from local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('expiryDate');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(
          isDarkTheme: isDarkTheme,
          onToggleTheme: toggleTheme,
        ),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              const SizedBox(width: 10),
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
                child: const Text(
                  'Search By Mail',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset('assets/vertical_divider.png', width: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SearchById()),
                  );
                },
                child: const Text(
                  'Search By ID',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset('assets/vertical_divider.png', width: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SearchByDate()),
                  );
                },
                child: const Text(
                  'Search By Date',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.menu,
              size: 40,
              color: Colors.teal,
            ),
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
                         const  CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                'assets/profile_image_light.png'), // Replace with your profile image path
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name:',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                'Olivia Starkey',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.teal),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Role:',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                'Manager',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.teal),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              _logout(context);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                            ),
                            child: const Text(
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
    );
  }
}
