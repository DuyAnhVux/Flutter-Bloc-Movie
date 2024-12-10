import 'package:flutter/material.dart';

class DisplayMessage {
  static void errorMessage(String message, BuildContext context,
      {Color textColor = Colors.white, Color backgroundColor = Colors.red}) {
    var snackbar = SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void successMessage(String message, BuildContext context,
      {Color textColor = Colors.green, Color backgroundColor = Colors.white}) {
    var snackbar = SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
