import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor:const  Color.fromARGB(255, 179, 227, 220),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor:  Color(0xFFABE0D8), 
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 48, 214, 198),
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  cardColor:const  Color(0xFFe4f5f2),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.montserrat(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.yellow,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 20,
      color:const  Color.fromARGB(255, 11, 1, 58),
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: GoogleFonts.aBeeZee(
      fontSize: 26,
      fontWeight: FontWeight.w800,
      color: const Color.fromARGB(255, 121, 121, 121),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color.fromARGB(255, 179, 227, 220),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor:const  Color(0xFF004759),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF004759), // Set light theme background color
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:const  Color.fromARGB(255, 5, 13, 84),
    ),
  ),
  scaffoldBackgroundColor:const  Color(0xFF0D233A),
  cardColor:const  Color(0xFF042D40),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.montserrat(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.red,
    ),
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: GoogleFonts.aBeeZee(
      fontSize: 26,
      fontWeight: FontWeight.w800,
      color: Colors.white,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor:const  Color(0xFF004759),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
  ),
);
