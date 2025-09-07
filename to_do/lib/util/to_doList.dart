import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatefulWidget {
  final String taskName;
  final bool completed;
  final Function(bool)? onChanged;
  final Function(BuildContext)? removeThis;
  const ToDoList({
    super.key,
    required this.taskName,
    required this.completed,
    required this.onChanged,
    required this.removeThis,
  });

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  TextStyle PendingTextStyle() {
    return TextStyle(
      fontSize: 30,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  TextStyle CompletedTextStyle() {
    return TextStyle(
      fontSize: 30,
      decoration: TextDecoration.lineThrough,
      color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6),
    );
  }

  void changeStatus() {
    setState(() {
      if (widget.onChanged != null) {
        widget.onChanged!(!widget.completed);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Slidable(
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.removeThis,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.removeThis,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.taskName,
                  style: widget.completed
                      ? CompletedTextStyle()
                      : PendingTextStyle(),
                ),
              ),
              IconButton(
                onPressed: changeStatus,
                icon: Icon(
                  widget.completed
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}