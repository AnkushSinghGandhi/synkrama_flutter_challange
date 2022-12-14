import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:synkrama/utilities/error_dialogue.dart';

import '../constants/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            actions: const [
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Icon(
                  Icons.logo_dev,
                  size: 35.0,
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: 200,
                      height: 150,
                      /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 84.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 35),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 230.0,
                        child: TextField(
                          controller: _email,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              labelText: 'Email Id',
                              hintText: 'enter your email id',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromARGB(166, 255, 255, 255),
                                height: 1,
                              ),
                              hintStyle: TextStyle(
                                color: Color.fromARGB(166, 255, 255, 255),
                              ),
                              contentPadding: EdgeInsets.only(
                                bottom: 0,
                              )),
                          style: const TextStyle(
                              fontSize: 12.0, height: 1, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 35),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 230.0,
                        child: TextField(
                          controller: _password,
                          enableSuggestions: false,
                          autocorrect: false,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'enter your password',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromARGB(166, 255, 255, 255),
                                height: 1,
                              ),
                              hintStyle: TextStyle(
                                color: Color.fromARGB(166, 255, 255, 255),
                              ),
                              contentPadding: EdgeInsets.only(
                                bottom: 0,
                              )),
                          style: const TextStyle(
                              fontSize: 12.0, height: 1, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  child: TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        Firebase.initializeApp();
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        final user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, homeRoute);
                        } else {
                          await showErrorDialog(
                            (context),
                            'User not logged in',
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          await showErrorDialog(
                            (context),
                            'User not found!',
                          );
                        } else if (e.code == 'wrong-password') {
                          await showErrorDialog(
                            (context),
                            'Wrong Password',
                          );
                        } else {
                          await showErrorDialog(
                            (context),
                            'Something went wrong',
                          );
                        }
                      } catch (_) {
                        await showErrorDialog(
                          (context),
                          'Something went wrong',
                        );
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, signupRoute);
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
