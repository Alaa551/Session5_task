

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/todoModel.dart';
import 'alertDialog.dart';

class CustomTodoDesign extends StatelessWidget {
 int index;
 List<TodoModel> todos;
var todoProvider;

 CustomTodoDesign({required this.index, required this.todos, required this.todoProvider});

 @override
  Widget build(BuildContext context) {
    return  Dismissible(
      key: ValueKey(todoProvider.todos[index]),
      background: Container(
        color: Colors.red[100],
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.delete,
            color: Colors.white,
            size:40,
          ),

        ),
      ),
      onDismissed: (direction) {
        todoProvider.deleteNoteById(todos[index].id);

      },
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) =>
                  MyAlertDialog(isAdd: false,
                      onPress: (TodoModel){
                        todoProvider.updateTodoById(todos[index].id, TodoModel);
                      },todos: todos,
                      index: index)
          );

        },
        child: Container(
          alignment: Alignment.center,
          height: 80,
          margin: EdgeInsetsDirectional.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            //shape: BoxShape.circle
          ),
          child: CheckboxListTile(
              title: Text(todoProvider.getTodoById(todos[index].id).title),
              value: todoProvider.getTodoById(todos[index].id).value,
              onChanged: (value) {
                todoProvider.changeTodoStatusById(todos[index].id,
                    value as bool);
              }),
        ),
      ),
    );
  }
}
