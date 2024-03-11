import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/Models/user_model.dart';

class HomePageMain extends StatelessWidget {
  const HomePageMain({super.key, required StatefulNavigationShell shell})
      : _shell = shell;

  final StatefulNavigationShell _shell;

  static const double? _splashRadius = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(children: [
                const DrawerHeader(
                  child: Center(child: Text("GO ROUTER APP")),
                ),
                ListTile(
                  title: const Text("View profile"),
                  onTap: () {
                    context.pop();
                    const User user = User(
                        id: "iejei9398jfEerE#3gaof",
                        firstName: "John",
                        lastName: "Doe",
                        email: "johndoe@gmail.com");

                    context.push('/home1/profile/${user.id}', extra: user);
                  },
                ),
                ListTile(
                  title: const Text("Logout"),
                  onTap: () {
                    context.go('/login');
                  },
                )
              ]),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text("Home Page"),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       context.go('/login');
            //     },
            //     icon: const Icon(Icons.logout_rounded)),
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.menu_rounded));
            })
          ],
          elevation: 1,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    splashRadius: _splashRadius,
                    onPressed: () {
                      print(
                          "Home pressed: ${_shell.currentIndex}, ${_shell.route}");

                      _shell.goBranch(0);
                    },
                    icon: const Icon(Icons.home_rounded)),
                IconButton(
                    splashRadius: _splashRadius,
                    onPressed: () {
                      print("Videos presed: ${_shell.currentIndex}");

                      _shell.goBranch(1);
                    },
                    icon: const Icon(Icons.tv_rounded)),
                IconButton(
                    splashRadius: _splashRadius,
                    onPressed: () {
                      print("Add home pressed: ${_shell.currentIndex}");

                      _shell.goBranch(2);
                    },
                    icon: const Icon(Icons.add_home_work_rounded)),
              ],
            ),
          ),
        ),
        body: _shell);
  }
}
