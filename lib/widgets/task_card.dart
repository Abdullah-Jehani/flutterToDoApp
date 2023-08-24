import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Task_Model.dart';
import 'package:flutter_application_1/screens/detailed_task_screen.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskModel});

  final TaskModel taskModel;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailedTaskScreen(taskModel: widget.taskModel)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: ListTile(
          title: Text(
            widget.taskModel.name,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle:
              Text(widget.taskModel.createdAt.toString().substring(0, 10)),
          trailing: Checkbox(
              value: widget.taskModel.isDone,
              onChanged: (a) {
                setState(() {
                  widget.taskModel.isDone = !widget.taskModel.isDone;

                  // waitingTasks.add(completedTasks[index]);
                  // completedTasks.remove(completedTasks[index]);
                });
              }),
        ),
      ),
    );
  }
}
