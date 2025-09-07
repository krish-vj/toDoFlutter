import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/pages/drawer.dart';
import 'package:to_do/util/dialog.dart';
import 'package:to_do/util/to_doList.dart';
import 'package:to_do/providers/theme_provider.dart';
class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _myBox = Hive.box('mybox');

  @override
  void initState() {
    if (_myBox.get("TODOS") == null) {
      db.createInitData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final cont = TextEditingController();
  ToDoDb db = ToDoDb();

  void flip(bool value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveEvent() {
    setState(() {
      db.toDoList.add([cont.text, false]);
      cont.clear();
    });
    db.updateData();
    closeEvent();
  }

  void closeEvent() {
    Navigator.of(context).pop();
  }

  void addItem() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          saveEvent: saveEvent,
          closeEvent: closeEvent,
          contr: cont,
        );
      },
    );
    db.updateData();
  }

  void removeItem(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider();
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: const Text("To Do's"),
          ),
          body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoList(
                taskName: db.toDoList[index][0],
                removeThis: (context) => removeItem(index),
                completed: db.toDoList[index][1],
                onChanged: (value) => flip(value, index),
                isLeftyMode: themeProvider.isLeftyMode,
              );
            },
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(
              left: themeProvider.isLeftyMode ? 25 : 0,
              right: themeProvider.isLeftyMode ? 0 : 25,
              bottom: 50,
              top: 0,
            ),
            child: FloatingActionButton(
              elevation: 0.0,
              shape: CircleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2.0,
                ),
              ),
              onPressed: addItem,
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.primary,
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
            ),
          ),
          floatingActionButtonLocation: themeProvider.isLeftyMode
              ? FloatingActionButtonLocation.startFloat
              : FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }
}