import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do/models/todo.dart';
import 'package:to_do/providers/todo_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todoProvider);
    List<Todo> activeTodo =
        todos.where((todo) => todo.completed == false).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To Do",
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "completed");
            },
            child: const Text(
              "COMPLETED",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: activeTodo.length,
          itemBuilder: (context, index) {
            return Slidable(
                startActionPane:
                    ActionPane(motion: const ScrollMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {
                      ref.watch(todoProvider.notifier).deleteTodo(index);
                    },
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                  ),
                ]),
                endActionPane:
                    ActionPane(motion: const ScrollMotion(), children: [
                  SlidableAction(
                      onPressed: (context) {
                        ref.watch(todoProvider.notifier).completeTodo(index);
                      },
                      icon: Icons.check,
                      backgroundColor: Colors.green),
                ]),
                child: ListTile(title: Text(activeTodo[index].content)));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "add");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
