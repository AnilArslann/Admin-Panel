import 'package:flutter/material.dart';
import 'search_id.dart';
import 'search_date.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SearchByMail extends StatefulWidget {
  @override
  _SearchByMailState createState() => _SearchByMailState();
}

class _SearchByMailState extends State<SearchByMail> {
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
            icon: Icon(Icons.menu,size: 40,color: Colors.teal,),
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
                  'Search by Mail',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
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
