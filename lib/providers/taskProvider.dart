import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Task_Model.dart';

class TaskProvider with ChangeNotifier {
  List<TaskModel> completedTasks = [];

  List<TaskModel> waitingTasks = [];

  addTask(TaskModel taskModel) {
    waitingTasks.add(taskModel);
    notifyListeners();
  }

  changeStatus(TaskModel taskModel) {
    if (taskModel.isDone) {
      taskModel.isDone = !taskModel.isDone;
      waitingTasks.add(taskModel);
      completedTasks.remove(taskModel);
    } else {
      taskModel.isDone = !taskModel.isDone;
      completedTasks.add(taskModel);
      waitingTasks.remove(taskModel);
    }
    notifyListeners();
  }
}
