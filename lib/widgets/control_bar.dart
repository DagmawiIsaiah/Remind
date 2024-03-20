import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import '../widgets/widgets.dart';

class ControlBar extends StatelessWidget {
  const ControlBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: MoveWindow(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "Schedules",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    barrierColor: const Color.fromARGB(0, 255, 255, 255),
                    backgroundColor: const Color.fromARGB(150, 255, 255, 255),
                    context: context,
                    builder: (context) => const SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      // color: const Color.fromARGB(150, 255, 255, 255),
                      child: AddReminderOverlay(),
                    ),
                  );
                },
                icon: const Icon(Icons.add, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
