// library auth_cubit;

import 'dart:convert';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:learning_go_router/Models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login() async {
    emit(AuthLogginIn());
    Future.delayed(Duration(seconds: Random().nextInt(5)), () {
      emit(AuthLogednIn(user: state.user));
    });
  }

  Future<void> signup(
      {required String firstName,
      required String lastName,
      required String email}) async {
    emit(AuthSigningUp());

    if (firstName.length <= 1 || lastName.length <= 1 || !email.contains("@")) {
      emit(AuthSignupFailed(error: "Please specify your details"));

      return;
    }

    Future.delayed(Duration(seconds: Random().nextInt(5)), () {
      emit(AuthSignedUp(
          user: User(
              id: (Random().nextInt(99999) + 10000).toString(),
              firstName: firstName,
              lastName: lastName,
              email: email)));
    });
  }

  Future<void> logout() async {
    emit(AuthLoggedOut());
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    print("GETTING PREVIOUSLY SAVED STATE");
    return AuthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    print("SAVING STATE");

    return state.toMap();
  }
}
