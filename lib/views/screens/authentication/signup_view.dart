import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Enter Something',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).replace('/MainApp');
              },
              child: const Text("Sign Up"))
        ],
      ),
    );
  }
}
