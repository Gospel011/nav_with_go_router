import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';

class SecondHomePage extends StatelessWidget {
  const SecondHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Second home page"),

          const SizedBox(height: 32,),


          ElevatedButton(
              onPressed: () {
                //TODO: GO TO PROFILE PAGE
          
                const User user = User(
                    id: "iejei9398jfEerE#3gaof",
                    firstName: "John",
                    lastName: "Doe",
                    email: "johndoe@gmail.com");
          
                context.push('/home1/profile/${user.id}', extra: user);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text("Go to profile page"),
              )),
        ],
      ),
    );
  }
}
