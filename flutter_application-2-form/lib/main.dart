import 'package:application1/Sign_IN.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TextFiledd(),
  ));
}

Icon oricon(int namber) {
  if (namber == 1) {
    return Icon(Icons.visibility_off);
  } else {
    return Icon(Icons.visibility_sharp);
  }
}

class TextFiledd extends StatefulWidget {
  const TextFiledd({super.key});

  @override
  State<TextFiledd> createState() => _TextFileddState();
}

class _TextFileddState extends State<TextFiledd> {
  TextEditingController name = new TextEditingController();
  TextEditingController pasword = new TextEditingController();

  var TorF = true;
  int iconnumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sign in "),
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: name,
                maxLength: 15,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue,
                    labelText: "Username",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    hintText: "Username",
                    prefixIcon: Icon(
                      Icons.person,
                      size: 75,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 7,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 7))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextField(
                controller: pasword,
                decoration: InputDecoration(
                    filled: true, //true حط  fillcolor عشان تفعل ال
                    fillColor: Colors.blue,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    hintText: "Your Password",
                    //prefixIcon: Icon(Icons.person,size: 30,),
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          if (TorF == true) {
                            TorF = false;

                            iconnumber = 1;
                          } else if (TorF == false) {
                            iconnumber = 2;
                            TorF = true;
                          }
                        });
                      },
                      icon: oricon(iconnumber),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey, width: 7)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 7),
                    )),
                obscureText: TorF,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Welcome(
                          paswordd: pasword.text, uernamee: name.text)));
                },
                child: Text("GO to welcome"))
          ],
        ),
      )),
    );
  }
}
