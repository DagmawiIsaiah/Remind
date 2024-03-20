import 'package:flutter/material.dart';

class Urgency extends StatelessWidget {
  const Urgency({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 15,
            width: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.5),
              color: Colors.green,
            ),
          ),
          const Spacer(),
          const Text("00-00-00"),
          const Spacer(),
          Container(
            height: 1,
            width: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.5),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
