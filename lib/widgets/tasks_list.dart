import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (BuildContext context, taskData, child) {
      return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                taskTitle: taskData.tasks[index].name,
                checkboxCallback: (checkboxState) {
                  // setState(() {
                  //   widget.tasks[index].toggleDone();
                  // });
                });
          },
          itemCount: taskData.taskCount);
    });
  }
}
