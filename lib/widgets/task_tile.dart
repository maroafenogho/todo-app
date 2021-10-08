import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    required this.taskTitle,
    required this.isChecked,
    Key? key,
    required this.checkboxCallBack,
  }) : super(key: key);

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallBack;
  // final Function() longPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onLongPress: longPress,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontSize: 18.0,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.blueGrey,
        value: isChecked,
        onChanged: checkboxCallBack,
      ),
    );
  }
}
