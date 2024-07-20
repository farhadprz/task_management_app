import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/providers/task_provider.dart';
import 'package:task_management_app/screens/task_details_screen.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) => ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          final task = taskProvider.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskDetailsScreen(task: task)));
            },
          );
        },
      ),
    );
  }
}
