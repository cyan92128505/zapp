import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zapp/components/todo_add_modal.dart';
import 'package:zapp/components/todo_term.dart';
import 'package:zapp/models/todo_model.dart';

class TodoList extends HookWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoList = useState(<TodoModel>[]);

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView(
        children: todoList.value
            .asMap()
            .map(
              (index, todoModel) => MapEntry(
                index,
                TodoTerm(
                  todoModel: todoModel,
                  onSelect: (value) {
                    final list = todoList.value;
                    todoList.value = [];
                    final result =
                        list.removeAt(index).copyWith(isSelect: value == false);
                    list.insert(index, result);
                    todoList.value = list;
                  },
                  onDelete: () {
                    final list = todoList.value;
                    todoList.value = [];
                    final result =
                        list.removeAt(index).copyWith(isDeleted: true);
                    list.insert(index, result);
                    todoList.value = list;
                  },
                ),
              ),
            )
            .values
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final list = todoList.value;
          final todo = await TodoAddModal.open(context: context);
          if (todo != null) {
            list.add(todo);
            todoList.value = [];
            todoList.value = list;
          }
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
