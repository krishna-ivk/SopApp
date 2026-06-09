import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'data/sop_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SopProvider(),
      child: const SkolaSopApp(),
    ),
  );
}

class SkolaSopApp extends StatelessWidget {
  const SkolaSopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skola CBSE SOP',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
