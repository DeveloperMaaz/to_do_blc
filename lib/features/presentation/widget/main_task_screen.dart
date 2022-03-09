import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_blc/features/presentation/widget/add_task.dart';
import 'package:to_do_blc/features/presentation/widget/bloc_logic.dart';
import 'package:to_do_blc/features/presentation/widget/bloc_state.dart';
import 'package:to_do_blc/features/presentation/widget/view_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo Tasks"),
      ),
       floatingActionButton: FloatingActionButton(

         child:const Icon(Icons.add),
         onPressed: (){
           Navigator.push(
               context, MaterialPageRoute(builder: (ctx) => const AddNewTaask()));
         },
       ),
      body: BlocBuilder<TodoTaskBloc, TaskBlocState>(builder: (context, state) {
        if (state is TaskLoad) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is TaskLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShowTasks(taskstate: state.todo),
              ],
            ),
          );
        } else {
          return const Text("Something went wrong");

        }
      }),
    );
  }
}