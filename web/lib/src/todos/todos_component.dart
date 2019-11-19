import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:core/core.dart';
import 'package:angular_bloc/angular_bloc.dart';

import '../todo_list/todo_list_component.dart';

@Component(
  selector: 'app-todos',
  directives: [TodoListComponent],
  pipes: [BlocPipe],
  template: """<todo-list [state]="todoBloc | bloc"></todo-list>""",
  providers: [ClassProvider(TodoBloc)],
)
class TodosComponent implements OnInit, OnDestroy {
  final TodoBloc todoBloc;

  TodosComponent(this.todoBloc);

  @override
  ngOnInit() {
    todoBloc.add(LoadTodos());
  }

  @override
  void ngOnDestroy() {
    todoBloc.close();
  }
}
