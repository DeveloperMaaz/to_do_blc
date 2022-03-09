import 'package:to_do_blc/features/presentation/widget/events.dart';
import 'package:to_do_blc/models/task_model.dart';

class TaskBlocState {
  const TaskBlocState();
  add(LoadTask loadTask) {}
}

class TaskLoad extends TaskBlocState {}


class TaskLoaded extends TaskBlocState {

  final List<TaskModel> todo;

  const TaskLoaded({this.todo = const <TaskModel>[]});
}