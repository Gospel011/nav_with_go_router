import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("V E R I F Y   E M A I L")),
      
      body: Center(
        child: Center(
        child: Row(
          children: [
            ElevatedButton(
                    onPressed: () {
                      //TODO: GO TO PROFILE PAGE
                
                      context.go('/');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text("Go to home page"),
                    )),

            ElevatedButton(
                    onPressed: () {
                      //TODO: GO TO PROFILE PAGE
                
                      context.go('/login');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Text("Go to login page"),
                    )),
          ],
        ),
      ),
      ),
    );
  }
}
