import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 230, 248),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.settings, size: 160.0, color: Colors.white)],
        ),
      ),
    );
  }
}
