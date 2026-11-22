import 'package:flutter/material.dart';
import 'package:space/screens/home_screen.dart';
import 'package:space/screens/login_screen.dart';
import 'package:space/screens/planet_detail_screen.dart';
import 'core/planet_detail.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: 'loginScreen',
        routes: {
          'loginScreen': (context) => LoginScreen(),
          'homeScreen': (context) => HomeScreen(),
          'planetDetailScreen': (context) => PlanetDetailScreen(planetData: planetDetails[0],),
        },
    );
  }
}

