import 'package:get_it/get_it.dart';
import 'package:shared_pref_get_it/models/Arithmetic.dart';
import 'package:shared_pref_get_it/shared_prefs/result_shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initModule() async {
  // Register Arithmetic class
  getIt.registerLazySingleton<Arithmetic>(() => Arithmetic());

  //Shared preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //Shared preferences class
  getIt.registerLazySingleton<SharedPref>(
    () => SharedPref(sharedPreferences: getIt()),
  );
}
