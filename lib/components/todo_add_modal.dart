import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:zapp/models/todo_model.dart';

class TodoAddModal extends HookWidget {
  const TodoAddModal({super.key});

  static Future<TodoModel?> open({
    required BuildContext context,
  }) async {
    return showModalBottomSheet<TodoModel?>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const FractionallySizedBox(
          heightFactor: 0.64,
          child: TodoAddModal(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final canSave = useState(false);
    final importentType = useState(ImportantType.none);

    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: context.pop,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    if (!canSave.value) {
                      context.pop();
                      return;
                    }

                    context.pop(TodoModel(
                      content: textController.text,
                      type: importentType.value,
                    ));
                  },
                  icon: Icon(
                    Icons.save,
                    color: canSave.value ? Colors.black87 : Colors.black26,
                  ),
                ),
              ],
            ),
            TextField(
              decoration: const InputDecoration(label: Text('Content')),
              controller: textController,
              onChanged: (value) {
                canSave.value = value.isNotEmpty;
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Text('Importance'),
                ],
              ),
            ),
            SegmentedButton(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment<ImportantType>(
                  value: ImportantType.none,
                  label: Text(
                    'None',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                ButtonSegment<ImportantType>(
                  value: ImportantType.low,
                  label: Text(
                    'Low',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                ButtonSegment<ImportantType>(
                  value: ImportantType.meddium,
                  label: Text(
                    'Meddium',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                ButtonSegment<ImportantType>(
                  value: ImportantType.hight,
                  label: Text(
                    'Hight',
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
              selected: {importentType.value},
              onSelectionChanged: (value) {
                importentType.value = value.first;
              },
            ),
          ],
        ),
      ),
    );
  }
}
