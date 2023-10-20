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
                  enableFeedback: canSave.value,
                  onPressed: () {
                    if (!canSave.value) {
                      return;
                    }

                    context.pop(TodoModel(
                      content: textController.text,
                      type: importentType.value.name,
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
              key: const Key('ContentTextField'),
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
              segments: ImportantType.values
                  .map(
                    (t) => ButtonSegment<ImportantType>(
                      value: t,
                      label: Text(
                        t.name,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                  .toList(),
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
