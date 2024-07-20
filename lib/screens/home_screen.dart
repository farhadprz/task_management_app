import 'package:flutter/material.dart';
import 'package:task_management_app/screens/add_task_screen.dart';
import 'package:task_management_app/widgets/task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Management App')),
      body: const TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
