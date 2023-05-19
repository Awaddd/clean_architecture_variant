import 'package:clean_architecture/data/database/user/user.dart';
import 'package:clean_architecture/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserService {
  WidgetRef ref;

  UserService(this.ref);

  Future<List<User>> getUsers() async {
    final db = await ref.read(cacheProvider);
    final usersBox = await db.openBox<User>('users');
    var usersInCache = await usersBox.getAllValues();

    //if cache is empty, make api call and store in cache
    if (usersInCache.isEmpty) {
      print('Cache is empty - making api call');

      final usersApi = ref.read(apiProvider);

      await usersApi.getUsers().then((response) async {
        for (final user in response) {
          await usersBox.put(user.id.toString(), User.fromUserEntity(user));
        }
      });
    }

    final List<User> list = [];

    usersInCache = await usersBox.getAllValues();

    usersInCache.forEach((key, value) {
      list.add(value);
    });

    return list;
  }
}
