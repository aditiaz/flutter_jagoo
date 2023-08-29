import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({required this.title, super.key});
  final String title;
  @override
  Widget build(context) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        color: Color.fromRGBO(44, 212, 131, 1),
        fontWeight: FontWeight.w700,
        fontSize: 17,
      ),
    );
  }
}
