part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final List<TodoModel> todoList;

  const TodoState({
    this.todoList = const [],
  });

  @override
  List<Object> get props => [todoList];

  TodoState copyWith({
    List<TodoModel>? todoList,
  }) {
    return TodoState(todoList: todoList ?? this.todoList);
  }
}
