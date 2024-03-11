import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';
import 'package:learning_go_router/Presentation/widgets/my_elevated_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("L O G I N")),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //? EMAIL TEXTFIELD
            const TextField(
              decoration: InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 8,
            ),

            //? PASSWORD TEXTFIELD
            const TextField(
              decoration: InputDecoration(hintText: "Password"),
            ),

            //? FORGOT PASSWORD TEXT BUTTON
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      context.go('/login/forgot-password');
                    },
                    child: Text("Forgot password?"))
              ],
            ),

            const SizedBox(
              height: 24,
            ),

            //? LOGIN BUTTON
            SizedBox(
              width: double.maxFinite,
              child: MyElevatedButton(
                text: "Login",
                onPressed: () {
                  context.go('/home1');
                },
              ),
            ),

            //? DON'T HAVE AN ACCOUT SIGNUP
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                    onPressed: () {
                      context.go('/login/signup');
                    },
                    child: const Text("signup"))
              ],
            )
          ],
        ),
      )),
    );
  }
}


