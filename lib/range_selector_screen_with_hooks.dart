import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'randomizer_screen_with_hooks.dart';
import 'range_selector_form.dart';

class RangeSelectorScreenWithHooks extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  RangeSelectorScreenWithHooks({super.key});

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Range',
        ),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
        minValueSetter: (value) => min.value = value,
        maxValueSetter: (value) => max.value = value,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RandomizerScreenWithHooks(
                  min: min.value,
                  max: max.value,
                )));
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
