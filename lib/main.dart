import 'package:flutter/material.dart';
import 'screens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RestMeal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Oxygen"
      ),
      home:SplashScreen(),
    );
  }
}
