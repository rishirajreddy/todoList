import 'package:flutter/material.dart';
import 'package:todo_list_flutter/models/tasks_data.dart';
import 'tasks_tiles.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskdata, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskdata.tasks[index];
          return TaskTiles(
            taskTitle: task.text,
            isChecked: task.isDone,
            checkboxCallback: (bool checkboxState) {
              taskdata.updateTask(task);
            },
            longPressCallback: () {
              taskdata.deleteTask(task);
            },
          );
        },
        itemCount: taskdata.taskCount,
      );
    });
  }
}
