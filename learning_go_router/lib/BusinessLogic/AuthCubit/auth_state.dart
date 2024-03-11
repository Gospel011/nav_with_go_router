// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'auth_cubit.dart';

class AuthState {
  final User? user;
  final String? error;
  AuthState({this.user, this.error});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user?.toMap(),
      'error': error,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null,
      error: map['error'] != null ? map['error'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthState.fromJson(String source) =>
      AuthState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthState(user: $user, error: $error)';

  AuthState copyWith({
    User? user,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(covariant AuthState other) {
    if (identical(this, other)) return true;

    return other.user == user && other.error == error;
  }

  @override
  int get hashCode => user.hashCode ^ error.hashCode;
}

class AuthInitial extends AuthState {}

class AuthSignupFailed extends AuthState {
  AuthSignupFailed({required super.error});
}

class AuthSigningUp extends AuthState {}

class AuthSignedUp extends AuthState {
  AuthSignedUp({required super.user});
}

class AuthLogginIn extends AuthState {}

class AuthLogednIn extends AuthState {
  AuthLogednIn({required super.user});
}

class AuthLoggedOut extends AuthState {}
