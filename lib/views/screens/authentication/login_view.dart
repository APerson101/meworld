import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/repository/authentication_repo.dart';
import 'package:meworld/core/services/service_locator.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login to MeWorld'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 400,
                  height: 400,
                  child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset('assets/images/login.png'))),
              StyledTextField(
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
                    hintText: 'Enter email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(29)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StyledTextField(
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              StyledButton(
                  onPressed: () {
                    _formKey.currentState!.validate()
                        ? sl<AuthenticationRepo>().login(
                            _emailController.text, _passwordController.text,
                            (message) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: ListTile(
                              title: Text(message),
                            )));
                          })
                        : null;
                  },
                  child: const Text("Login")),
              const SizedBox(
                height: 40,
              ),
              // Text.rich(TextSpan(text: "Don't have an account? ", children: [
              //   TextSpan(
              //       text: 'Sign Up',
              //       recognizer: TapGestureRecognizer()
              //         ..onTap = () {
              //           GoRouter.of(context).push('/SignUp');
              //         },
              //       style: TextStyle(color: Theme.of(context).highlightColor))
              // ]
              // )),
              // ElevatedButton(
              //     onPressed: () {
              //       // Login button: validate detail
              //       GoRouter.of(context).push('/SignUp');
              //     },
              //     child: const Text("Sign Up")),
              // ElevatedButton(
              //     onPressed: () {
              //       // Login button: validate detail
              //       GoRouter.of(context).push('/ResetPassword');
              //     },
              //     child: const Text("Reset Password")),
            ],
          ),
        ),
      ),
    );
  }
}

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        alignment: Alignment.topLeft,
        // alignment: Alignment.center,
        children: [
          Opacity(
            opacity: .3,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('assets/images/background1.png'))),
          ),
          Positioned(
            // left: 0,
            right: 20,
            width: 300,
            top: -50,
            child: Image.asset(
              'assets/images/loginbkg.png',
              width: size.width * .3,
            ),
          ),
          Positioned(
            bottom: 300,
            left: -30,
            width: 300,
            child: Image.asset(
              'assets/images/logingckg2.png',
              width: size.width * .3,
            ),
          ),
          Positioned(
            bottom: 150,
            left: 50,
            right: 50,
            child: StyledButton(
              child: const Text(
                "LOGIN",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    (MaterialPageRoute(builder: (context) => LoginView())));
              },
            ),
          ),
          Positioned(
            bottom: 75,
            left: 50,
            right: 50,
            child: StyledButton(
                onPressed: () {
                  GoRouter.of(context).push('/SignUp');
                },
                opacity: .5,
                child: const Text(
                  "SIGNUP",
                  style: TextStyle(fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  const StyledButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.opacity = 1})
      : super(key: key);
  final void Function()? onPressed;
  final double opacity;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor.withOpacity(opacity),
          minimumSize: Size(width * .8, 60),
          padding: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: child,
    );
  }
}

class StyledTextField extends StatelessWidget {
  StyledTextField({Key? key, required this.child}) : super(key: key);
  Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(29),
          ),
          child: child,
        ),
      ),
    );
  }
}
