import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:synkrama/constants/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:synkrama/utilities/error_dialogue.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 47,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: 200,
                      height: 150,
                      child: const Icon(
                        Icons.person_add,
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
                    children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 230.0,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'enter your username',
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
                          style: TextStyle(
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
                        Icons.lock,
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
                              hintText: 'enter password',
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
                    children: const [
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 230.0,
                        child: TextField(
                          enableSuggestions: false,
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              hintText: 're-enter password',
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
                          style: TextStyle(
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
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
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
                        if (e.code == 'week-password') {
                          await showErrorDialog(
                            (context),
                            'week password',
                          );
                        } else if (e.code == 'email-already-in-use') {
                          await showErrorDialog(
                            (context),
                            'email already in use',
                          );
                        } else if (e.code == 'invalid-email') {
                          await showErrorDialog(
                            (context),
                            'Invalid email!',
                          );
                        } else {
                          await showErrorDialog(
                            (context),
                            'something went wrong',
                          );
                        }
                      } catch (_) {
                        await showErrorDialog(
                          (context),
                          'something went wrong!',
                        );
                      }
                    },
                    child: const Text(
                      'Conntinue',
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
