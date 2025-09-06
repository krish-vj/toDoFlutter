import 'package:flutter/material.dart';
import 'package:to_do/pages/drawer.dart';
import 'package:to_do/util/dialog.dart';
import 'package:to_do/util/to_doList.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final cont= TextEditingController();
  
  List toDoList=[
     ];
  void flip(bool value, int index){
    setState(() {
      toDoList[index][1]= !toDoList[index][1];
    });

  }
  
  void saveEvent(){
    //  print(cont.text);
    setState(() {
      toDoList.add([cont.text, false]);
      cont.clear();
    });
    closeEvent();
  }
  void closeEvent(){
    Navigator.of(context).pop();
  }
  void addItem(){
    showDialog(context: context, builder: (context){
      return DialogBox(saveEvent: saveEvent, closeEvent: closeEvent, contr:cont ,);
    });

  }
  void removeItem(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("To Do's"),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoList(taskName: toDoList[index][0],
          removeThis: (context)=>removeItem(index),
           completed: toDoList[index][1], 
           onChanged: (value)=>flip(value, index),);},
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 0, right: 25, bottom: 50, top:0),
        child: FloatingActionButton(onPressed: addItem, child: Icon(Icons.add),),
      ),
    );
  }
}