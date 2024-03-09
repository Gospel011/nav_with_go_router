import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("L O G I N")),
      
      body: Center(
        child: Center(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  //TODO: GO TO PROFILE PAGE
            
                  context.go('/login/signup');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Go to signup page"),
                )),

            ElevatedButton(
                onPressed: () {
                  //TODO: GO TO PROFILE PAGE
            
                  context.go('/');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Go to home page"),
                )),
          ],
        ),
      ),
      ),
    );
  }
}
