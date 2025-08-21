import 'package:flutter/material.dart';
import 'config/theme_manager.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MepDubaiApp());
}

class MepDubaiApp extends StatelessWidget {
  const MepDubaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEP Dubai AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.light(),
      darkTheme: ThemeManager.dark(),
      home: const HomeScreen(),
    );
  }
}
