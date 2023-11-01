import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String name = 'HomeScreen';
  final int screenIndex;
  const HomeScreen({super.key, required this.screenIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('HomeScreen'),
      )
    );
  }
}
