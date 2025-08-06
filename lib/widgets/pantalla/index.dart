import 'package:flutter/material.dart';
import '../Button/index.dart';
import '../Tabla/index.dart';
import '../../ViewModel/TaskAlert/index.dart';

class PantallaHome extends StatelessWidget {
  const PantallaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue, // Azulito
        title: Text(
          'Mi Lista de Tareas',
          style: const TextStyle(
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
              onPressed: () => TaskViewModel().showAddTaskDialog(context),
              color: Colors.blue,
              textColor: Colors.white,
              fontSize: 18.0,
              position: 'right',
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TablaWidget(
                title: 'Tareas Pendientes',
                items: [
                  'Comprar víveres',
                  'Lavar el coche',
                  'Estudiar Flutter',
                  'Hacer ejercicio',
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
