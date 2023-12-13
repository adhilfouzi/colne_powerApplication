import 'package:flutter/material.dart';
import 'package:flutter_application_3_power/homeScreen.dart';
import 'package:flutter_application_3_power/like.dart';
import 'package:flutter_application_3_power/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _usernameControler = TextEditingController();
  final _passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'asset/Image/6534602.jpg',
                  height: 300,
                ),
                TextField(
                  controller: _usernameControler,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.android),
                    iconColor: Colors.green,
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green, // Border color when focused
                        width: 2.0, // Border width
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _passwordControler,
                  obscureText: true, //Hide PassWord
                  decoration: InputDecoration(
                    icon: const Icon(Icons.security),
                    iconColor: Colors.blueAccent,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green, // Border color when focused
                        width: 2.0, // Border width
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      logincheck(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 255, 255, 1),
                      minimumSize: Size(310, 48),
                      // Set the desired width and height
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      signup(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromRGBO(168, 249, 169, 0.75),
                      minimumSize: Size(310, 48),
                      // Set the desired width and height
                    ),
                    child: const Text(
                      'Signin',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Likepage()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logincheck(ctx) async {
    final username = _usernameControler.text;
    final password = _passwordControler.text;
    if (username == 'Admin' && password == '123') {
      final sharedPrefer = await SharedPreferences.getInstance();
      await sharedPrefer.setBool(sharedPreferences, true);

      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const Homescreen()));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(
          content: Text('Wrong value entered, please check.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(16),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void signup(ctxr) {
    showDialog(
        context: ctxr,
        builder: (BuildContext ctrx) {
          return AlertDialog(
            title: const Text('Hello'),
            content: const Text("Contact Admin \nFor Create An Account"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctxr).pop();
                  },
                  child: const Text('Close')),
            ],
          );
        });
  }
}
