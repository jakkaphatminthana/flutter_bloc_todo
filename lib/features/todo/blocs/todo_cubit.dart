import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/core/injection/injection.dart';
import 'package:flutter_bloc_todo/features/todo/data/models/todo_model.dart';
import 'package:flutter_bloc_todo/features/todo/domain/todo_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState());

  final TodoRepository _todoRepository = getIt.get<TodoRepository>();

  Future<void> fetchTodoList() async {
    await EasyLoading.show();
    await Future.delayed(const Duration(milliseconds: 1500));
    final List<TodoModel> todos = await _todoRepository.requestTodoList();
    emit(state.copyWith(todoList: todos));
    await EasyLoading.dismiss();
  }
}
