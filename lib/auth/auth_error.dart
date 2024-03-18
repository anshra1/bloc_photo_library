import 'package:firebase_auth/firebase_auth.dart';

const Map<String, AuthError> authErrorMaping = {
  'user-not-found':AuthErrorUserNotFound(),
  'weak-password':WeakPassword(),
  'auth/invalid-email':AuthErrorInvalidEmail(),
  'operation-not-allowed':AuthErrorOpertationNotAllowed(),
  'email-already-in-use':EmailErrorEmailAlredyInUse(),
  'requires-recent-login':AuthErrorRequiresRecentLogin(),
  'no-current-user':AuthErrorNoCurrentUser(),

};

abstract class AuthError {
  final String dialogTitle;
  final String dialogText;

  const AuthError({
    required this.dialogTitle,
    required this.dialogText,
  });

  factory AuthError.from(FirebaseAuthException exception) =>
      authErrorMaping[exception.code.toLowerCase().trim()] ??
      const AuthErrorUnknown();
}

class AuthErrorUnknown extends AuthError {
  const AuthErrorUnknown() 
      : super(
            dialogText: 'Authentication Error',
            dialogTitle: 'UnknownAuth error');
}

// no-current-user

class AuthErrorNoCurrentUser extends AuthError {
  const AuthErrorNoCurrentUser()
      : super(
          dialogTitle: 'No Current User',
          dialogText: 'No Current user with this information was found!',
        );
}

// requires-recent-login

class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin()
      : super(
          dialogTitle: 'Requires Recent Login',
          dialogText: 'You need to log out back in again in order to perform this operation.',
        );
}

// auth/operation-not-allowed

class AuthErrorOpertationNotAllowed extends AuthError {
  const AuthErrorOpertationNotAllowed()
      : super(
          dialogTitle: 'Operation not allowed',
          dialogText: 'You cannot register using this method at this moment!',
        );
}

// auth/user-not-found

class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound()
      : super(
          dialogTitle: 'User not found',
          dialogText: 'The given user was not found on the server!',
        );
}

// weak-password
class WeakPassword extends AuthError {
  const WeakPassword()
      : super(
          dialogTitle: 'Weak Password',
          dialogText: 'Please choose a stronger password consisting of more characters!',
        );
}

// auth/invalid-email

class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
          dialogTitle: 'Invalid email',
          dialogText: 'Please double check your email and try again!',
        );
}
//email-already-in-use
class EmailErrorEmailAlredyInUse extends AuthError {
  const EmailErrorEmailAlredyInUse()
      : super(
          dialogTitle: 'Email already in use',
          dialogText: 'Please choose another email to register with!',
        );
}