import 'package:clean_architecture/data/database/user/user.dart';
import 'package:clean_architecture/data/services/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<UserList> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  List<User> users = [];
  bool loading = true;

  Future<void> fetchUsers() async {
    final list = await UserService(ref).getUsers();

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
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    if (loading == true) {
      return const Center(child: CircularProgressIndicator());
    }

    return _users(users);
  }

  Widget _users(List<User> users) {
    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final User user = users[index];
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
