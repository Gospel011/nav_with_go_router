// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:learning_go_router/Models/user_model.dart';

class Post {
  final User user;
  final String text;
  Post({
    required this.user,
    required this.text,
  });
  

  Post copyWith({
    User? user,
    String? text,
  }) {
    return Post(
      user: user ?? this.user,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'text': text,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      user: User.fromMap(map['user'] as Map<String,dynamic>),
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Post(user: $user, text: $text)';

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;
  
    return 
      other.user == user &&
      other.text == text;
  }

  @override
  int get hashCode => user.hashCode ^ text.hashCode;
}
