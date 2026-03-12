import 'package:demo/app_state.dart';
import 'package:demo/services/auth/auth.dart';
import 'package:get_it/get_it.dart';
import './local_storage/local_storage.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<LocalStorage>(() => LocalStorage());
  getIt.registerLazySingleton<Auth>(() => Auth());
  getIt.registerLazySingleton<AppState>(() => AppState());
}