import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widgets/button.dart';

class AddTask extends StatelessWidget {
  late String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff263238),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22.0),
            topRight: Radius.circular(22.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 25,
                    fontWeight: FontWeight.w900),
              ),
              TextField(
                onChanged: (text) {
                  newTaskTitle = text;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Type task here',
                  hintStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Button(
                  buttonText: 'DONE',
                  onPressed: () {
                    // final task = Task(name: newTaskTitle);
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.blueGrey)
            ],
          ),
        ),
      ),
    );
  }
}
