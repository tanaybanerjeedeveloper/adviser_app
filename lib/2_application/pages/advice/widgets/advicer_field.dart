import 'package:flutter/material.dart';

class AdvicerField extends StatelessWidget {
  final String advice;

  const AdvicerField({Key? key, required this.advice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue,
      ),
      child: Text(
        advice,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
