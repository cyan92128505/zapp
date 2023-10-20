import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zapp/models/todo_model.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<TodoModel> build() {
    return [];
  }

  TodoModel addTodo(TodoModel todo) {
    final todoWithID = todo.copyWith(
      id: 'todo-${state.length}-${DateTime.now().millisecondsSinceEpoch}',
    );

    state = [...state, todoWithID];

    return todoWithID;
  }

  void removeTodo(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId) todo.copyWith(deleted: true) else todo,
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}
