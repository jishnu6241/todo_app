import 'package:flutter/material.dart';
import 'package:todo_app/view/home_screen/widgets/custom_alert_dialog_box.dart';
import 'package:todo_app/view/home_screen/widgets/custom_todo_screen.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Map<String, dynamic>> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.purple[400],
        ),
        onPressed: () async {
          Map<String, dynamic>? todoData = await showDialog(
            context: context,
            builder: (context) => const CustomAlertDialogBox(),
          );

          if (todoData != null) {
            todoList.add(todoData);
            setState(() {});
          }
        },
      ),
      appBar: AppBar(
        title: const Text(
          "ToDo",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => CustomTodoScreen(
          data: todoList[index],
        ),
        separatorBuilder: (context, inde) => const SizedBox(
          height: 10,
        ),
        itemCount: todoList.length,
      ),
    );
  }
}
