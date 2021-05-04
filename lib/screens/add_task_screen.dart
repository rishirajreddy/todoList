import 'package:flutter/material.dart';
import 'package:todo_list_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_flutter/models/tasks_data.dart';

class AddTaskScreen extends StatelessWidget {
  String newTaskTitle;
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(40.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                autofocus: false,
                controller: textController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 3.5),
                  ),
                ),
                onChanged: (String newText) {
                  newTaskTitle = newText;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlueAccent)),
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 60.0),
                    child: Text('Add',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ))
            ],
          ),
        ));
  }
}
