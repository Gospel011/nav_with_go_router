import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("S I G N U P")),
      
      body: Center(
        child: Center(
        child: ElevatedButton(
                onPressed: () {
                  //TODO: GO TO PROFILE PAGE
            
                  context.go('/verify-email');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Go to email verification page"),
                )),
      ),
      ),
    );
  }
}
