import 'package:clean_architecture/data/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserEntity {
  int id;
  String name;
  String username;
  String email;

  UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  factory UserEntity.fromHiveUser(User user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
    );
  }
}
