import 'package:flutter/material.dart';

class TrainView extends StatefulWidget {
  const TrainView({super.key});

  @override
  State<TrainView> createState() => _TrainViewState();
}

class _TrainViewState extends State<TrainView> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('TRAINING'));
  }
}
