import 'package:contact_db/database/dbhelper.dart';
import 'package:contact_db/screens/mycontact_home.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await DbHelper.instance.opendatabase();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyContacts(),
    );
  }
}
