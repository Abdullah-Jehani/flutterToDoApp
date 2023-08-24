import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Task_Model.dart';
import 'package:flutter_application_1/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskNameController = TextEditingController();

  List<TaskModel> completedTasks = [];

  List<TaskModel> waitingTasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[500],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: Colors.blue[500],
              child: const TabBar(
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    text: 'Waited Tasks',
                  ),
                  Tab(
                    text: 'Completed Tasks',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.all(24),
                    itemCount: waitingTasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(taskModel: waitingTasks[index]);
                    },
                  ),
                  ListView.builder(
                      itemCount: completedTasks.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          taskModel: completedTasks[index],
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: taskNameController,
                          decoration: const InputDecoration(
                            hintText: 'Task Name',
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (taskNameController.text.length > 0) {
                                    waitingTasks.add(TaskModel(
                                        name: taskNameController.text,
                                        createdAt: DateTime.now()));
                                    taskNameController.clear();
                                  }
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Confirm'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        backgroundColor: Colors.blue,
        child: const Text(
          'Add',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
