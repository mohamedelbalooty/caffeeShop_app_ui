import 'package:caffe/screens/home_screen.dart';
import 'package:caffe/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'screens/coffee_cup_screen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CoffeeCupScreen.id: (context) => CoffeeCupScreen(),
        LocationScreen.id: (context) => LocationScreen(),
      },
      home: HomeScreen(),
    );
  }
}
