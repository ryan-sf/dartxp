import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocProvider.of<TodoBloc>(context).add(AddTodo(Todo(val)));
          _controller.clear();
        },
      ),
    );
  }
}
