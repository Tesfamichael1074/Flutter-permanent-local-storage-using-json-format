import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
class FileOp {

  String filename;
  Directory dir;
  File jsonfile;
  bool fileExist = false;

  FileOp({this.filename}){
    getExternalStorageDirectory().then((Directory directory) {
      this.dir = directory;
      createFile();
    });
  }

 

  void createFile(){
      print("Creating a file..........");
      this.jsonfile = new File(this.dir.path + "/" + this.filename);
      this.jsonfile.createSync();
      this.fileExist = true;
  }

  
  void writeToFile(var content){

    if(!this.fileExist){
      print("file doesn't exist, Creating file");
      createFile();
    }

    print("Writing to a file at => " + this.dir.path);
    this.dir.list().forEach((element) {
      print(element);
    });
    
    this.jsonfile.writeAsStringSync(json.encode(content));

  }




} 