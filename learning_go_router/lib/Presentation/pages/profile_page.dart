import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.id, required this.user});

  final String id;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This is the profile of the user with id: $id and details $user"),
          
              const SizedBox(height: 32,),
          
              ElevatedButton(
                  onPressed: () {
                    //TODO: GO TO PROFILE PAGE
              
                    context.go('/home1');
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
