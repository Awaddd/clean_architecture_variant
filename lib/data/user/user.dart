import 'package:clean_architecture/models/user/user.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class HiveUser {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String username;

  @HiveField(3)
  String email;

  HiveUser({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory HiveUser.fromUserEntity(User user) {
    return HiveUser(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
    );
  }
}
