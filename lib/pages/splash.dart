import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const Splash({Key? key, required this.onInitializationComplete})
      : super(
          key: key,
        );

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5))
        .then((_) => widget.onInitializationComplete());
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }
}

// Future<void> _setup(BuildContext context) async {}

Widget _buildUi() {
  return const MaterialApp(
    title: "to do",
    home: Scaffold(
        body: Center(
            child: Text(
      "To do",
      style: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.pink),
    ))),
  );
}
