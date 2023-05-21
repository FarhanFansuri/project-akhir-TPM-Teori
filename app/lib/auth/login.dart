import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'encrypt.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/login.png'),
              const SizedBox(
                height: 20.0,
              ),
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 50.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _usernamecontroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Username")),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), label: Text("Password")),
              ),
              const SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  String username = "rvqvDK5MhYWhRK4Ynogsiw==";
                  String password = "vfGtEcxLgoKmQ6kfmY8rjA==";
                  if (EncriptLogin.encrypt(_passwordcontroller.text) ==
                          password &&
                      EncriptLogin.encrypt(_usernamecontroller.text) ==
                          username) {
                    Navigator.pushNamed(context, '/menu');
                  }
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 0, 118, 228),
                  ),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 23.0,
                        fontFamily: AutofillHints.addressCity,
                        color: Colors.white),
                  )),
                ),
              )
            ]),
      ),
    );
  }
}
