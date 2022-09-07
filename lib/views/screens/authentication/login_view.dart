import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: _emailController,
              validator: (email) {
                if (email != null) {
                  return EmailValidator.validate(email)
                      ? null
                      : 'Enter a valid email';
                }
                return 'No email was entered';
              },
              decoration: InputDecoration(
                helperText: 'Enter email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              onChanged: (password) {},
              decoration: InputDecoration(
                helperText: 'Enter Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                // Login button: validate detail
                GoRouter.of(context).go('/MainApp');
              },
              child: const Text("Login")),
          ElevatedButton(
              onPressed: () {
                // Login button: validate detail
                GoRouter.of(context).push('/SignUp');
              },
              child: const Text("Sign Up with gmail")),
          ElevatedButton(
              onPressed: () {
                // Login button: validate detail, making another commit cos mbin
                GoRouter.of(context).push('/ResetPassword');
              },
              child: const Text("Reset Password")),
        ],
      ),
    );
  }
}
