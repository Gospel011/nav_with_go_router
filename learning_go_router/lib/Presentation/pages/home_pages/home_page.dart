import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';
import 'package:learning_go_router/Presentation/widgets/my_elevated_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyElevatedButton(
          onPressed: () {
            //TODO: GO TO PROFILE PAGE

            const User user = User(
                id: "iejei9398jfEerE#3gaof",
                firstName: "John",
                lastName: "Doe",
                email: "johndoe@gmail.com");

            context.push('/home1/profile/${user.id}', extra: user);
          },
          text: "Go to profile page"),
    );
  }
}
