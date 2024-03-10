import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("L O G I N")),
      body: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
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

                  context.go('/home1');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Go to home page"),
                )),
            ElevatedButton(
                onPressed: () {
                  //TODO: GO TO PROFILE PAGE

                  context.go('/login/forgot-password');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Go to forgot password page"),
                )),
            ElevatedButton(
                onPressed: () {
                  //TODO: GO TO PROFILE PAGE

                  context.go('/verify-email');
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Go to verify-email password page"),
                )),
            ElevatedButton(
                onPressed: () {
                  //TODO: GO TO PROFILE PAGE

                  const User user = User(
                      id: "iejei9398jfEerE#3gaof",
                      firstName: "John",
                      lastName: "Doe",
                      email: "johndoe@gmail.com");

                  context.go('/profile/${user.id}', extra: user);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Go to profile page"),
                )),
          ],
        ),
      ),
    );
  }
}
