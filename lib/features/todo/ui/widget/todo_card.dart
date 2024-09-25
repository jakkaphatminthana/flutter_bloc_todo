import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/core/utils/formater_string.dart';
import 'package:flutter_bloc_todo/features/todo/data/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.data,
    this.handleItem,
    this.handleDelete,
  });

  final TodoModel data;
  final Function(TodoModel item)? handleItem;
  final Future<bool> Function(String id)? handleDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(data.id.toString()),
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        final result = await handleDelete?.call(data.id);
        return result;
      },
      child: GestureDetector(
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
      ),
    );
  }
}
