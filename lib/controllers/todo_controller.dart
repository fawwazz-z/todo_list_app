import 'package:get/get.dart';

class Todo {
  String title;
  String description;
  String category;
  bool isDone;

  Todo({
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
  });
}

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String title, String description, String category) {
    todos.add(Todo(title: title, description: description, category: category));
  }

  void markAsDone(int index) {
    todos[index].isDone = true;
    todos.refresh();
  }

  List<Todo> get activeTodos => todos.where((t) => !t.isDone).toList();
  List<Todo> get history => todos.where((t) => t.isDone).toList();
}
