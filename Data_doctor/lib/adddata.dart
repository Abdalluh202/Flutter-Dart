import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdata.dart';
import 'dart:async';
import 'dart:convert';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  void addData() {
    var url = "http://192.168.100.17/my_store/adddata.php";

    http.post(url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  void error(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Data", style: TextStyle(fontFamily: "Netflix"),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Item Code",
                      hintStyle: TextStyle(fontFamily: "Netflix"),
                      labelText: "Item Code",
                      labelStyle: TextStyle(fontFamily: "Netflix")),
                ),
                new TextField(
                  controller: controllerName,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Item Name",
                      hintStyle: TextStyle(fontFamily: "Netflix"),
                      labelText: "Item Name"),
                ),
                new TextField(
                  controller: controllerPrice,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Price", labelText: "Price"),
                ),
                new TextField(
                  controller: controllerStock,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "Stock", labelText: "Stock"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.pop(context);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          //     builder: (BuildContext context) => new Home()));
                        },
                        child: new Text("Kembali", style: TextStyle(color: Colors.white),),
                        
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                        
                            addData();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                         

                          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          //     builder: (BuildContext context) => new Home()));
                        },
                        child: new Text(
                          "Add Data",
                          style: TextStyle(color: Colors.white), 
                        ),
                       
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
