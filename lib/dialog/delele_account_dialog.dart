import 'package:bloc_photo_library/dialog/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> showDeleteAccountDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    titele: 'Delete Account',
    content:
        'Are you sure you want to delete your account? You cannot undo the operation!',
    optionBuildr: () => {
      'cancel': false,
      'Delete Account': true,
    },
  ).then((value) => value ?? false);
}
