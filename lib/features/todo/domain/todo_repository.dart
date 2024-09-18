import 'package:flutter_bloc_todo/core/utils/network_utils.dart';
import 'package:flutter_bloc_todo/features/todo/data/models/raw_to_entity_todo_mapper.dart';
import 'package:flutter_bloc_todo/features/todo/data/models/todo_model.dart';

abstract class ITodoRepository {
  Future<List<TodoModel>> requestTodoList();
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
    final result = RawToEntityTodoMapper().apply(jsonResponse);
    return result;
  }
}
