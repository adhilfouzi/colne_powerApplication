import 'package:flutter/material.dart';
import 'package:flutter_application_3_power/SplashScreen.dart';

const sharedPreferences = 'UserLoggedin';
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Power Design',
      theme: ThemeData(primaryColor: Colors.green),
      home: const SplashScreen(),
    );
  }
}
