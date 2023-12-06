import 'package:flutter/material.dart';
import 'package:shared_pref_get_it/di/di.dart';
import 'package:shared_pref_get_it/models/Arithmetic.dart';
import 'package:shared_pref_get_it/shared_prefs/result_shared_prefs.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  @override
  void initState() {
    super.initState();
    // get the data from the shared preferences
    getIt<SharedPref>().getData().then((value) {
      setState(() {
        _oldData = value!.isEmpty ? 0 : int.parse(value);
      });
    });
  }

  int? _oldData;

  final _gap = const SizedBox(height: 8);
  int? _first, _second;
  int _result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Screen'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                _first = int.parse(value);
              },
              decoration: const InputDecoration(
                hintText: 'Enter first no',
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            TextField(
              onChanged: (value) {
                _second = int.parse(value);
              },
              decoration: const InputDecoration(
                hintText: 'Enter second no',
                border: OutlineInputBorder(),
              ),
            ),
            _gap,
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result = getIt<Arithmetic>().add(_first!, _second!);

                  // Save result to shared preferences
                  getIt<SharedPref>().saveData(_result.toString());
                });
              },
              child: const Text('Add'),
            ),
            _gap,
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result = getIt<Arithmetic>().sub(_first!, _second!);

                  // Save result to shared preferences
                  getIt<SharedPref>().saveData(_result.toString());
                });
              },
              child: const Text('Subtract'),
            ),
            _gap,
            Align(
              alignment: Alignment.center,
              child: Text(
                'Result : $_result',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            _gap,
            Align(
              alignment: Alignment.center,
              child: Text(
                'Old Data : $_oldData',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
