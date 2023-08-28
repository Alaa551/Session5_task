import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session5_task/providers/todoProvider.dart';
import 'package:session5_task/widgets/customTodoDesign.dart';
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
                    CustomTodoDesign(index: index, todos: todoProvider.todos, todoProvider: todoProvider),
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
