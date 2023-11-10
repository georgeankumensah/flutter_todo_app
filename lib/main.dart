import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/pages/add.dart';
import 'package:to_do/pages/completed.dart';

//pages
import './pages/home.dart';
import "./pages/splash.dart";

void main() {
  runApp(Splash(onInitializationComplete: () {
    runApp(const ProviderScope(child: MainApp()));
  }));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "home",
      debugShowCheckedModeBanner: false,
      routes: {
        "home": (context) => const HomePage(),
        "add": (context) => const AddTodo(),
        "completed": (context) => const CompletedTodosPage(),
      },
    );
  }
}
