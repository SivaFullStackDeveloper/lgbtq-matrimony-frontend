import 'package:flutter/material.dart';
import 'package:lgbtq_matrimony_app/exports.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const  Text("This Login screen"),
          InkWell(
            child: const Text("Go to OTP screen"),
            onTap: () {

             context.push('/verify');
            },
          ),
          ],
      ),
    );
  }
}
