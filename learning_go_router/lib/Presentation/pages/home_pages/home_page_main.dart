import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';

class HomePageMain extends StatelessWidget {
  const HomePageMain({super.key, required StatefulNavigationShell shell})
      : _shell = shell;

  final StatefulNavigationShell _shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        elevation: 1,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  print("Home pressed: ${_shell.currentIndex}, ${_shell.route}");

                  _shell.goBranch(0);
                },
                icon: const Icon(Icons.home_rounded)),
            IconButton(
                onPressed: () {
                  print("Videos presed: ${_shell.currentIndex}");

                  _shell.goBranch(1);
                },
                icon: const Icon(Icons.tv_rounded)),
            IconButton(
                onPressed: () {
                  print("Add home pressed: ${_shell.currentIndex}");

                  _shell.goBranch(2);
                },
                icon: const Icon(Icons.add_home_work_rounded)),
          ],
        ),
      ),
      body: _shell
    );
  }
}
