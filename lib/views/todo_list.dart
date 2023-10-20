import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zapp/components/todo_add_modal.dart';
import 'package:zapp/components/todo_term.dart';
import 'package:zapp/providers/todo_provider.dart';

class TodoList extends HookConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView(
        children: todoList
            .asMap()
            .map(
              (index, todoModel) => MapEntry(
                index,
                TodoTerm(
                  todoModel: todoModel,
                  onToggle: () {
                    ref.read(todoListProvider.notifier).toggle(todoModel.id);
                  },
                  onRemove: () {
                    ref
                        .read(todoListProvider.notifier)
                        .removeTodo(todoModel.id);
                  },
                ),
              ),
            )
            .values
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final todo = await TodoAddModal.open(context: context);
          if (todo != null) {
            ref.read(todoListProvider.notifier).addTodo(todo);
          }
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
