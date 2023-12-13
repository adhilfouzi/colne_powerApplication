import 'package:flutter/material.dart';
import 'package:flutter_application_3_power/CallTab.dart';
import 'package:flutter_application_3_power/Login.dart';
import 'package:flutter_application_3_power/Messagetab.dart';
import 'package:flutter_application_3_power/StatusTab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(18, 140, 126, 1),
          title: const Text(
            'MyMessage',
            style: TextStyle(
              color: Colors.white, // Title text color
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                exit(context);
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Message'),
              Tab(text: 'Status'),
              Tab(text: 'Call')
            ],
            unselectedLabelColor: Color.fromRGBO(
                255, 255, 255, 0.7), // Text color for unselected tabs
            labelColor: Colors.yellow, // Text color for selected tab
            indicatorColor: Colors.yellow, // Indicator line color
          ),
        ),
        body: TabBarView(
          children: [
            MessageTab(),
            const StatusTab(),
            const CallTab(),
          ],
        ),
      ),
    );
  }

  Future<void> exit(gtx) async {
    final sharedPrefer = await SharedPreferences.getInstance();
    await sharedPrefer.clear();

    Navigator.of(gtx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (gtx) => LoginScreen()), (route) => false);
    showDialog(
      context: gtx,
      builder: (gtx) {
        return const AlertDialog(
          title: Text('Logout Successfully'),
          content: Text(
            "You have been securely logged out. \nVisit us again soon!",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        );
      },
    );
  }
}
