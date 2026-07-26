import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';
import 'package:todo_app/ui/widgets/todo_item.dart';

class UndoneTodoListTab extends StatelessWidget {
  const UndoneTodoListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {},
            child: TodoItem(
              todo: Todo(
                "Title well be here",
                "description raihan islam",
                DateTime.now(),
              ),
              onIconButtonPressed: () {},
            ),
          );
        },
      );
  }
}