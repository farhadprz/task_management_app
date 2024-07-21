import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/providers/task_provider.dart';
import 'package:task_management_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Provider when you need to provide a single instance of an object that does not need to notify other parts of the app about changes.
    // Use ChangeNotifierProvider when you need to provide a state object that will change over time and you want to update the UI or other
    // parts of your app when these changes occur.
    return ChangeNotifierProvider(// It is used to provide and manage a class that extends ChangeNotifier.
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Task Management App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
