import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:remind/models/reminder.dart';

import '../widgets/widgets.dart';

class ReminderScreen extends StatelessWidget {
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        body: Container(
          color: Colors.black.withOpacity(0),
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const ControlBar(),
              SizedBox(
                height: 600 - 60,
                child: FutureBuilder(
                  future: ReminderManager().fetchReminders(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Reminder>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var reminders = snapshot.data;
                      if (reminders != null) {
                        return ListView(
                          children: [
                            const Urgency(),
                            ...reminders.map(
                              (reminder) => ReminderCard(
                                id: reminder.id,
                                name: reminder.name,
                                date: reminder.date,
                              ),
                            ),
                          ],
                        );
                      } else {
                        // Show no reminders yet
                        return Column(
                          children: [],
                        );
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("/settingScreen");
          },
          child: CircleAvatar(
            backgroundColor: Colors.amber.withOpacity(0.8),
            foregroundColor: Colors.black.withOpacity(0.6),
            child: const Icon(
              Icons.settings_outlined,
              weight: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
