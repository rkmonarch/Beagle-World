



import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message, String variant) {
  Color backgroundColor = Colors.blueAccent;
  if (variant == 'error') {
    backgroundColor = Colors.red.shade400;
  } else if (variant == 'success') {
    backgroundColor = Colors.green.shade500;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      backgroundColor: backgroundColor,
      content: Text(message),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}