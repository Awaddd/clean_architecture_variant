import 'package:clean_architecture/core/api/api_client.dart';
import 'package:clean_architecture/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [];
  bool loading = true;

  Future getUsers() async {
    final apiClient =
        ApiClient(Dio(BaseOptions(contentType: "application/json")));

    apiClient.getUsers().then((response) {
      setState(() {
        users = response;
        loading = false;
      });
    });
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
                  user.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
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
