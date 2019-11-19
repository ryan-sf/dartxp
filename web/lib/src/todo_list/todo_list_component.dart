import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:core/core.dart';

import 'todo_list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgModel,
    NgIf,
  ],
  providers: [
    ClassProvider(TodoListService),
  ],
)
class TodoListComponent {
  @Input()
  TodosState state;

  final TodoBloc todoBloc;

  TodoListComponent(this.todoBloc);

  bool get isEmpty => state is TodosLoading ?? false;
  bool get isSuccess => state is TodosLoaded ?? false;
  bool get isError => state is TodosNotLoaded ?? false;

  List<Todo> get items => isSuccess ? (state as TodosLoaded).todos : [];

  String newTodo = '';

  void add() {
    todoBloc.add(AddTodo(Todo(newTodo)));
    newTodo = '';
  }

  void remove(int index) {
    todoBloc.add(DeleteTodo(items[index]));
  }

  void toggleComplete(int index, bool completed) {
    final todo = items[index];
    todoBloc.add(UpdateTodo(todo.copyWith(complete: completed)));
  }
}
