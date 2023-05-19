import 'package:clean_architecture/data/user/user.dart';
import 'package:clean_architecture/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  List<HiveUser> users = [];
  bool loading = true;

  Future<void> getUsers() async {
    final db = await ref.read(cacheProvider);
    final usersBox = await db.openBox<HiveUser>('users');
    var usersInCache = await usersBox.getAllValues();

    //if cache is empty, make api call and store in cache
    if (usersInCache.isEmpty) {
      print('Cache is empty - making api call');

      final usersApi = ref.read(apiProvider);

      await usersApi.getUsers().then((response) async {
        for (final user in response) {
          await usersBox.put(user.id.toString(), HiveUser.fromUserEntity(user));
        }
      });
    }

    final List<HiveUser> list = [];

    usersInCache = await usersBox.getAllValues();

    usersInCache.forEach((key, value) {
      list.add(value);
    });

    if (list.isNotEmpty) {
      setState(() {
        users = list;
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    if (loading == true) {
      return const Center(child: CircularProgressIndicator());
    }

    return _users(users);
  }

  Widget _users(List<HiveUser> users) {
    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final HiveUser user = users[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  user.id.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),

                //
                const SizedBox(height: 5),

                //
                Text(
                  user.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),

                //
                const SizedBox(height: 5),

                //
                Text(
                  user.email,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
