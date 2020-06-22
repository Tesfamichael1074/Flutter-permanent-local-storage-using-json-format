import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController keyController = new TextEditingController();
  TextEditingController valueController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Column(

        children: <Widget>[
          new Text("Something something"),
          new Text("Something something"),
          new Text("Something something"),

          new Padding(padding: EdgeInsets.all(8)),

          new TextField(
            controller: keyController,
          ),

          new TextField(
            controller: valueController,
          ),

          new Padding(padding: EdgeInsets.all(8)),

          new RaisedButton(
            child: Text("Add key, value pair"),
            onPressed: (){}
            
            )

        ],
      ),
      
    );
  }
}
