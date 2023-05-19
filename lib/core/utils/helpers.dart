import 'dart:io';

import 'package:clean_architecture/core/api/api_client.dart';
import 'package:clean_architecture/data/user/user.dart';
import 'package:dio/dio.dart';
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
    Hive.registerAdapter(UserAdapter());
  }

  return collection;
}

ApiClient initialiseApiClient() {
  final Dio dio = Dio(BaseOptions(contentType: "application/json"));
  return ApiClient(dio);
}
