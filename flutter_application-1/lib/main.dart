import 'package:flutter/material.dart';
import 'package:lecther9/WelcomePage.dart';

void main() {
  runApp(const MaterialApp());
}

// Padding TextFiled1(var name) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: TextField(
//       controller: name,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         labelText: 'Enter $name',
//       ),
//     ),
//   );
// }

class project extends StatefulWidget {
  @override
  State<project> createState() => _projectState();
}

class _projectState extends State<project> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _Phone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email',
              ),
            ),
          ),

          // TextFiled1(_name),
          // TextFiled1(_email),
          // TextFiled1(_Phone),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WelcomePage(
                        name: _name.text,
                        emali: _email.text,
                        phone: _Phone.text)));
              }),
              child: Text('GO to Welcome page '))
        ],
      ),
    );
  }
}
