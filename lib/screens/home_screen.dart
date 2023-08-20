import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Task_Model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [
    TaskModel(name: 'Buy milk'),
    TaskModel(name: 'Buy eggs'),
    TaskModel(name: 'Buy bread'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
