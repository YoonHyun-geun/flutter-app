import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int index;

  const DetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // Text color for AppBar
      ),
      body: Center(
        child: Text(
          'Detail Screen for item $index',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
