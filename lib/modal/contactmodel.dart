import 'package:contact_db/database/dbhelper.dart';
import 'package:flutter/material.dart';
class ContactModel{
  int? id;
  late String name;
  late String imageurl;
  late int number;

  ContactModel({this.id,required this.name,required this.number,required this.imageurl});

  ContactModel.frommap(Map<String,dynamic>map){
   if(map[columnId]!=null){
     this.id=map[columnId];
   }
   this.name=map[columnName];
   this.number=map[columnNumber];
   this.imageurl=map[columnImage];
  }
  Map<String,dynamic>tomap(){
    Map<String,dynamic>map={};
    if(map[columnId]!=null){
      map[columnId]=this.id;
    }
    map[columnName]=this.name;
    map[columnNumber]=this.number;
    map[columnImage]=this.imageurl;
    return map;

  }

  }

