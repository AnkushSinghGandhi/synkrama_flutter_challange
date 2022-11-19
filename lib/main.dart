import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
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
                    children: const [
                      Icon(
                        Icons.mail,
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
                    onPressed: () {},
                    child: const Text(
                      'Login',
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
