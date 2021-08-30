import 'package:flutter/material.dart';

class BelowTextWidget extends StatelessWidget {
  const BelowTextWidget({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            text1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700], fontSize: 25.0),
          ),
        ],
      ),
    );
  }
}
