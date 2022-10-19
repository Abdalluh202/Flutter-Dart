import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  String name, emali, phone;
  WelcomePage({required this.name, required this.emali, required this.phone});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: ${name}'),
              Text('Emali: ${emali}'),
              Text('phone: ${phone}'),
             
            ],
          ),
        ),
      ),
    );
  }
}
