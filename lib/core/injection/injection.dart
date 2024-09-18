import 'package:dio/dio.dart' as dio;
import 'package:flutter_bloc_todo/core/service/shared_preference_service.dart';
import 'package:flutter_bloc_todo/core/utils/network_utils.dart';
import 'package:flutter_bloc_todo/features/todo/domain/todo_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void initialInjection() {
  NetworkUtils networkUtil = NetworkUtils(dio: dio.Dio());
  Future<SharedPreferences> sharedPref = SharedPreferences.getInstance();

  getIt.registerSingleton(SharedPreferenceService(sharedPref: sharedPref));
  getIt.registerSingleton(TodoRepository(networkUtils: networkUtil), signalsReady: true);
}
