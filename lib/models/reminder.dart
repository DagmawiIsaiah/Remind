import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reminder {
  final String id;
  final String name;
  final DateTime date;

  Reminder(this.id, this.name, this.date);

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      json["id"] as String,
      json["name"] as String,
      DateTime.parse(json["date"] as String),
    );
  }
}

class ReminderManager extends ChangeNotifier {
  final List<Reminder> reminders = [];

  Future<List<Reminder>> fetchReminders() async {
    String data = await rootBundle.loadString('assets/data/reminders.json');
    Map<String, dynamic> jsonData = jsonDecode(data);

    for (int i = 0; i < jsonData['reminders'].length; i++) {
      var reminder = jsonData["reminders"][0];
      reminders.add(Reminder(reminder["id"].toString(), reminder["name"],
          DateTime.parse(reminder["date"])));
    }

    return reminders;
  }

  void addReminder(Reminder reminder) {
    reminders.add(reminder);
    notifyListeners();
  }

  void removeReminder(Reminder reminder) {
    reminders.remove(reminder);
    notifyListeners();
  }

  void updateReminder(Reminder reminder) {
    final Reminder oldReminder =
        reminders.firstWhere((r) => r.id == reminder.id);
    reminders[reminders.indexOf(oldReminder)] = reminder;
    notifyListeners();
  }
}
