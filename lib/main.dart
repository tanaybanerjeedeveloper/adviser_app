import 'package:adviser/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './2_application/pages/advice/advice_page.dart';
import './2_application/core/services/theme_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: value.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: const AdvicePageWrapper(),
        );
      },
    );
  }
}
