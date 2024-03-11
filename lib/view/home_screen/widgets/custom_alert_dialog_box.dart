import 'package:flutter/material.dart';
import 'package:todo_app/controller/todo_controller.dart';

class CustomAlertDialogBox extends StatefulWidget {
  const CustomAlertDialogBox({
    super.key,
  });
  @override
  State<CustomAlertDialogBox> createState() => _CustomAlertDialogBoxState();
}

class _CustomAlertDialogBoxState extends State<CustomAlertDialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add title and description",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.purple[300]),
      ),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            TextFormField(
              controller: TodoController.titleController,
              decoration: const InputDecoration(
                hintText: "Title",
                labelText: "Title",
                hintStyle: TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: TodoController.desController,
              decoration: const InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal)),
            )
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context, {
              'title': TodoController.titleController.text.trim(),
              'des': TodoController.desController.text.trim(),
            });
          },
          child: Text(
            "Add",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.purple[300]),
          ),
        ),
      ],
    );
  }
}
