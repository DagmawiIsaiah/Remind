import 'dart:ui';
import 'package:flutter/material.dart';

class ReminderCard extends StatefulWidget {
  final String id;
  final String name;
  final DateTime date;
  const ReminderCard(
      {super.key, required this.id, required this.name, required this.date});

  @override
  State<ReminderCard> createState() => _ReminderCardState();
}

class _ReminderCardState extends State<ReminderCard> {
  final TextEditingController _titleController = TextEditingController();
  DateTime date = DateTime.now();
  String time = "";
  String title = "";

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          constraints: const BoxConstraints(maxHeight: 250),
          barrierColor: Colors.black.withOpacity(0.1),
          backgroundColor: Colors.white.withOpacity(0),
          context: context,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              width: double.maxFinite,
              height: 300,
              color: Colors.white.withOpacity(0.6),
              child: ListView(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Add Reminder",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // add or update.
                          Navigator.of(context).pop();
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Reminder name"),
                        SizedBox(
                          height: 30,
                          child: TextField(
                            style: const TextStyle(fontSize: 14),
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 14),
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText: "name",
                            ),
                            controller: _titleController,
                            onChanged: (_) {
                              setState(() {
                                title = _titleController.text;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Reminder date + time"),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 30,
                                color: Colors.white,
                                child: Text(date.toIso8601String()),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(DateTime.now().year + 1),
                                ).then(
                                  (newDate) {
                                    setState(() {
                                      date = newDate!;
                                    });
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then(
                                      (newTime) => setState(
                                        () {
                                          time = newTime.toString();
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: const Text("Pick date"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ReminderCard(
                    id: '15',
                    name: title,
                    date: date,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Dismissible(
          key: Key(widget.id),
          direction: DismissDirection.endToStart,
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.red.withOpacity(0.4),
            child: const Row(
              children: [
                Spacer(),
                Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          child: Container(
            height: 60,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white.withOpacity(0.5),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  widget.date.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
