import 'package:clean_architecture/core/templates/layout.dart';
import 'package:clean_architecture/features/users/widget/user_list.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Users',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),

          //
          const SizedBox(height: 16),

          //
          const UserList(),
        ],
      ),
    );
  }
}
