import 'dart:async';

import 'package:angular/core.dart';
import 'package:core/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class TodoListService {
  List<Todo> mockTodoList = <Todo>[];

  Future<List<Todo>> getTodoList() async => mockTodoList;
}
