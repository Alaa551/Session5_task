import 'package:flutter/cupertino.dart';

import '../models/todoModel.dart';

class TodoProvider extends ChangeNotifier{
  List<TodoModel> _todos =[
    TodoModel(title: "todo 1",),
    TodoModel(title: "todo 2",),
    TodoModel(title: "todo 3",),
    TodoModel(title: "todo 4",),
    TodoModel(title: "todo 5",),

  ];

  List<TodoModel> get todos => _todos;

  void addTodo(TodoModel todo){
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(int index,TodoModel todo){
    _todos[index]= todo;
    notifyListeners();
  }

  void updateTodoById(int id,TodoModel todoModel){
    _todos.firstWhere((element) => element.id==id).title=todoModel.title;
    notifyListeners();
  }
  TodoModel getTodoById(int id){
    return _todos.firstWhere((element) => element.id==id);

  }


  void changeTodoStatus(int index,bool status){
    _todos[index].value=status;
    notifyListeners();
  }

  void changeTodoStatusById(int id,bool status){
    _todos.firstWhere((element) => element.id==id).value=status ;
    notifyListeners();
  }

  void deleteNote(int index){
    _todos.removeAt(index);
    notifyListeners();
  }
  void deleteNoteById(int id){
    _todos.removeWhere((element) => element.id==id);
    notifyListeners();
  }

  List<TodoModel> searchTodos(String query){
    return _todos.where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList();

  }


}