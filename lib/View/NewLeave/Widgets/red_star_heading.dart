
import 'package:flutter/material.dart';

class redStarHeading extends StatelessWidget {
  final String title;
  const redStarHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 5),
          child: Text(
            "*",
            style: TextStyle(
                color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

