import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/repository/authentication_repo.dart';
import 'package:meworld/core/services/service_locator.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _FormField(
                  controller: firstnameController,
                  hintText: 'Enter First name'),
              _FormField(
                  controller: lastNameController,
                  hintText: 'Enter LastName name'),
              _FormField(
                  controller: emailController,
                  hintText: 'Enter valid email',
                  validator: (text) => text != null
                      ? EmailValidator.validate(text)
                          ? null
                          : "Enter valid Email"
                      : "Enter valid text"),
              _FormField(
                  controller: passwordController,
                  hintText: 'Enter password',
                  obscureText: true),
              // SizedBox(
              //     width: MediaQuery.of(context).size.width * .9,
              //     height: 800,
              //     child: const BookingView()),
              // ElevatedButton(
              //     onPressed: () {
              //       GoRouter.of(context).push('/ECommerceView');
              //     },
              //     child: const Text("Next")),
              ElevatedButton(
                  onPressed: () async {
                    _formKey.currentState!.validate()
                        ? await sl<AuthenticationRepo>().createAccount(
                                email: emailController.text,
                                firstname: firstnameController.text,
                                lastname: lastNameController.text,
                                password: passwordController.text,
                                onError: (message) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: ListTile(
                                    title: Text(message),
                                  )));
                                })
                            ? GoRouter.of(context).canPop()
                                ? GoRouter.of(context).pop()
                                : null
                            : null
                        : null;
                  },
                  child: const Text("Sign Up"))
            ],
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      this.validator})
      : super(key: key);
  final String hintText;
  final String? Function(String?)? validator;

  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}

enum BusinessTypes { gym, consultant, sportscenter, pharmacy, freelancer }

enum WeekDays { sunday, monday, tuesday, wednesday, thursday, friday, saturday }
