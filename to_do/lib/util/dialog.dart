import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback saveEvent, closeEvent;
  final contr;
  const DialogBox({super.key, required this.saveEvent, required this.closeEvent, required this.contr});

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
    backgroundColor: Colors.white,
    // Set the shape for rounded corners, matching the image
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    // Remove the default padding to have more control over the layout
    contentPadding: EdgeInsets.zero,
    content: Column(
      mainAxisSize: MainAxisSize.min, // Makes the column height fit its content
      children: [
        // Add some padding around the TextField
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 20.0),
          child: TextField(
            autofocus: true,
            controller: contr,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add a new To Do',
            ),
          ),
        ),
        // A thin divider line above the buttons
        Divider(
          height: 1,
          color: Colors.black,
        ),
        // Use IntrinsicHeight to make the VerticalDivider take up the full height of the row
        IntrinsicHeight(
          child: Row(
            children: [
              // Use Expanded to make the button take up half the width
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    // Remove the splash effect's border radius to fit the dialog corner
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(12.0))),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: closeEvent,
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              // The vertical line between the buttons
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: Colors.black,
              ),
              // Use Expanded for the second button as well
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12.0))),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  onPressed: saveEvent,
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold, // Make 'Save' stand out
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
  }}
