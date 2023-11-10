import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/providers/todo_providers.dart';

class AddTodo extends ConsumerWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController todoContentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("Add a Todo Item")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: todoContentController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          TextButton(
              onPressed: () {
                ref
                    .read(todoProvider.notifier)
                    .addTodo(todoContentController.text);
                Navigator.pop(context);
              },
              child: const Text("Add Todo"))
        ],
      ),
    );
  }
}
