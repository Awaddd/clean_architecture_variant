import 'package:clean_architecture/data/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String username;
  String email;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromHiveUser(HiveUser user) {
    return User(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
    );
  }
}
