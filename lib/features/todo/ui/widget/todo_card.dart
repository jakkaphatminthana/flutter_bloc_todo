import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/core/utils/formater_string.dart';
import 'package:flutter_bloc_todo/features/todo/data/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.data,
    this.handleItem,
  });

  final TodoModel data;
  final Function(TodoModel item)? handleItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleItem?.call(data),
      child: ListTile(
        title: Text(
          labelUpperFirst(data.title),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(data.description),
        leading: Icon(
          Icons.check_circle_rounded,
          color: data.isComplate ? Theme.of(context).primaryColor : Colors.grey,
        ),
      ),
    );
  }
}
