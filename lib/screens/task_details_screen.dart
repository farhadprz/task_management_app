import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/models/task.dart';
import 'package:task_management_app/providers/task_provider.dart';
import 'package:task_management_app/screens/edit_task_screen.dart';

class TaskDetailsScreen extends StatelessWidget {
  Task task;

  TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        actions: [
          IconButton(
            onPressed: () async {
              final result =
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditTaskScreen(task: task)));
              if(result == true){
                Provider.of<TaskProvider>(context, listen: false).fetchTasks();
              }
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Provider.of<TaskProvider>(context, listen: false).deleteTask(task.id!);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<TaskProvider>(
          builder: (context, taskProvider, child){
            //necessary when, back from edit_task_screen
            task = taskProvider.tasks.firstWhere((element) => element.id == task.id);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Title', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(task.title),
                const SizedBox(
                  height: 16.0,
                ),
                const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(task.description),
              ],
            );
          },
        ),
      ),
    );
  }
}