import 'package:flutter/material.dart';

showSnackBar({
  @required String message,
  @required BuildContext context,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 1500),
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).canvasColor,
    ),
  );
}
