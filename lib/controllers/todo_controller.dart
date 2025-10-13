import 'package:get/get.dart';
import '../helpers/db_helper.dart';

class Todo {
  int? id;
  String title;
  String description;
  String category;
  bool isDone;
  String? date;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isDone = false,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'isDone': isDone ? 1 : 0,
      'date': date,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      isDone: map['isDone'] == 1,
      date: map['date'],
    );
  }
}

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  final dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final data = await dbHelper.getTodos();
    todos.value = data.map((e) => Todo.fromMap(e)).toList();
  }

  Future<void> addTodo(
    String title,
    String desc,
    String category,
    String date,
  ) async {
    final todo = Todo(
      title: title,
      description: desc,
      category: category,
      date: date,
      isDone: false,
    );
    await dbHelper.insertTodo(todo.toMap());
    await loadTodos();
  }

  Future<void> markAsDone(int index) async {
    final todo = todos[index];
    final updated = Todo(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      category: todo.category,
      date: todo.date,
      isDone: true,
    );
    await dbHelper.updateTodo(todo.id!, updated.toMap());
    await loadTodos();
  }

  Future<void> updateTodo(Todo updatedTodo) async {
    await dbHelper.updateTodo(updatedTodo.id!, updatedTodo.toMap());
    await loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await dbHelper.deleteTodo(id);
    await loadTodos();
  }

  List<Todo> get activeTodos => todos.where((t) => !t.isDone).toList();
  List<Todo> get history => todos.where((t) => t.isDone).toList();
}
