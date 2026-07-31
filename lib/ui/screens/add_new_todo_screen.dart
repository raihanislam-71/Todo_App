import 'package:flutter/material.dart';
import 'package:todo_app/entities/todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key, required this.onAddTodo});

  final Function(Todo) onAddTodo;

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  TextEditingController _titleTEController = TextEditingController();
  TextEditingController _descriptonTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new todo")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: const InputDecoration(
                  labelText: 'title',
                  hintText: 'title',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter your title";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: _descriptonTEController,
                decoration: const InputDecoration(
                  labelText: 'description',
                  hintText: 'description',
                ),
                maxLines: 5,
                minLines: 1,
                maxLength: 250,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "Enter your description";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Todo todo = Todo(
                      _titleTEController.text.trim(),
                      _descriptonTEController.text.trim(),
                      DateTime.now(),
                    );
                    widget.onAddTodo(todo);
                    Navigator.pop(context);
                  }
                },
                child: Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptonTEController.dispose();
    super.dispose();
  }
}
