import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('333039'),
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
      backgroundColor: HexColor('333739'),
      //HexColor
      titleSpacing: 20.0,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'), //HexColor
        statusBarIconBrightness: Brightness.light,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    //HexColor
    unselectedItemColor:
        HexColor('251539'), // Color.fromARGB(255, 247, 190, 1),
    //FF453D3D
    elevation: 20,
    backgroundColor: HexColor('333739'),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: HexColor('333739'), //HexColor
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backgroundColor: Colors.white70,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.red,
        statusBarIconBrightness: Brightness.light,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    elevation: 20,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 18,
      decorationColor: Colors.black,
    ),
    
  ),
);
ThemeData lightTheme2 = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backgroundColor: Color.fromARGB(255, 53, 85, 135),
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 53, 85, 135),
        statusBarIconBrightness: Brightness.light,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Color.fromARGB(255, 26, 56, 104),
    selectedItemColor: Colors.white,
    unselectedItemColor: Color.fromARGB(255, 213, 209, 209),
    elevation: 20,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 18,
      decorationColor: Colors.black,
    ),
      subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),
  ),
);
