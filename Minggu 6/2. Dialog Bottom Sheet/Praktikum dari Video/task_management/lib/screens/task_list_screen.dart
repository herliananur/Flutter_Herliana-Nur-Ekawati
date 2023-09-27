// TODO 16: buat task list screen
import 'package:flutter/material.dart';
import 'package:task_management/components/task_item_card.dart';
import 'package:task_management/models/task_manager.dart';

class TaskListScreen extends StatelessWidget {
  final TaskManager manager;

  const TaskListScreen({
    super.key,
    required this.manager,
  });

  @override
  Widget build(BuildContext context) {
    final taskItems = manager.taskModels;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
          itemCount: taskItems.length,
          itemBuilder: (context, index) {
            final item = taskItems[index];
            // TODO 19: menambahkan callback handler untuk menghapus list dan menambahkan scaffold messenger
            return TaskItemCard(
              key: Key(item.id),
              task: item,
              onPressed: () {
                manager.deleteTask(index);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.taskName} Deleted'),
                  ),
                );
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          }),
    );
  }
}
