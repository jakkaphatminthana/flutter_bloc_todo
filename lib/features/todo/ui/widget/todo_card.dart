import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/core/utils/formater_string.dart';
import 'package:flutter_bloc_todo/features/todo/data/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.data,
  });

  final TodoModel data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        labelUpperFirst(data.title),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(data.description),
      leading: Icon(
        Icons.check_circle_rounded,
        color: data.isComplate ? Colors.greenAccent : Colors.grey,
      ),
    );
  }
}
