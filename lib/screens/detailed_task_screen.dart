import 'package:flutter/material.dart';
import '../models/Task_Model.dart';

class DetailedTaskScreen extends StatefulWidget {
  const DetailedTaskScreen({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<DetailedTaskScreen> createState() => _DetailedTaskScreenState();
}

class _DetailedTaskScreenState extends State<DetailedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: widget.taskModel.isDone ? Colors.green : Colors.red,
        title: const Text(
          'Task Information',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.taskModel.name,
                style: TextStyle(
                    color: widget.taskModel.isDone ? Colors.green : Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 100),
              Text(
                'this Task Added on the Date of ${widget.taskModel.createdAt.toString().substring(0, 10).replaceAll('-', '/')} at The time ${widget.taskModel.createdAt.toString().substring(10, 16).replaceAll('-', '/')} ${widget.taskModel.isDone ? 'and its Completed' : 'And its Still Waiting'}',
                style: const TextStyle(fontSize: 18),
              ),
              Icon(
                widget.taskModel.isDone ? Icons.check : Icons.close,
                color: widget.taskModel.isDone ? Colors.green : Colors.red,
                size: size.width * 0.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
