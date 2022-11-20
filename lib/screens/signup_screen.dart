import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:synkrama/firebase_options.dart';
import 'package:synkrama/constants/routes.dart';
import 'package:firebase_core/firebase_core.dart';

class SignupDemo extends StatefulWidget {
  const SignupDemo({super.key});

  @override
  State<SignupDemo> createState() => _SignupDemoState();
}

class _SignupDemoState extends State<SignupDemo> {
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
      // <-- STACK AS THE SCAFFOLD PARENT
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
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
          backgroundColor:
              Colors.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG
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
                        Icons.person_add,
                        color: Colors.white,
                        size: 84.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 60),
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
                                bottom: 0, // HERE THE IMPORTANT PART
                              )),
                          style: TextStyle(
                              fontSize: 12.0, height: 1, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 60),
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
                                bottom: 0, // HERE THE IMPORTANT PART
                              )),
                          style: const TextStyle(
                              fontSize: 12.0, height: 1, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 60),
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
                                bottom: 0, // HERE THE IMPORTANT PART
                              )),
                          style: const TextStyle(
                              fontSize: 12.0, height: 1, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 60),
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
                                bottom: 0, // HERE THE IMPORTANT PART
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
                        }
                      } catch (e) {
                        print(e);
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
