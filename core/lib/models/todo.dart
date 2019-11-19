import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final bool complete;
  final String id;
  final String task;

  Todo(
    this.task, {
    this.complete = false,
    String id,
  }) : this.id = id ?? Uuid().v4();

  Todo copyWith({bool complete, String id, String note, String task}) {
    return Todo(
      task ?? this.task,
      complete: complete ?? this.complete,
      id: id ?? this.id,
    );
  }

  @override
  List<Object> get props => [complete, id, task];

  @override
  String toString() {
    return 'Todo { complete: $complete, task: $task, id: $id }';
  }
}
