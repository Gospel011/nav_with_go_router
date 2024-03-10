import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password Page")),
      
      body: Center(
        child: Center(
        child: ElevatedButton(
            onPressed: () {
              //TODO: GO TO PROFILE PAGE

              context.go('/login');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Go to login page"),
            )),
      ),
      ),
    );
  }
}
