import 'package:bloc/bloc.dart';
import 'package:bloc_event/bloc_event.dart';
import 'package:equatable/equatable.dart';

import '../models/todo.dart';

abstract class TodoEvent<E> extends Event<TodoBloc, TodosState> {}

class TodoBloc extends EventBloc<TodoEvent, TodosState> {
  @override
  get initialState => TodosLoading();

  @override
  void onTransition(Transition<TodoEvent, TodosState> transition) {
    print(transition);
  }
}

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {
  @override
  Stream<TodosState> onTriggered(TodoBloc bloc, TodosState state) async* {
    yield TodosLoaded([]);
  }
}

class AddTodo extends TodoEvent {
  final Todo todo;

  AddTodo(this.todo);

  @override
  Stream<TodosState> onTriggered(TodoBloc bloc, TodosState state) async* {
    if (state is TodosLoaded) {
      final List<Todo> updatedTodos = List.from(state.todos)..add(todo);
      yield TodosLoaded(updatedTodos);
    }
  }
}

class DeleteTodo extends TodoEvent {
  final Todo payload;

  DeleteTodo(this.payload);

  @override
  Stream<TodosState> onTriggered(TodoBloc bloc, TodosState state) async* {
    if (state is TodosLoaded) {
      final updatedTodos =
          state.todos.where((todo) => todo.id != payload.id).toList();

      yield TodosLoaded(updatedTodos);
    }
  }
}

class UpdateTodo extends TodoEvent {
  final Todo payload;

  UpdateTodo(this.payload);

  @override
  Stream<TodosState> onTriggered(TodoBloc bloc, TodosState state) async* {
    if (state is TodosLoaded) {
      final updatedTodos = state.todos
          .map((todo) => todo.id == payload.id ? payload : todo)
          .toList();
      print(updatedTodos);
      yield TodosLoaded(updatedTodos);
    }
  }
}

class TodosLoading extends TodosState {}

class TodosNotLoaded extends TodosState {}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  const TodosLoaded([this.todos = const []]);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosLoaded { todos: $todos }';
}
