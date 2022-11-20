import 'package:flutter/material.dart';
import 'package:synkrama/screens/home_screen.dart';
import 'package:synkrama/screens/signup_screen.dart';
import 'package:synkrama/screens/login_screen.dart';
import 'package:synkrama/constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignupDemo(),
      routes: {
        loginRoute: (context) => const LoginDemo(),
        signupRoute: (context) => const SignupDemo(),
        homeRoute: (context) => const HomeScreen(),
      },
    );
  }
}
