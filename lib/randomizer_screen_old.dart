import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerScreenOld extends StatefulWidget {
  final int min, max;

  const RandomizerScreenOld({Key? key, required this.min, required this.max}) : super(key: key);

  @override
  State<RandomizerScreenOld> createState() => _RandomizerScreenOldState();
}

class _RandomizerScreenOldState extends State<RandomizerScreenOld> {
  int? _generatedNumber;
  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          _generatedNumber?.toString() ?? 'Generate a number',
          style: const TextStyle(fontSize: 42),
        ),
      ),
      floatingActionButton:FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _generatedNumber = widget.min + randomGenerator.nextInt(widget.max + 1 - widget.min);
          });
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
