import 'package:flutter/material.dart';
import '../../Model/TaskSave/index.dart';
import '../../ViewModel/TaskAlert/index.dart';

class TablaWidget extends StatelessWidget {
  final String title;
  final List<Task> tasks;
  final TaskAlertViewModel viewModel;

  const TablaWidget({
    super.key,
    required this.title,
    required this.tasks,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return const Center(
        child: Text(
          'No hay tareas agregadas',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ListTile(
            title: Text(
              task.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: task.description.isNotEmpty
                ? Text(task.description)
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    viewModel.showAddTaskDialog(context, task: task, index: index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    viewModel.deleteTask(context, index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
