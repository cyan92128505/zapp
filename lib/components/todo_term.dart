import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zapp/models/todo_model.dart';

class TodoTerm extends StatelessWidget {
  final TodoModel todoModel;
  final VoidCallback onToggle;
  final VoidCallback onRemove;
  const TodoTerm({
    super.key,
    required this.todoModel,
    required this.onToggle,
    required this.onRemove,
  });

  String getSymbol(ImportantType type) {
    final dict = {
      ImportantType.none: '',
      ImportantType.low: '!',
      ImportantType.meddium: '!!',
      ImportantType.hight: '!!!',
    };

    return '${dict[type]}';
  }

  @override
  Widget build(BuildContext context) {
    final ratio = MediaQuery.of(context).size.width /
        4 /
        MediaQuery.of(context).size.width;

    return Slidable(
      endActionPane: ActionPane(
        extentRatio: ratio,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              onRemove();
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: ListTile(
        onTap: onToggle,
        title: Row(
          children: [
            Radio(
              value: todoModel.completed,
              onChanged: (value) {
                onToggle();
              },
              groupValue: true,
              toggleable: true,
            ),
            Expanded(
              child: Text(
                todoModel.content,
                style: TextStyle(
                  decoration: todoModel.deleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
            Text(
              getSymbol(ImportantType.getType(todoModel.type)),
              style: const TextStyle(
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
