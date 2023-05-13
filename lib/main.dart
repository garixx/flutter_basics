import 'package:flutter/material.dart';
import 'package:flutter_foundations/providers/change_notifier/randomizer_change_notifier.dart';
import 'package:flutter_foundations/providers/riverpod/randomizer_riverpod.dart';
import 'package:flutter_foundations/range_selector_screen_with_change_notifier.dart';
import 'package:flutter_foundations/range_selector_screen_with_hooks.dart';
import 'package:flutter_foundations/range_selector_screen_with_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:provider/provider.dart'; // uncomment for provider examples. riverpod or provider only.
import './range_selector_screen_old.dart';

// void main() {
//   runApp(const AppWidget());
// }
void main() {
  runApp(const AppWidget());
}

// with hooks
// class AppWidget extends StatelessWidget {
//   const AppWidget({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Randomizer',
//       home: RangeSelectorScreenWithHooks(),
//     );
//   }
// }

// class AppWidget extends StatelessWidget {
//   const AppWidget({super.key});
//
//   // With ChangeNotifier
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (BuildContext context) => RandomizerChangeNotifier(),
//       child: MaterialApp(
//         title: 'Randomizer',
//         home: RangeSelectorScreenWithChangeNotifier(),
//       ),
//     );
//   }
// }

final randomizerProvider = StateNotifierProvider<RandomizerStateNotifier, RandomizerState>((ref) => RandomizerStateNotifier());

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Randomizer',
        home: RangeSelectorScreenWithRiverpod(),
      ),
    );
  }
}


