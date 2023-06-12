import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  static String get routeName => 'nextPage';
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Next Page'),
      ),
    );
  }
}
