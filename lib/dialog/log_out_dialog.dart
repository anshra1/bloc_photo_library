import 'package:bloc_photo_library/dialog/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    titele: 'Log Out',
    content:
        'Are you sure you want to log out?',
    optionBuildr: () => {
      'cancel': false,
      'log out': true,
    },
  ).then((value) => value ?? false);
}
