
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session5_task/models/todoModel.dart';
import 'package:session5_task/providers/todoProvider.dart';


class MyAlertDialog extends StatelessWidget {
  // if true -> add
  // if false -> update
 bool isAdd;
 Function (TodoModel) onPress;
 int index;
 List<TodoModel> todos;



 MyAlertDialog({super.key, required this.isAdd, required this.onPress,required this.index,required this.todos});

  @override
  Widget build(BuildContext context) {
    String title= isAdd?"": todos[index].title;
    final GlobalKey<FormState> formState = GlobalKey<FormState>();
    return AlertDialog(
      title: Text("warning"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: formState,
            child: TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return "Can't be empty";
                }
                return null;
              },
              onChanged: (value){
                title=value;
              },
              initialValue: title,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter title",
              ),
            ),
          ),

        ],
      ),
      actions: [
        ElevatedButton(onPressed: () {
          if (formState.currentState!.validate()) {
            onPress(TodoModel(title: title));
            Navigator.pop(context);
          }

        },
          child: Text(isAdd? "Add":"Save"),
        ),
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        },
          child: Text("Cancel"),
        )
      ],
    );
  }
}
