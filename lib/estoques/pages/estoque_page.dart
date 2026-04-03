import 'package:flutter/material.dart';

class EstoquePage extends StatelessWidget {
  const EstoquePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 200,
        color: Colors.amberAccent,
        child: Text('Estoque'),
      ),
    );
  }
}