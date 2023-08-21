import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Task_Model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [
    TaskModel(name: 'Go To Gym', createdAt: DateTime.now()),
    TaskModel(name: 'Go Shopping', createdAt: DateTime.now()),
    TaskModel(name: 'Do HomeWork', createdAt: DateTime.now()),
    TaskModel(name: 'Do HomeWork', createdAt: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple[400],
      ),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Padding(
              // this is the padding between the tasks
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 139, 171, 225),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  // the padding inside the task
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tasks[index].name,
                        style: const TextStyle(color: Colors.black),
                      ),
                      Checkbox(
                        value: tasks[index].isDone,
                        onChanged: (a) {
                          setState(() {
                            tasks[index].isDone = !tasks[index].isDone;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: const Text(
            'Task',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            setState(() {
              tasks.add(TaskModel(name: "New Task", createdAt: DateTime.now()));
            });
          }),
    );
  }
}
