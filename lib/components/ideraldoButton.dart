import 'package:flutter/material.dart';

class IderaldoButton extends StatelessWidget {
  final Function()? onPressed;

  IderaldoButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
