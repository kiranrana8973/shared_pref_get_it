import 'package:flutter/material.dart';
import 'package:shared_pref_get_it/models/Arithmetic.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
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
                Arithmetic arithmetic =
                    Arithmetic(first: _first ?? 0, second: _second ?? 0);
                setState(() {
                  _result = arithmetic.add();
                });
              },
              child: const Text('Add'),
            ),
            _gap,
            ElevatedButton(
              onPressed: () {
                Arithmetic arithmetic =
                    Arithmetic(first: _first ?? 0, second: _second ?? 0);
                setState(() {
                  _result = arithmetic.sub();
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
            )
          ],
        ),
      ),
    );
  }
}
