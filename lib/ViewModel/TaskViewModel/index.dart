import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../Model/TaskSave/index.dart';

class TaskViewModel extends ChangeNotifier {
  final Box<Task> _taskBox = Hive.box<Task>('tasks');

  List<Task> get tasks => _taskBox.values.toList();

  void addTask(String title) {
    final task = Task(title: title);
    _taskBox.add(task);
    notifyListeners();
  }
}