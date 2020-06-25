import 'package:flutter/material.dart';
import 'package:jsonstorage/fileobj.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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

    FileOp fp = new FileOp(filename: "smaple2.json");

  TextEditingController keyController = new TextEditingController();
  TextEditingController valueController = new TextEditingController();
  TextEditingController value2Controller = new TextEditingController();

  File jsonfile;
  Directory dir;
  String fileName = "samplejson.json";
  bool fileExist = false;
  Map<String, dynamic> fileContent;

  
  // @override
  // void initState() {
  //   getApplicationDocumentsDirectory().then((Directory directory) {
  //       dir = directory;
  //       jsonfile = new File(dir.path + "/" + fileName);
  //       fileExist = jsonfile.existsSync();
  //       if (fileExist)  this.setState(() => fileContent = json.decode(jsonfile.readAsStringSync()));
  //   });
  //   super.initState();
  // }

  // void writeToFile(String key, String value){
  //   print("Printing to a file");
  //   Map<String, dynamic> content = {key: value};
  //   if(fileExist){
  //     Map<String, dynamic> jsonContent = json.decode(jsonfile.readAsStringSync());
  //     jsonContent.addAll(content);
  //     jsonfile.writeAsStringSync(json.encode(jsonContent));
  //   }
  //   else{
  //     print("file doesn't exist");
  //     createFile(content);
  //   }
  //   this.setState(() => fileContent = json.decode(jsonfile.readAsStringSync()));
  // }


  // File createFile(Map<String, dynamic> content){
  //     print("Creating a file");
  //     File file = new File(dir.path + "/" + fileName);
  //     file.createSync();
  //     fileExist = true;
  //     file.writeAsStringSync(json.encode(content));
  //     return file;
  // }


  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Column(

        children: <Widget>[
          new Text("Something something"),
          new Text(fileContent.toString()),
          new Text("Something something"),

          new Padding(padding: EdgeInsets.all(8)),

          new TextField(
            controller: keyController,
          ),

          new TextField(
            controller: valueController,
          ),

          new TextField(
            controller: value2Controller,
          ),

          new Padding(padding: EdgeInsets.all(8)),

          new RaisedButton(
            child: Text("Add key, value pair"),
            onPressed: () async {                  

              print(fp.jsonfile.existsSync());
              fp.createFile();
              fp.writeToFile({
                "post": {
                  "endpoint": keyController.text,
                  "data": [
                    {
                      valueController.text: value2Controller.text
                    },
                  ],
                },
              });

              setState(() {
                fileContent = json.decode(fp.jsonfile.readAsStringSync());
              });

              

            }
            
            )

        ],
      ),
      
    );
  }
}
