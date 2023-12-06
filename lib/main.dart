import 'package:flutter/material.dart';
import 'package:shared_pref_get_it/app.dart';
import 'package:shared_pref_get_it/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initModule();

  runApp(
    const App(),
  );
}
