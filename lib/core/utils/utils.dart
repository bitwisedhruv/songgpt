import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String data}) =>
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(data),
        ),
      );
