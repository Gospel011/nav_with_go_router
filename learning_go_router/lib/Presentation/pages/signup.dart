import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_go_router/BusinessLogic/AuthCubit/auth_cubit.dart';
import 'package:learning_go_router/Presentation/widgets/my_elevated_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _firstName = TextEditingController();
    final TextEditingController _lastName = TextEditingController();
    final TextEditingController _email = TextEditingController();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        print("CURRENT AUTH STATE: $state");

        if (state is AuthSignedUp) {
          context.go('/login');
        } else if (state is AuthSignupFailed) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text("Signup failed"),
                    content: Text(state.error!),
                  ));
        }
      },
      child: Scaffold(
          appBar: AppBar(title: const Text("S I G N U P")),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(children: [
                      Expanded(
                          child: TextField(
                        controller: _firstName,
                        decoration:
                            const InputDecoration(hintText: "First name"),
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: TextField(
                        controller: _lastName,
                        decoration: InputDecoration(hintText: "Last name"),
                      )),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _email,
                      decoration: const InputDecoration(hintText: "Email"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                      return SizedBox(
                        width: double.maxFinite,
                        child: MyElevatedButton(
                            loading: state is AuthSigningUp,
                            onPressed: () {
                              context.read<AuthCubit>().signup(
                                  firstName: _firstName.text,
                                  lastName: _lastName.text,
                                  email: _email.text);
                            },
                            text: "Signup"),
                      );
                    })
                  ]))),
    );
  }
}
