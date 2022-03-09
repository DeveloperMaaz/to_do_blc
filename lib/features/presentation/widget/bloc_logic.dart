
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_blc/features/presentation/widget/bloc_state.dart';
import 'package:to_do_blc/features/presentation/widget/events.dart';

class TodoTaskBloc extends Bloc<TaskEvent, TaskBlocState> {
  TodoTaskBloc() : super(TaskLoad()) {

    on<LoadTask>(_onLoadTask);
    on<AddTaskEvent>(_onAddTask);
    on<DeleteTaskEvent>(_onDeleteTask);

  }
  void _onLoadTask(LoadTask event, Emitter<TaskBlocState> emit) {
    emit(
      TaskLoaded(todo: event.todos),
    );
  }

  void _onAddTask(AddTaskEvent event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    if (state is TaskLoaded) {
      final todoToAdd = event.addTodo;
      state.todo.add(todoToAdd);
      emit(TaskLoaded(todo: state.todo));
    }
  }
  void _onDeleteTask(DeleteTaskEvent event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    if (state is TaskLoaded) {
      state.todo.removeWhere((task) => task.id == event.todoId);
      emit(TaskLoaded(todo: state.todo));
    }
  }
}