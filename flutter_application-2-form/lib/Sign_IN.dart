import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  String paswordd, uernamee;
  Welcome({required this.paswordd, required this.uernamee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Username: ${uernamee}'),
          Text('Password: ${paswordd}'),
        ],
      )),
    );
  }
}
