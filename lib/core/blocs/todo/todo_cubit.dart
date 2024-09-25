import 'dart:developer';

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
    try {
      await EasyLoading.show();
      await Future.delayed(const Duration(milliseconds: 1500));
      final List<TodoModel> todos = await _todoRepository.requestTodoList();
      emit(state.copyWith(todoList: todos));
    } catch (e) {
      log("💥 Catch Error| fetchTodoList: $e");
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<void> addTodo({
    required String title,
    required String description,
  }) async {
    try {
      await EasyLoading.show();
      await Future.delayed(const Duration(milliseconds: 1500));
      await _todoRepository.requestAddTodo(
        title: title,
        description: description,
      );

      await fetchTodoList();
    } catch (e) {
      log("💥 Catch Error| addTodo: $e");
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<void> updateTodo({
    required TodoModel newData,
  }) async {
    try {
      await EasyLoading.show();
      await Future.delayed(const Duration(milliseconds: 1500));
      await _todoRepository.requestUpdateTodo(newData: newData);
      await fetchTodoList();
    } catch (e) {
      log("💥 Catch Error| updateTodo: $e");
    } finally {
      await EasyLoading.dismiss();
    }
  }

  Future<void> deleteTodo({
    required String id,
  }) async {
    try {
      await EasyLoading.show();
      await Future.delayed(const Duration(milliseconds: 1500));
      await _todoRepository.requestDeleteTodo(id: id);
      await fetchTodoList();
    } catch (e) {
      log("💥 Catch Error| deleteTodo: $e");
      throw Exception("Catch Error| deleteTodo: $e");
    } finally {
      await EasyLoading.dismiss();
    }
  }
}
