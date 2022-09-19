import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class AuthenticationRepo {
  FirebaseAuth auth = GetIt.I<FirebaseAuth>();
  login(String email, String password,
      void Function(String) snackbarShower) async {
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(
          "User signed in is: ${user.user?.email} with id: ${user.user?.uid}");
      return user.user != null ? true : false;
    } on FirebaseAuthException catch (e) {
      log('failed with error: ${e.message}');
      snackbarShower(e.message!);
      return null;
    }
  }

  signOut() async {
    print(
        "Logging out user: ${auth.currentUser?.email} with id: ${auth.currentUser?.uid}");
    await auth.signOut();
    print("status: ${auth.currentUser}");
  }

  deleteAccount() {}

  resetPassword(
      String code, String newPassword, void Function(String) error) async {
    try {
      await auth.confirmPasswordReset(code: code, newPassword: newPassword);
      return true;
    } on FirebaseAuthException catch (e) {
      error(e.message!);
      return false;
    }
  }

  sendResetEmail(
      {required String email,
      required void Function(String) error,
      required void Function() success}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      success();
    } on FirebaseAuthException catch (e) {
      error(e.message!);
    }
  }

  createAccount(
      {required String email,
      required String firstname,
      required String password,
      required String lastname,
      required void Function(String) onError}) async {
    print('creating account....');
    try {
      var newUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // var newUser = await auth.signInWithEmailAndPassword(
      //     email: email, password: password);
      // print('logging into...${newUser.user!}');
      return (newUser.user != null) ? true : false;
    } on FirebaseAuthException catch (e) {
      onError(e.message!);
      return false;
    }
  }
}
