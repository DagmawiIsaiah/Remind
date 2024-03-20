import 'package:flutter/material.dart';

class ToggleOption extends StatelessWidget {
  final String title;
  final String subTitle;

  const ToggleOption({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 5, bottom: 5, right: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                width: 150,
                child: Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const Spacer(),
          Switch(
            activeColor: Colors.black.withOpacity(0.8),
            value: true,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
