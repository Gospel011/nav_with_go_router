import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        elevation: 1,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              //TODO: GO TO PROFILE PAGE

              context.go('/profile');
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text("Go to profile page"),
            )),
      ),
    );
  }
}
