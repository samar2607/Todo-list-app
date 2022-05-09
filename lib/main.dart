import 'package:flutter/material.dart';
import 'package:todoo/models/task_data.dart';
import 'package:todoo/screens/choose_location.dart';
import 'package:todoo/screens/home.dart';
import 'package:todoo/screens/loading.dart';
import 'screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => Loading(),
            '/home': (context) => Home(),
            '/location': (context) => ChooseLocation(),
            '/tasks': (context) => TasksScreen(),
          }

      ),
    );
  }
}