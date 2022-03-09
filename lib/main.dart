import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_blc/features/presentation/widget/bloc_logic.dart';
import 'package:to_do_blc/features/presentation/widget/events.dart';
import 'package:to_do_blc/features/presentation/widget/main_task_screen.dart';
import 'package:to_do_blc/models/task_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return BlocProvider<TodoTaskBloc>(
    //   create: (BuildContext context) {
    //     return TodoTaskBloc(0);
    //   },
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoTaskBloc()
            ..add(LoadTask(todos: [
              TaskModel(
                  id: DateTime.now().millisecond / 100,
                  title: 'Title',
                  description: 'title details'),
            ])),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        home: TasksScreen(),
      ),
    );
  }
}
