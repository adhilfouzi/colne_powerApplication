import 'package:flutter/material.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    ));
  }
}
