import 'package:clean_architecture/core/utils/color_schemes.g.dart';
import 'package:clean_architecture/core/utils/helpers.dart';
import 'package:clean_architecture/core/utils/typography.dart';
import 'package:clean_architecture/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hive_flutter/hive_flutter.dart';

final counterProvider = StateProvider((ref) => 0);
final cacheProvider = Provider((ref) => initialiseCache());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: textTheme,
      ),
      themeMode: ThemeMode.dark,
      home: const Home(),
    );
  }
}
