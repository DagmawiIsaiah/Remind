import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:remind/widgets/widgets.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = "/settingScreen";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: ListView(
          children: [
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: MoveWindow(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 14,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      child: Text(
                        "Schedules",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Backup"),
            ),
            const SettingOption(
              title: "Backup location",
              subTitle: "C:/Users/Duckye/Documents/RemindBackup",
            ),
            const SettingOption(
              title: "Export reminders",
              subTitle: "Save reminders to the device",
            ),
            const SettingOption(
              title: "Import reminders",
              subTitle: "Restore reminders from devices",
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Theme"),
            ),
            const ToggleOption(
              title: "Dark mode",
              subTitle: "User dark mode",
            ),
            const ToggleOption(
              title: "Transparent background",
              subTitle: "Make app background transparent",
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Notification"),
            ),
            const ToggleOption(
              title: "Ring",
              subTitle: "Make ring tone on notification",
            ),
            const SettingOption(
              title: "Select tone",
              subTitle: "Select ring tone for notification",
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("About"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Software version",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "x64 0.1.0 stable",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Developer",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Dagmawi Isaiah",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    "Website",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
