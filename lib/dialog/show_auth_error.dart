import 'package:bloc_photo_library/auth/auth_error.dart';
import 'package:bloc_photo_library/dialog/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showAuthError(
    {required AuthError authError, required BuildContext context}) {
  return showGenericDialog<void>(
    context: context,
    titele: authError.dialogTitle,
    content: authError.dialogText,
    optionBuildr: () => {
      'OK': true,
    },
  );
}
