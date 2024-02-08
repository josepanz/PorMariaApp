import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 230, 248),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.person_2, size: 160.0, color: Colors.white)],
        ),
      ),
    );
  }
}
