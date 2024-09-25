import 'dart:developer';

import 'package:flutter_bloc_todo/features/todo/data/models/todo_model.dart';

class RawToEntityTodoMapper {
  static const RawToEntityTodoMapper _instance = RawToEntityTodoMapper._();

  const RawToEntityTodoMapper._();

  factory RawToEntityTodoMapper() {
    return _instance;
  }

  List<TodoModel> apply(List<dynamic> raws) {
    final List<TodoModel> result = [];
    for (final raw in raws) {
      result.add(
        TodoModel(
          id: raw['id'] ?? '',
          title: raw['title'] ?? '',
          description: raw['description'] ?? '',
          isComplate: raw['isCompleted'] ?? false,
        ),
      );
    }
    return result;
  }
}
