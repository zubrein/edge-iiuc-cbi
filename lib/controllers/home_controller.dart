import 'package:get/get.dart';

import '../models/todo.dart';
import '../service/db_service.dart';

class HomeController extends GetxController {
  var todos = <Todo>[].obs;

  Future<void> fetchTodos() async {
    final data = await DBService.instance.getTodos();
    todos.assignAll(data);
  }

  Future<void> addTodo(String title) async {
    await DBService.instance.addTodo(Todo(title: title));
    await fetchTodos();
  }

  Future<void> deleteTodoById(int id) async {
    await DBService.instance.deleteTodo(id);
    await fetchTodos();
  }

  Future<void> updateTodoById(int id, String title) async {
    await DBService.instance.updateTodo(Todo(
      id: id,
      title: title,
    ));
    await fetchTodos();
  }
}
