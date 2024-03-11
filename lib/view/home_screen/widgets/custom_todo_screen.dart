import 'package:flutter/material.dart';

class CustomTodoScreen extends StatefulWidget {
  const CustomTodoScreen({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  State<CustomTodoScreen> createState() => _CustomTodoScreenState();
}

bool isChechked = false;

class _CustomTodoScreenState extends State<CustomTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.purple[100]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.data["title"],
                  style: const TextStyle(
                      fontSize: 19,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChechked,
                      onChanged: (value) {
                        isChechked = !isChechked;
                        setState(() {});
                      },
                    )
                  ],
                )
              ],
            ),
            Text(
              widget.data["des"],
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6)),
            ),
          ],
        ));
  }
}
