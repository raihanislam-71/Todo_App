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
        body: TabBarView(
          children: [
            AllTodoListTab(
              todoList: _todoList,
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoState,
            ),
            UndoneTodoListTab(
              todoList: _todoList.where((item) => item.isDone == false).toList(),
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoState,
            ),
            DoneTodoListTab(
              todoList: _todoList.where((item) => item.isDone == true).toList(),
              onDelete:_deleteTodo,
              onStatusChange: _toggleTodoState,
            ),
          ],
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
          MaterialPageRoute(builder: (context) => AddNewTodoScreen(onAddTodo: _addNewTodo)),
        );
      },
      label: const Text('Add'),
      icon: const Icon(Icons.add),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
      tabs: [
        Text('All'),
        Text("UnDone"),
        Text('Done'),
      ]
    );
  }

  void _addNewTodo(Todo tobo) {
    _todoList.add(tobo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTodoState(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
