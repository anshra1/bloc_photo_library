import 'package:bloc_photo_library/bloc/app_bloc.dart';
import 'package:bloc_photo_library/extension/if_dedug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginView extends HookWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController =
        useTextEditingController(text: 'abcd@gmail.com'.ifDebugging);
    final passwordController =
        useTextEditingController(text: 'abcde12'.ifDebugging);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter your email here....',
              ),
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter your password here....',
              ),
              keyboardType: TextInputType.visiblePassword,
              keyboardAppearance: Brightness.dark,
              obscureText: true,
              
            ),
            TextButton(
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                context.read<AppBloc>().add(
                      AppEventLogIn(
                        email: email,
                        password: password,
                      ),
                    );
              },
              child: const Text('Log in'),
            ),
            TextButton(
              onPressed: () {
                context.read<AppBloc>().add(
                      const AppEventGoToRegisteration(),
                    );
              },
              child: const Text('Not Registered yet? Register here!'),
            ),
          ],
        ),
      ),
    );
  }
}
