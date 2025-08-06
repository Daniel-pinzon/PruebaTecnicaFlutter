import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../Model/TaskSave/index.dart';

class TaskAlertViewModel extends ChangeNotifier {
  final Box<Task> _taskBox = Hive.box<Task>('tasks');
  final TextEditingController titleController = TextEditingController();
  final TextEditingController taskController = TextEditingController();

  List<Task> get tasks => _taskBox.values.toList();

  void addTask(String title, String description) {
    final task = Task(title: title, description: description);
    _taskBox.add(task);
    titleController.clear();
    taskController.clear();
    notifyListeners();
  }

  void showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Añadir Nueva Tarea'),
          contentPadding: const EdgeInsets.all(16.0), // Add padding around content
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: 'Título de la tarea'),


              ),
              const SizedBox(height: 10), // Add spacing between fields
              TextField(
                maxLines: 4,
                controller: taskController,
                 decoration: const InputDecoration(hintText: 'Descripción de la tarea'),
              ),
            ],
          ),
          actions: <Widget>[
             SizedBox(height: 20), // Add some spacing below the text field
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Agregar'),
              onPressed: () {
                if (titleController.text.trim().isNotEmpty) {
                  addTask(titleController.text.trim(), taskController.text.trim());
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
