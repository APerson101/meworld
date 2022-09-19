import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/repository/authentication_repo.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:password_validated_field/password_validated_field.dart';

class ResetPasswordView extends ConsumerWidget {
  ResetPasswordView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey();
  final isProcessing = StateProvider((ref) => false);
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: emailController,
                  onChanged: (enteredText) {
                    enteredText.isNotEmpty
                        ? ref.watch(isProcessing.notifier).state = true
                        : ref.watch(isProcessing.notifier).state = false;
                  },
                  validator: (email) {
                    return email != null
                        ? email.isNotEmpty
                            ? EmailValidator.validate(email)
                                ? null
                                : 'Invalid Email Entered'
                            : 'No email Entered'
                        : null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: ref.watch(isProcessing)
                              ? const Icon(Icons.cancel)
                              : const CircularProgressIndicator.adaptive()),
                      helperText: "Enter Email Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              ElevatedButton(
                  onPressed: () async {
                    _formKey.currentState!.validate()
                        ? await sl<AuthenticationRepo>().sendResetEmail(
                            email: emailController.text,
                            error: (message) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: ListTile(
                                title: Text(message),
                              )));
                            },
                            success: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: ListTile(
                                leading: const Text("Reset"),
                                title: Text(
                                    "A reset link has been sent to ${emailController.text}"),
                              )));
                              GoRouter.of(context).push('/resetCode');
                            })
                        : null;
                  },
                  child: const Text("Reset"))
            ],
          ),
        ));
  }
}

class EnterCodeView extends StatelessWidget {
  const EnterCodeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const Text("A reset link was sent to adsf@gmail.com"),
          TextField(
            decoration: InputDecoration(
                hintText: 'Enter code',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => _EnterNewPasswordView()));
              },
              child: const Text("Confirm"))
        ],
      ),
    );
  }
}

class _EnterNewPasswordView extends ConsumerWidget {
  _EnterNewPasswordView({Key? key}) : super(key: key);
  final _passwordKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final loadingState = StateProvider((ref) => false);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        child: Form(
      key: _passwordKey,
      child: Column(
        children: [
          PasswordValidatedFields(
              textEditingController: passwordController,
              inputDecoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)))),
          TextFormField(
              validator: (password) => passwordController.text == password
                  ? null
                  : "Password does not match",
              onChanged: (text) => _passwordKey.currentState!.validate(),
              decoration: InputDecoration(
                  hintText: 'Confirm password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)))),
          ElevatedButton(
              onPressed: () {
                Future.delayed(const Duration(seconds: 1),
                    () => GoRouter.of(context).go('/'));
              },
              child: ref.watch(loadingState)
                  ? const CircularProgressIndicator.adaptive()
                  : const Text("Confirm new Password"))
        ],
      ),
    ));
  }
}
