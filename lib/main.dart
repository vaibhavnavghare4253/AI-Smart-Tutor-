import 'package:flutter/material.dart';

import 'UI/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Smart Tutor',
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

}
