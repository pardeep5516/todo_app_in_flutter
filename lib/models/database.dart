import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];
  final _todo = Hive.box('todo');
  void createInitialData() {
    todoList = [
      ['Coding', false],
      ['Movie', false]
    ];
  }

  void loadData() {
    todoList = _todo.get("TODOLIST");
  }

  void updateData() {
    _todo.put("TODOLIST", todoList);
  }
}
