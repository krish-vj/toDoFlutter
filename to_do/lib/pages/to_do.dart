import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/pages/drawer.dart';
import 'package:to_do/util/dialog.dart';
import 'package:to_do/util/to_doList.dart';


class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _myBox= Hive.box('mybox');
  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("TODOS")==null){db.createInitData();}
    else{
      db.loadData();
    }
    super.initState();
  }
  
  final cont= TextEditingController();
  
  ToDoDb db=ToDoDb();
  // List db.toDoList= db.db.toDoList;
  void flip(bool value, int index){
    setState(() {
      db.toDoList[index][1]= !db.toDoList[index][1];
    });
    db.updateData();

  }
  
  void saveEvent(){
    //  print(cont.text);
    setState(() {
      db.toDoList.add([cont.text, false]);
      cont.clear();
    });
    db.updateData();
    closeEvent();
  }
  void closeEvent(){
    Navigator.of(context).pop();
  }
  void addItem(){
    showDialog(context: context, builder: (context){
      return DialogBox(saveEvent: saveEvent, closeEvent: closeEvent, contr:cont ,);
    });
    db.updateData();

  }
  void removeItem(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("To Do's"),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoList(taskName: db.toDoList[index][0],
          removeThis: (context)=>removeItem(index),
           completed: db.toDoList[index][1], 
           onChanged: (value)=>flip(value, index),);},
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 0, right: 25, bottom: 50, top:0),
        child: FloatingActionButton(onPressed: addItem, child: Icon(Icons.add),),
      ),
    );
  }
}