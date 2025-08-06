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
    notifyListeners();
  }

  void deleteTask(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Eliminación'),
          content: const Text('¿Estás seguro de que deseas eliminar esta tarea?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Eliminar'),
              onPressed: () {
                _taskBox.deleteAt(index);
                notifyListeners();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void updateTask(int index, String title, String description) {
    final task = _taskBox.getAt(index);
    if (task != null) {
      task.title = title;
      task.description = description;
      task.save();
      notifyListeners();
    }
  }

  void showAddTaskDialog(BuildContext context, {Task? task, int? index}) {
    titleController.text = task?.title ?? '';
    taskController.text = task?.description ?? '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(task == null ? 'Añadir Nueva Tarea' : 'Editar Tarea'),
          contentPadding: const EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Título de la tarea'),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 4,
                controller: taskController,
                decoration: const InputDecoration(labelText: 'Descripción de la tarea'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                titleController.clear();
                taskController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(task == null ? 'Agregar' : 'Guardar'),
              onPressed: () {
                if (titleController.text.trim().isNotEmpty) {
                  if (task == null) {
                    addTask(titleController.text.trim(), taskController.text.trim());
                  } else {
                    updateTask(index!, titleController.text.trim(), taskController.text.trim());
                  }
                  titleController.clear();
                  taskController.clear();
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
