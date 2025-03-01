import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Page"),
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('Welcome to Dashboard Page'),
      ),
    );
  }
}