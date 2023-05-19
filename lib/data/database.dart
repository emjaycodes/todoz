import 'package:hive_flutter/adapters.dart';

class TodoDataBase {
  List todoList = [];
  final _myBox = Hive.box('myBox');

  // create initialdata; run if this the first time opening the app
  void createInitialData() {
    todoList = [
      ['Take a cup of coffee', false],
      ['Go to the gym', false]
    ];
  }

  // load data from database
  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  // upgrade the database
  void updateDataBase() {
    _myBox.put('TODOLIST', todoList);
  }
}
