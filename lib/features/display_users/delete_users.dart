import 'package:clean_architecture/core/utils/extensions.dart';
import 'package:clean_architecture/data/user/user.dart';
import 'package:clean_architecture/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteUsersButton extends ConsumerStatefulWidget {
  const DeleteUsersButton({super.key});

  @override
  ConsumerState<DeleteUsersButton> createState() => _DeleteUsersButtonState();
}

class _DeleteUsersButtonState extends ConsumerState<DeleteUsersButton> {
  Future<void> deleteUsers() async {
    final db = await ref.read(cacheProvider);
    final usersBox = await db.openBox<User>('users');
    usersBox.clear();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        deleteUsers();
        context.showNotification(message: 'Deleted all users');
      },
      icon: const Icon(Icons.delete),
    );
  }
}
