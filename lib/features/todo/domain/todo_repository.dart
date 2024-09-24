import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc_todo/core/utils/network_utils.dart';
import 'package:flutter_bloc_todo/features/todo/data/models/raw_to_entity_todo_mapper.dart';
import 'package:flutter_bloc_todo/features/todo/data/models/todo_model.dart';

abstract class ITodoRepository {
  Future<List<TodoModel>> requestTodoList();

  Future<void> requestAddTodo({
    required String title,
    required String description,
  });
}

class TodoRepository implements ITodoRepository {
  final NetworkUtils _networkUtils;

  const TodoRepository._(this._networkUtils);

  factory TodoRepository({
    required NetworkUtils networkUtils,
  }) {
    return TodoRepository._(networkUtils);
  }

  @override
  Future<List<TodoModel>> requestTodoList() async {
    final jsonResponse = await _networkUtils.get(path: '/todos');

    if (jsonResponse is List) {
      final result = RawToEntityTodoMapper().apply(jsonResponse);
      return result;
    } else {
      throw Exception("Error | requestTodoList: response data type not support");
    }
  }

  @override
  Future<void> requestAddTodo({
    required String title,
    required String description,
  }) async {
    final Map<String, dynamic> params = {
      "id": DateTime.now().microsecondsSinceEpoch.toString(),
      "title": title,
      "description": description,
      "isCompleted": false,
    };
    await _networkUtils.post(path: '/todos', data: params);
    log("called request add todo");
  }
}
