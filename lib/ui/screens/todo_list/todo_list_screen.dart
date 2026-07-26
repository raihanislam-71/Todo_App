import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/add_new_todo_screen.dart';
import 'package:todo_app/ui/screens/todo_list/all_todo_list_tab.dart';
import 'package:todo_app/ui/screens/todo_list/done_todo_list_tab.dart';
import 'package:todo_app/ui/screens/todo_list/undone_todo_list_tab.dart';
import '../../../entities/todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: const Text('Todo List'), bottom: _buildTabBar()),
        body: const TabBarView(
          children: [AllTodoListTab(), DoneTodoListTab(), UndoneTodoListTab()],
        ),
        floatingActionButton: _buildAddTodoFAB(),
      ),
    );
  }

  FloatingActionButton _buildAddTodoFAB() {
    return FloatingActionButton.extended(
      tooltip: "Add new todo",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddNewTodoScreen()),
        );
      },
      label: const Text('Add'),
      icon: const Icon(Icons.add),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(tabs: [Text('All'), Text('Done'), Text("UnDone")]);
  }
}
