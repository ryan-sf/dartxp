import 'package:core/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/core/services/todos.dart';
import 'package:provider/provider.dart';

typedef OnAddTodoItem = void Function(String val);

class TodoForm extends StatelessWidget {
  final _controller = TextEditingController();

  TodoForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            hintText: 'What do you need to do?',
            contentPadding: const EdgeInsets.all(16.0)),
        textInputAction: TextInputAction.done,
        onSubmitted: (val) {
          var model = Provider.of<TodosModel>(context, listen: false);
          model.addTodo(Todo(val));
          _controller.clear();
        },
      ),
    );
  }
}
