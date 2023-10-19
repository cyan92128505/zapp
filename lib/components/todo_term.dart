import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zapp/models/todo_model.dart';

class TodoTerm extends StatelessWidget {
  final TodoModel todoModel;
  final VoidCallback onClick;
  final VoidCallback onDelete;
  const TodoTerm({
    super.key,
    required this.todoModel,
    required this.onClick,
    required this.onDelete,
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
              onDelete();
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
        onTap: onClick,
        title: Row(
          children: [
            Radio(
              value: todoModel.isDone,
              onChanged: (value) {
                onClick();
              },
              groupValue: true,
              toggleable: true,
            ),
            Expanded(
              child: Text(
                todoModel.content,
                style: TextStyle(
                  decoration: todoModel.isDeleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
            Text(
              getSymbol(todoModel.type),
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
