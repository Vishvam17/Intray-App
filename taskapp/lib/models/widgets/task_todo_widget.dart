import 'package:flutter/material.dart';
import 'package:taskapp/models/global.dart';

class TaskTodo extends StatelessWidget{
  final String title;
  final String keyValue;
  TaskTodo({this.keyValue,this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyValue),
      height: 100,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      
      decoration: BoxDecoration(
        color:lightPurple,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          new BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10.0,
              ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Radio(
            
          ),
          Column(
            children: <Widget>[
              Text(title,style: darkTodoTitle,)
            ],
          )
        ],
      ),
    );
  }

}