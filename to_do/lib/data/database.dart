import 'package:hive/hive.dart';

class ToDoDb{
  List toDoList=[];
  final _myBox= Hive.box('mybox');
  //first time ever
  void createInitData(){
    toDoList=[
      ["Swipe task to delete it", false],
      ["click + to create new task", false]];
      updateData();

  }
  void loadData(){
    toDoList=_myBox.get("TODOS");
  }
  void updateData(){
    _myBox.put("TODOS", toDoList);
  }

}