import 'package:flutter/material.dart';

class IderaldoCard extends StatelessWidget {
  final String? text1;
  final String? text2;

  IderaldoCard({this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color.fromARGB(255, 68, 77, 68), width: 2),
      ),
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Text(
            text1!,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            text2!,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
