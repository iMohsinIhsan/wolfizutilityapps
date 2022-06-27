import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/todo_home_controller.dart';

class TodoHomeView extends GetView<TodoHomeController> {
  const TodoHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Todo',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
