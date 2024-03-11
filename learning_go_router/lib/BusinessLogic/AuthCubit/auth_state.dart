// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'auth_cubit.dart';

class AuthState {
  final User? user;
  AuthState({
    this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user?.toMap(),
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      user: map['user'] != null ? User.fromMap(map['user'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) => AuthState.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AuthInitial extends AuthState {}

class AuthSigningUp extends AuthState {}

class AuthSignedUp extends AuthState {
  AuthSignedUp({required super.user});
}

class AuthLogginIn extends AuthState {}

class AuthLogednIn extends AuthState {
  AuthLogednIn({required super.user});
}

class AuthLoggedOut extends AuthState {}
