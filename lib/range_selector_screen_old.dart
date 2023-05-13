import 'package:flutter/material.dart';
import './randomizer_screen_old.dart';

import 'range_selector_form.dart';

class RangeSelectorScreenOld extends StatefulWidget {
  const RangeSelectorScreenOld({super.key});

  @override
  State<RangeSelectorScreenOld> createState() => _RangeSelectorScreenOldState();
}

class _RangeSelectorScreenOldState extends State<RangeSelectorScreenOld> {
  final _formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Range',
        ),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
        minValueSetter: (value) => _min = value,
        maxValueSetter: (value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RandomizerScreenOld(
                      min: _min,
                      max: _max,
                    )));
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
