import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'src/core/restClient/rest_client.dart';
import 'src/features/home/data/datasources/home_remote_data_source.dart';
import 'src/features/home/domain/repositories/home_repository.dart';
import 'src/features/home/domain/usecases/fetch_movie.dart';
import 'src/squad_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setups();
  runApp(const SquadApp());
}

Future<void> setups() async {
  await setupWindowSize();
  await setupLocator();
}

Future<void> setupLocator() async {
  GetIt.I.registerLazySingleton(() => RestClient());
  GetIt.I.registerLazySingleton(() => FetchMovie());
  GetIt.I.registerLazySingleton(() => HomeRepository());
  GetIt.I.registerLazySingleton(() => HomeRemoteDataSource());
}

Future<void> setupWindowSize() async {
  const Size windowSize = Size(360.0 * 1.25, 800.0 * 1.25);
  await DesktopWindow.setWindowSize(windowSize);
}
