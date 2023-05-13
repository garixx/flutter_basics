import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_screen_with_change_notifier.dart';
import './range_selector_form_with_change_notifer.dart';

class RangeSelectorScreenWithChangeNotifier extends StatelessWidget {
  RangeSelectorScreenWithChangeNotifier({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Range',
        ),
      ),
      body: RangeSelectorFormWithChangeNotifier(
        formKey: _formKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RandomizerScreenWithChangeNotifier()));
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
