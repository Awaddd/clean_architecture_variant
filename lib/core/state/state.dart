import 'dart:io';

import 'package:clean_architecture/data/database/user/user.dart';
import 'package:clean_architecture/data/network/client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

final counterProvider = StateProvider((ref) => 0);
final cacheProvider = Provider((ref) => initialiseCache());
final apiProvider = Provider((ref) => initialiseApiClient());

Future<BoxCollection> initialiseCache() async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final BoxCollection collection = await BoxCollection.open(
    'local_database',
    {'users'},
    path: directory.path,
  );

  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(UserAdapter());
  }

  return collection;
}

ApiClient initialiseApiClient() {
  final Dio dio = Dio(BaseOptions(contentType: "application/json"));
  return ApiClient(dio);
}
