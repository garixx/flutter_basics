import 'providers/change_notifier/randomizer_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RandomizerScreenWithChangeNotifier extends StatelessWidget {

  const RandomizerScreenWithChangeNotifier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer'),
      ),
      body: Center(
        child: Consumer<RandomizerChangeNotifier>(
          builder: (context, notifier, child) {
            return  Text(
              notifier.generatedNumber?.toString() ?? 'Generate a number',
              style: const TextStyle(fontSize: 42),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context
              .read<RandomizerChangeNotifier>()
              .generateRandomNumber();
        },
        label: const Text('Generate'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
