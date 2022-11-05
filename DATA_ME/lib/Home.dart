import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  List list = [];

//----------read Data------------------
  Future readData() async {
    var url = "http://192.168.100.17/project/fun/readData.php";

    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var red = jsonDecode(res.body);

      setState(() {
        list.addAll(red);
      });
      print(list);
    }
  }
//--------Add User in Data-------------

  Future AddData() async {
    var url = "http://192.168.100.17/project/fun/AddData.php";
    var res = await http
        .post(Uri.parse(url), body: {'name': name.text, 'email': email.text});

    // if (res.statusCode == 200) {
    //   var red = jsonDecode(res.body);
    //   print(red);
    // }
  }

//--------Edit User in Data-------------
  Future Editdata(ID) async {
    var url = "http://192.168.100.17/project/fun/EditData.php";

    var ress = await http.post(Uri.parse(url),
        body: {'ID': ID, 'name': name.text, 'email': email.text});

    if (ress.statusCode == 200) {
      print(jsonDecode(ress.body));
      //print(ID);
    } else
      print(email);
    // print(ID);
  }

//--------Delet User in Data-------------
  Future DeletData(ID) async {
    var url = "http://192.168.100.17/project/fun/DeletData.php";
    var res = await http.post(Uri.parse(url), body: {'ID': ID});
    if (res.statusCode == 200) {
      print(jsonEncode(res.body));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() async {
    await readData();
  }

//--------Delet all  Data-------------
  Future Deletall() async {
    var url = "http://192.168.100.17/project/fun/Deletall.php";
    var res = await http.post(Uri.parse(url));
  }

//--------Add User in Data-------------
  AddUser() {
    showDialog(
        context: context,
        builder: ((context) {
          return Center(
            child: AlertDialog(
              content: Container(
                width: 200,
                height: 500,
                child: Column(
                  children: [
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "name",
                      ),
                    ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "email",
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (() {
                          setState(() {
                            print(name.text);
                            print(email.text);
                            AddData();
                            Navigator.pop(context);
                          });
                        }),
                        child: Text("Send"))
                  ],
                ),
              ),
            ),
          );
        }));
  }

//--------Edit User in Data-------------
  EditUser(ID) {
    showDialog(
        context: context,
        builder: ((context) {
          return Center(
            child: AlertDialog(
              content: Container(
                width: 200,
                height: 500,
                child: Column(
                  children: [
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "name",
                      ),
                    ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "email",
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (() {
                          setState(() {
                            // print(name.text);
                            // print(email.text);
                            // print(ID);
                            Editdata(ID);
                            Navigator.pop(context);
                            //
                          });
                        }),
                        child: Text("Send"))
                  ],
                ),
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("project"),
        actions: [
          IconButton(
              onPressed: (() {
                AddUser();
              }),
              icon: Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
            child: Container(
          
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 304,
                    height: 200,
                    color: Colors.blueAccent,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              Deletall();
                              Navigator.pop(context);
                            });
                          },
                          icon: Icon(Icons.delete_rounded)),
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Text(list[index]['name']
                        .toString()
                        .substring(0, 2)
                        .toUpperCase()),
                  ),
                  title: Text(list[index]['name']),
                  subtitle: Text(list[index]['email']),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: (() {
                            EditUser(list[index]['ID']);
                          }),
                          icon: Icon(
                            Icons.edit,
                            color: Colors.teal,
                          ),
                        ),
                        IconButton(
                          onPressed: (() {
                            setState(() {
                              DeletData(list[index]['ID']);
                            });
                          }),
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}
