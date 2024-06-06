import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

final ThemeData lightTheme =  ThemeData(
  useMaterial3: true,
  primaryColor: Color.fromARGB(255, 179, 227, 220),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
      // ···
      brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFFABE0D8), // Set light theme background color
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 48, 214, 198),
    ),
    
  ),
  scaffoldBackgroundColor:Colors.white,
  cardColor: Color(0xFFe4f5f2),
  textTheme: TextTheme(
    //Body Small
     bodySmall:GoogleFonts.montserrat(
       fontSize: 13,fontWeight: FontWeight.w600, color: Colors.yellow),
                
    //Body Medium
      bodyMedium: GoogleFonts.montserrat(
       fontSize: 20, color: Color.fromARGB(255, 11, 1, 58), fontWeight: FontWeight.w700),

    //Body Large
      bodyLarge: GoogleFonts.aBeeZee(
        fontSize: 26,  fontWeight: FontWeight.w800, color: const Color.fromARGB(255, 121, 121, 121)),

        ),

        inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color.fromARGB(255, 179, 227, 220), // Change the background color here
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none, // Remove the border side
    ),

  ),
      );

  


final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Color(0xFF004759),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
      // ···
      brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF004759), // Set light theme background color
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:  Color.fromARGB(255, 5, 13, 84),
    ),
    


  ),
  scaffoldBackgroundColor:Color(0xFF0D233A),
  cardColor: Color(0xFF042D40),
    textTheme: TextTheme(
    //Body Small
     bodySmall:GoogleFonts.montserrat(
       fontSize: 13,fontWeight: FontWeight.w600, color: Colors.red),
                
    //Body Medium
      bodyMedium: GoogleFonts.montserrat(
       fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),

    //Body Large
      bodyLarge: GoogleFonts.aBeeZee(
        fontSize: 26,  fontWeight: FontWeight.w800, color: Colors.white),

        ),
        inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFF004759), // Change the background color here
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none, // Remove the border side
    ),
  ),
 
);


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
                'assets/cubtale logo1.png', // Ensure you have a logo image in the assets folder
                height: 60, // Adjust the height as needed
              ),
              SizedBox(width: 10), // Adjust spacing as needed
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
