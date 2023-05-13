import 'package:flutter/material.dart';
import 'package:flutter_foundations/providers/change_notifier/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorFormWithChangeNotifier extends StatelessWidget {
  const RangeSelectorFormWithChangeNotifier({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: 'Minimum',
              intValueSetter: (value) => context.read<RandomizerChangeNotifier>().min = value,
            ),
            const SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: (value) => context.read<RandomizerChangeNotifier>().max = value,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    super.key,
    required this.labelText,
    required this.intValueSetter,
  });

  final String labelText;
  final void Function(int value) intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          print('$value\n');
          return 'This must be an integer';
        }
        print('$value\n');
        return null;
      },
      onSaved: (value) => intValueSetter(int.parse(value ?? '')),
    );
  }
}
