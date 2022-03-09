import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_blc/features/presentation/widget/bloc_logic.dart';
import 'package:to_do_blc/features/presentation/widget/bloc_state.dart';
import 'package:to_do_blc/features/presentation/widget/events.dart';
import 'package:to_do_blc/models/task_model.dart';


class AddNewTaask extends StatefulWidget {
  const AddNewTaask({Key? key}) : super(key: key);

  @override
  State<AddNewTaask> createState() => _AddNewTaaskState();
}

class _AddNewTaaskState extends State<AddNewTaask> {

  TextEditingController tittleController = TextEditingController();

  TextEditingController discController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Task"),
        ),
        body: BlocListener<TodoTaskBloc, TaskBlocState>(
            listener: (context, state) {
              if (state is TaskLoaded) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Task is added")));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: tittleController,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Task ",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: discController,
                    decoration: const InputDecoration(
                      hintText: "Enter Task description",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 20,),

                  ElevatedButton(
                      onPressed: () {
                        var todo = TaskModel(id: DateTime.now().millisecond/100,
                            title: tittleController.text,
                            description: discController.text);

                        context.read<TodoTaskBloc>().add(
                          AddTaskEvent(addTodo: todo),
                        );
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            )));
  }
}