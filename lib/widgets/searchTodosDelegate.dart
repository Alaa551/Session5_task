import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session5_task/models/todoModel.dart';
import 'package:session5_task/providers/todoProvider.dart';

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
                      itemCount: todos.length),
                ),
          ),


          ),
    );


  }
}
