import 'package:flutter/material.dart';

class TaskViewModel extends ChangeNotifier {
  final List<String> _tasks = [];
   final TextEditingController titleController = TextEditingController();
  final TextEditingController taskController = TextEditingController();

  List<String> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(title);
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
                  addTask(taskController.text.trim());
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
