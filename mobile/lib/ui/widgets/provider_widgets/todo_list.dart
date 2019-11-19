import 'package:core/core.dart' show Todo;
import 'package:flutter/material.dart';
import 'package:mobile_app/core/services/todos.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodosModel>(builder: (context, model, child) {
      if (model.loadingState == TodosState.TodosLoading)
        return Center(child: CircularProgressIndicator());

      if (model.loadingState == TodosState.TodosLoaded) {
        return model.todos.length == 0
            ? Center(
                child: Text('Nothing to do! Add items above.'),
              )
            : ListView.builder(
                itemCount: model.todos.length,
                itemBuilder: (context, index) {
                  final todo = model.todos[index];
                  var todoItem = TodoItem(
                    todo: todo,
                    onDismissed: (direction) {
                      model.deleteTodo(todo);
                    },
                    onCheckboxChanged: (bool value) {
                      model.toggleTodo(todo);
                    },
                    onTap: () {},
                  );
                  return todoItem;
                },
              );
      }

      return Center(
        child: Text('Whoops'),
      );
    });
  }
}

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
