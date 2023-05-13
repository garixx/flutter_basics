import 'dart:math';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class RandomizerScreenWithHooks extends HookWidget {
  final int min, max;
  final randomGenerator = Random();

  RandomizerScreenWithHooks({Key? key, required this.min, required this.max,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Text(
          generatedNumber.value?.toString() ?? 'Generate a number',
          style: const TextStyle(fontSize: 42),
        ),
      ),
      floatingActionButton:FloatingActionButton.extended(
        onPressed: () {
          generatedNumber.value = min + randomGenerator.nextInt(max + 1 - min);
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
