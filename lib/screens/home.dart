// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/todo_tile.dart';

import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference box
  final _myBox = Hive.box('myBox');
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    // if its the first time
    super.initState();
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      // data already exist
      db.loadData();
    }
  }

  //text controller;
  final _controller = TextEditingController();

  // list of todo
  // List todoList = [
  //   [
  //     'Learn',
  //     false,
  //   ],
  //   [
  //     'Create',
  //     false,
  //   ]
  // ];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  //saveNewtask
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create new task
  void CreateNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //deletetask
  void DeleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            CreateNewTask();
          }),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (context) => DeleteTask(index),
          );
        },
      ),
    );
  }
}
