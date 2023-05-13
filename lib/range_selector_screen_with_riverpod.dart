import 'package:flutter/material.dart';
import 'package:flutter_foundations/randomizer_screen_with_riverpod.dart';
import 'package:flutter_foundations/range_selector_form_with_riverpod.dart';

class RangeSelectorScreenWithRiverpod extends StatelessWidget {
  RangeSelectorScreenWithRiverpod({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Range',
        ),
      ),
      body: RangeSelectorFormWithRiverpod(
        formKey: _formKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RandomizerScreenWithRiverpod()));
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
