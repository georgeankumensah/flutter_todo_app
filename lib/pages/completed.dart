import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/models/todo.dart';
import 'package:to_do/providers/todo_providers.dart';

class CompletedTodosPage extends ConsumerWidget {
  const CompletedTodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todoProvider);
    List<Todo> completedTodos =
        todos.where((todo) => todo.completed == true).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("COMPLETED TODOs"),
      ),
      body: ListView.builder(
          itemCount: completedTodos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(completedTodos[index].content),
            );
          }),
    );
  }
}
