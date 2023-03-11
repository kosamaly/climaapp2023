// @dart=2.9
import 'package:clima202/screens/loading-screen.dart';
import 'package:clima202/screens/location-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => LoadingScreen(),
        "/loading-screen": (context) => LocationScreen(),
      },
    );
  }
}
