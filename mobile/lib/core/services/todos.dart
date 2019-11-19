import 'dart:collection';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TodosModel extends ChangeNotifier {
  List<Todo> _todos = [];
  TodosState _loadingState = TodosState.TodosLoading;

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);
  TodosState get loadingState => _loadingState;

  void loadTodos() {
    _loadingState = TodosState.TodosLoaded;
    notifyListeners();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    final todoIndex = _todos.indexWhere((row) => row.id == todo.id);
    _todos[todoIndex] = todo.copyWith(complete: todo.complete, task: todo.task);
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    final todoIndex = _todos.indexOf(todo);
    _todos[todoIndex] = todo.copyWith(complete: !todo.complete);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}

enum TodosState { TodosLoading, TodosNotLoaded, TodosLoaded }
