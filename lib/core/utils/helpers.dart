import 'dart:io';

import 'package:clean_architecture/data/user/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<BoxCollection> initialiseCache() async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final BoxCollection collection = await BoxCollection.open(
    'local_database',
    {'users'},
    path: directory.path,
  );

  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(HiveUserAdapter());
  }

  return collection;
}
