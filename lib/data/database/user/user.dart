import 'package:clean_architecture/data/network/user/user.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String username;

  @HiveField(3)
  String email;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory User.fromUserEntity(UserEntity user) {
    return User(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
    );
  }
}
