import 'package:clean_architecture/core/state/state.dart';
import 'package:clean_architecture/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends ConsumerWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);

    ref.listen(counterProvider, (previous, next) {
      if (next >= 5 && next > previous!) {
        context.showErrorNotification(
          message: 'Counter dangerously high. Do not exceed!',
        );
      }
    });

    return Column(
      children: [
        //
        Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displaySmall,
        ),

        //
        const SizedBox(height: 16),

        //
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.outlined(
              onPressed: () {
                ref.read(counterProvider.notifier).state--;
              },
              icon: const Icon(Icons.remove),
            ),

            //
            const SizedBox(width: 10),

            //
            IconButton.outlined(
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
