import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/screens/home.dart';

void main() async {
  await Hive.initFlutter(); 
 
  // open a box
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePage());
  }
}
