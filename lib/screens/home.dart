import 'package:clean_architecture/core/templates/layout.dart';
// import 'package:clean_architecture/features/counter/counter.dart';
import 'package:clean_architecture/features/display_users/delete_users.dart';
import 'package:clean_architecture/features/display_users/user_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          const SizedBox(height: 16),

          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    'Users',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),

                //
                const SizedBox(width: 10),

                //
                const DeleteUsersButton(),
              ],
            ),
          ),

          //
          const SizedBox(height: 16),

          // const Counter(),

          //
          const UserList(),
        ],
      ),
    );
  }
}
