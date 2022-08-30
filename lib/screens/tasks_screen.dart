import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/add_task_screen.dart';
import 'package:todo_flutter/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(
              left: 30.0, top: 60.0, right: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30.0,
                child: Icon(
                  Icons.list,
                  size: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Todo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${Provider.of<TaskData>(context).taskCount} tasks',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: const TaskList(),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTaskScreen())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
