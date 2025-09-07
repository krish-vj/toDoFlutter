import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback saveEvent, closeEvent;
  final contr;
  const DialogBox({super.key, required this.saveEvent, required this.closeEvent, required this.contr});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 1.0,
        )
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 20.0),
            child: TextField(
              autofocus: true,
              controller: contr,
              style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                hintText: 'Add a new To Do',
                hintStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.6),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Theme.of(context).dividerColor,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: closeEvent,
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Theme.of(context).dividerColor,
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: saveEvent,
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}