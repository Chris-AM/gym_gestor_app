import 'package:flutter/material.dart';

class CheckAuthStatusScreens extends StatelessWidget {
  const CheckAuthStatusScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
