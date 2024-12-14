import 'package:get/get.dart';

import '../models/todo.dart';

class HomeController extends GetxController {
  var todos = <Todo>[].obs;

  Future<void> fetchTodos() async {}

  Future<void> addTodo(String title) async {}

  Future<void> deleteTodoById(int id) async {}

  Future<void> updateTodoById(int id, String title) async {}
}
