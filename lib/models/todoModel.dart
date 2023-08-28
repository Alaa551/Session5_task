

class TodoModel {
  static  int uniqueId=0;
  int id=0;
  String title;
  bool value;

  TodoModel(
      {required this.title,
        this.value=false,

      }){
    id= uniqueId++;
  }
}
