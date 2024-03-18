import 'package:flutter/material.dart';

typedef DialogOptionBuildr<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String titele,
  required String content,
  required DialogOptionBuildr optionBuildr,
}) {
  return showDialog<T?>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(titele),
        content: Text(content),
        actions: optionBuildr()
            .entries
            .map(
              (e) => TextButton(
                child: Text(e.key),
                onPressed: () {
                  if (e.value != null) {
                    Navigator.of(context).pop(e.value);
                  } else {
                    Navigator.of(context).pop();
                  }
                },
              ),
            )
            .toList(),
      );
    },
  );
}
