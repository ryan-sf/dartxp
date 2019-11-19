import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodosState>(
      builder: (context, state) {
        if (state is TodosLoading) return CircularProgressIndicator();

        if (state is TodosLoaded) {
          return state.todos.length == 0
              ? Center(
                  child: Text('Nothing to do! Add items above.'),
                )
              : ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];
                    var todoItem = TodoItem(
                      todo: todo,
                      onDismissed: (direction) {
                        BlocProvider.of<TodoBloc>(context)
                            .add(DeleteTodo(todo));
                      },
                      onCheckboxChanged: (bool value) {
                        BlocProvider.of<TodoBloc>(context).add(UpdateTodo(
                          todo.copyWith(complete: !todo.complete),
                        ));
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
      },
    );
  }
}
