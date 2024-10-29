import 'dart:convert';

class AppUserModel {
  final String name;
  final String email;
  final String uid;
  AppUserModel({
    required this.name,
    required this.email,
    required this.uid,
  });

  AppUserModel copyWith({
    String? name,
    String? email,
    String? uid,
  }) {
    return AppUserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'uid': uid,
    };
  }

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUserModel.fromJson(String source) =>
      AppUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppUserModel(name: $name, email: $email, uid: $uid)';

  @override
  bool operator ==(covariant AppUserModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.uid == uid;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ uid.hashCode;
}
