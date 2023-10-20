import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zapp/models/todo_model.dart';
import 'package:zapp/providers/todo_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Todo Provider Test', () {
    test('Add Todo:hello world', () async {
      final container = ProviderContainer();

      const matcher = 'hello world';

      final todoWithID = container.read(todoListProvider.notifier).addTodo(
            const TodoModel(content: matcher),
          );

      final todoList = container.read(todoListProvider);

      final actual = todoList.singleWhere((todo) => todo.id == todoWithID.id);

      expect(actual.content, matcher);
    });

    test('Remove Todo:hello world', () async {
      final container = ProviderContainer();

      const matcher = 'hello world';

      final todoWithID = container.read(todoListProvider.notifier).addTodo(
            const TodoModel(content: matcher),
          );

      container.read(todoListProvider.notifier).removeTodo(todoWithID.id);

      final todoList = container.read(todoListProvider);
      final actual = todoList.singleWhere((todo) => todo.id == todoWithID.id);
      expect(actual.deleted, true);
    });

    test('Toggle Todo:hello world', () async {
      final container = ProviderContainer();

      const matcher = 'hello world';

      final todoWithID = container.read(todoListProvider.notifier).addTodo(
            const TodoModel(content: matcher),
          );

      container.read(todoListProvider.notifier).toggle(todoWithID.id);

      final todoList = container.read(todoListProvider);
      final actual = todoList.singleWhere((todo) => todo.id == todoWithID.id);
      expect(actual.completed, true);
    });
  });
}
