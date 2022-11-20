import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final message;
  const ErrorMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          color: Colors.redAccent,
        ),
        Text(
          message,
          style: themeData.textTheme.bodyText1,
        ),
      ],
    );
  }
}
