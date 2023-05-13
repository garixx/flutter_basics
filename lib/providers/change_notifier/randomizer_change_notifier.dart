import 'dart:math';

import 'package:flutter/foundation.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  final _randomGenerator = Random();
  int? _generatedNumber;
  int min = 0;
  int max = 0;

  int? get generatedNumber => _generatedNumber;

  void generateRandomNumber() {
    _generatedNumber = min + _randomGenerator.nextInt(max + 1 - min);
    notifyListeners();
  }
}