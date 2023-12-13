import 'package:flutter/material.dart';
import 'package:flutter_application_3_power/Login.dart';
import 'package:flutter_application_3_power/homeScreen.dart';
import 'package:flutter_application_3_power/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() { super.initState();
    checkuserloggedin(context);
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/Image/6534602.jpg',
            height: 500,
          ),
          const CircularProgressIndicator(
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Future<void> checkuserloggedin(context) async {
    final sharedPrefer = await SharedPreferences.getInstance();
    final userlogged = sharedPrefer.getBool(sharedPreferences);

    if (userlogged == null || userlogged == false) {
      gotologin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Homescreen()));
    }
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
