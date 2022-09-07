import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meworld/views/screens/authentication/login_view.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: LoginView())));
}
