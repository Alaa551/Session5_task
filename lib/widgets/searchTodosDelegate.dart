import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session5_task/models/todoModel.dart';
import 'package:session5_task/providers/todoProvider.dart';

import 'alertDialog.dart';
import 'customTodoDesign.dart';

class SearchTodosDelegate extends SearchDelegate {
  @override
  Widget buildSearchBar(BuildContext context) {
    return TextField(
      onChanged: (value) {
        query = value;
      },
      decoration: const InputDecoration(
        labelText: "Search...",
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: () {
        query = "";
      }, icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<TodoModel> todos =
    Provider.of<TodoProvider>(context).searchTodos(query);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(

          child: Consumer<TodoProvider>(
            builder: (context, todoProvider, child) =>
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ListView.builder(
                      itemBuilder: (context, index) =>
                       CustomTodoDesign(index:index,todos: todos,todoProvider: todoProvider),
                      //     Dismissible(
                      //       key: ValueKey(todoProvider.todos[index]),
                      //       background: Container(
                      //         color: Colors.red[100],
                      //         child: Padding(
                      //           padding: EdgeInsets.all(10),
                      //           child: Icon(Icons.delete,
                      //             color: Colors.white,
                      //             size: 40,
                      //           ),
                      //
                      //         ),
                      //       ),
                      //       onDismissed: (direction) {
                      //         todoProvider.deleteNoteById(todos[index].id);
                      //       },
                      //       child: InkWell(
                      //         onTap: () {
                      //           showDialog(
                      //               context: context,
                      //               builder: (context) =>
                      //                   MyAlertDialog(isAdd: false,
                      //                       onPress: (TodoModel) {
                      //                         todoProvider.updateTodoById(
                      //                             todos[index].id, TodoModel);
                      //                       },
                      //                       index: index)
                      //           );
                      //         },
                      //         child: Container(
                      //           alignment: Alignment.center,
                      //           height: 80,
                      //           margin: EdgeInsetsDirectional.all(10),
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             borderRadius: BorderRadius.circular(15),
                      //             //shape: BoxShape.circle
                      //           ),
                      //           child: CheckboxListTile(
                      //               title: Text(todos[index]
                      //                   .title),
                      //               value: todos[index].value,
                      //               onChanged: (value) {
                      //                 todoProvider.changeTodoStatus(index,
                      //                     value as bool);
                      //               }),
                      //         ),
                      //       ),
                      //     ),

                      itemCount: todos.length),
                ),
          ),


          ),
    );


  }
}
