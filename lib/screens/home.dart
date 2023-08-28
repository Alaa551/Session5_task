import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session5_task/models/todoModel.dart';
import 'package:session5_task/providers/todoProvider.dart';
import 'package:session5_task/widgets/searchTodosDelegate.dart';

import '../widgets/alertDialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Consumer<TodoProvider>(
          builder: (context, todoProvider, child) =>
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                    itemBuilder: (context, index) =>
                        Dismissible(
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
                               todoProvider.deleteNote(index);

                          },
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      MyAlertDialog(isAdd: false,
                                          onPress: (TodoModel){
                                          todoProvider.updateTodo(index, TodoModel);
                                          },todos: [],
                                          index: index),
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
                                  title: Text(todoProvider.todos[index].title),
                                  value: todoProvider.todos[index].value,
                                  onChanged: (value) {
                                    todoProvider.changeTodoStatus(index,
                                        value as bool);
                                  }),
                            ),
                          ),
                        ),

                    // separatorBuilder: (context, index) => Divider(height: 20,color: Colors.white,),
                    itemCount: todoProvider.todos.length),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>
                MyAlertDialog(
                    isAdd: true,
                    index: -1,
                    onPress: (TodoModel) {
                      todoProvider.addTodo(TodoModel);
                    },todos: []),
          );
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Todo App",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: (){
            showSearch(context: context, delegate: SearchTodosDelegate());
          },
        ),

      ),
    );
  }
}
