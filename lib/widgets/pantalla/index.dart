import 'package:flutter/material.dart';
import '../Button/index.dart';
import '../Tabla/index.dart';
import '../../ViewModel/TaskAlert/index.dart';

class PantallaHome extends StatefulWidget {
  const PantallaHome({super.key});

  @override
  State<PantallaHome> createState() => _PantallaHomeState();
}

class _PantallaHomeState extends State<PantallaHome> {
  late TaskAlertViewModel _taskViewModel;

  @override
  void initState() {
    super.initState();
    _taskViewModel = TaskAlertViewModel();
    _taskViewModel.addListener(_onTasksChanged);
  }

  @override
  void dispose() {
    _taskViewModel.removeListener(_onTasksChanged);
    _taskViewModel.dispose();
    super.dispose();
  }

  void _onTasksChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue, // Azulito
        title: const Text(
          'Mi Lista de Tareas',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.italic,
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ButtonWidget(
              texto: 'Añadir',
              onPressed: () => _taskViewModel.showAddTaskDialog(context),
              color: Colors.blue,
              textColor: Colors.white,
              fontSize: 18.0,
              position: 'right',
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TablaWidget(
                title: 'Tareas Pendientes',
                tasks: _taskViewModel.tasks,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
