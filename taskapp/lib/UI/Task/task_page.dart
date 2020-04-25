import 'package:flutter/material.dart';
import 'package:taskapp/models/classes/todoItems.dart';
import 'package:taskapp/models/global.dart';
import 'package:taskapp/models/widgets/task_todo_widget.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> taskList = [];
  @override
  Widget build(BuildContext context) {
    taskList=getList();
    return Container(
      //padding: EdgeInsets.only(top:150),
      color: darkGreyColor,
      child: _buildReorderableListSimple(context),
      // child: ReorderableListView(
      //   children: todoItems,
      //   padding: EdgeInsets.only(top:300),
      //   onReorder: _onReorder,
      // ),
    );
  }

  Widget _buildListTile(BuildContext context, Task item) {
    return ListTile(
      key: Key(item.taskId),
      title: TaskTodo(
        title: item.title,
      ),
    );
  }

  Widget _buildReorderableListSimple(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent
      ),

          child: ReorderableListView(
        // handleSide: ReorderableListSimpleSide.Right,
        // handleIcon: Icon(Icons.access_alarm),
        padding: EdgeInsets.only(top: 300.0),
        children: taskList
            .map((Task item) => _buildListTile(context, item))
            .toList(),
        //children:getList(),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            Task item = taskList[oldIndex];
            taskList.remove(item);
            taskList.insert(newIndex, item);
          });
        },
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Task item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

  List<Task> getList() {
    //List<TaskTodo> list=[];
    for (int i = 0; i < 10; i++) {
      taskList.add(Task("My First Todo"+ i.toString(), false,i.toString()));
    }
    return taskList;
  }
}
