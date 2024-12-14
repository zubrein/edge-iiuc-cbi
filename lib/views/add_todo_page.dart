import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: 'Todo Title'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = textController.text.trim();
                if (title.isNotEmpty) {
                  controller.addTodo(title);
                  Get.back();
                }
              },
              child: const Text('Add Todo'),
            )
          ],
        ),
      ),
    );
  }
}
