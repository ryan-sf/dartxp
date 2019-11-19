import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final DismissDirectionCallback onDismissed;
  final ValueChanged<bool> onCheckboxChanged;
  final GestureTapCallback onTap;

  const TodoItem({
    Key key,
    @required this.todo,
    @required this.onDismissed,
    @required this.onCheckboxChanged,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      child: ListTile(
          onTap: onTap,
          leading: Checkbox(
            value: todo.complete,
            onChanged: onCheckboxChanged,
          ),
          title: Text(todo.task)),
      key: Key(todo.id),
      onDismissed: onDismissed,
    );
  }
}
