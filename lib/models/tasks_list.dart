import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/screens/edit_tasks.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks![index];
            return FocusedMenuHolder(
              onPressed: () {},
              menuItems: <FocusedMenuItem>[
                FocusedMenuItem(
                    title: Text("Edit"),
                    trailingIcon: Icon(Icons.edit),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: EditTask(),
                        ),
                      );
                    }),
                FocusedMenuItem(
                    title: Text("Delete"),
                    trailingIcon: Icon(Icons.delete),
                    onPressed: () {
                      taskData.deleteTask(task);
                    }),
              ],
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallBack: (checkBoxState) {
                  taskData.updateTask(task);
                },
                // longPress: () {
                //   taskData.deleteTask(task);
                // },
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
