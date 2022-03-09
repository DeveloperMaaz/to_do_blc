
import 'package:to_do_blc/models/task_model.dart';

class TaskEvent {
   const TaskEvent();

}

class LoadTask extends TaskEvent {
   final List<TaskModel> todos;
   const LoadTask({this.todos = const <TaskModel>[]});
}


class AddTaskEvent extends TaskEvent {

   final TaskModel addTodo;

   AddTaskEvent({required this.addTodo});

}
class DeleteTaskEvent extends TaskEvent {

   final double todoId;

   DeleteTaskEvent({required this.todoId});
}
