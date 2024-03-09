import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      
      body: Center(
        child: Center(
        child: ElevatedButton(
            onPressed: () {
              //TODO: GO TO PROFILE PAGE

              context.go('/');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Go to home page"),
            )),
      ),
      ),
    );
  }
}
