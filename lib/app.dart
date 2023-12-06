import 'package:flutter/material.dart';
import 'package:shared_pref_get_it/views/arithmetic_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc and GetIt',
      home: ArithmeticView(),
    );
  }
}
