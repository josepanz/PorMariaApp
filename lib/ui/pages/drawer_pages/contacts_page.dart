import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  static const String routeName = "/contacts";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos'),
      ),
      backgroundColor: Color.fromARGB(255, 204, 230, 248),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.contacts, size: 160.0, color: Colors.white)],
        ),
      ),
    );
  }
}
