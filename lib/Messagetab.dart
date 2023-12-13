import 'package:flutter/material.dart';
import 'package:flutter_application_3_power/MessageScreen.dart';

class MessageTab extends StatelessWidget {
  MessageTab({super.key});
  final List<String> persons = [
    'Asif',
    'Farzin',
    'Shabil',
    'Shibil',
    'Adhil ali',
    'Favas',
    'Basheer'
  ];
  final List<String> message = [
    "Hey there! What's new in your world?",
    "Hi! How's your day going?",
    "What's up, friend? Got any fun plans for the weekend?",
    "Hey, long time no chat! How've you been?",
    "Hiya! Just wanted to drop a quick hello and see how you're doing.",
    "Hello! Hope you're having a fantastic day!",
    "Hey, guess what? I just tried a new coffee place, and it's amazing!",
    "Hi! Do you have any Netflix recommendations? I need a new show to binge",
    "What's cooking? I'm craving some good foodie advice.",
    "Hey, want to catch up over coffee sometime soon?",
  ];
  final List<String> time = [
    '22:25',
    '22:02',
    '20:18',
    '18:55',
    '18:09',
    '12:17',
    '10:37',
    '09:47',
    '08:33',
    '06:11',
    'Yesterday',
    'Yesterday',
    'Yesterday',
    'Yesterday',
    'Yesterday',
    'Sunday',
    'Sunday',
    'Saturday',
    'Saturday',
    'Friday',
  ];
  final List<String> image = [
    'asset/Image/User_1.png',
    'asset/Image/User_2.png',
    'asset/Image/User_3.png',
    'asset/Image/User_4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (ctrx, index) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    //tomessage(context, index);
                    popupclick(context, index);
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      image[index % image.length],
                    ),
                  ),
                  title: Text(
                    persons[index % persons.length],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(message[index % message.length],
                      style: const TextStyle(fontStyle: FontStyle.italic)),
                  trailing: Text(time[index % time.length]),
                )
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color.fromRGBO(7, 94, 84, 1),
          child: const Icon(
            Icons.message_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void tomessage(rtx, index) {
    Navigator.of(rtx).push(
      MaterialPageRoute(
        builder: (rtx) => MessageScreen(
          name: persons[index % persons.length],
          image: image[index % image.length],
        ),
      ),
    );
  }

  void popupclick(gtxr, index) {
    showDialog(
        context: gtxr,
        builder: (gtx) {
          return AlertDialog(
            title: const Text('Selected'),
            content: Text('Sslected ${persons[index % persons.length]}'),
          );
        });
  }
}
