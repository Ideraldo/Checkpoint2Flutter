import 'package:flutter/material.dart';

class IderaldoForm extends StatelessWidget {
  final String label;
  final TextEditingController? userInputController;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;

  IderaldoForm({
    required this.label,
    this.userInputController,
    this.onEditingComplete,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: userInputController,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(),
      ),
    );
  }
}
