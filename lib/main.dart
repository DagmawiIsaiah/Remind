import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:remind/app_theme.dart';

import '../screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  await Window.hideWindowControls();
  await Window.setEffect(
    // WindowEffect is going to be aero but its not currenly woring.
    effect: WindowEffect.transparent,
    color: const Color.fromARGB(0, 255, 255, 255),
    dark: false,
  );
  runApp(const MyApp());
  doWhenWindowReady(() {
    const initialSize = Size(300, 600);
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.size = initialSize;
    appWindow.title = "Remind";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remind',
      initialRoute: "/",
      theme: AppTheme.appTheme,
      routes: {
        "/": (context) => const ReminderScreen(),
        "/settingScreen": (context) => const SettingScreen(),
      },
    );
  }
}
