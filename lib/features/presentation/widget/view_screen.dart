import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_blc/features/presentation/widget/bloc_logic.dart';
import 'package:to_do_blc/features/presentation/widget/events.dart';
import 'package:to_do_blc/models/task_model.dart';

class ShowTasks extends StatefulWidget {
  final List<TaskModel> taskstate;
  const ShowTasks({Key? key, required this.taskstate}) : super(key: key);

  @override
  State<ShowTasks> createState() => _ShowTasksState();
}

class _ShowTasksState extends State<ShowTasks> {
  @override
  Widget build(BuildContext context) {
    return
      widget.taskstate.isEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "No Transaction Yet.!",
            style: TextStyle(
              fontSize: 26.0,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ):
      ListView.builder(
      shrinkWrap: true,
      itemCount: widget.taskstate.length,
      itemBuilder: (BuildContext context, int index) {

        final currentTodo = widget.taskstate[index];

        return Card(
          child: ListTile(
            title: Text(
              currentTodo.title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            subtitle: Text(
              currentTodo.description,
            ),
            trailing: IconButton(
                onPressed: () {
                  context
                      .read<TodoTaskBloc>()
                      .add(DeleteTaskEvent(todoId: currentTodo.id));
                },
                icon: const Icon(Icons.delete)),
          ),
        );
      },
    );
  }
}





/*
 Text(
                  currentTodo.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
 */