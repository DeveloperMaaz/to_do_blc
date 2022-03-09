class TaskModel {
  late double id;
  late String title;
  late String description;


  TaskModel({required this.id,required this.title,required this.description});

  static List<TaskModel> todos=[];
}