import 'package:abiodun_mobile/routes.dart';
import 'package:abiodun_mobile/theme.dart';
import 'package:abiodun_mobile/views/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Dev Test',
      theme: AppTheme.lightTheme(context), // Use your custom light theme
      darkTheme: AppTheme.darkTheme(context),
      // home: const MyHomePage(title: ''),

      initialRoute: Routes.dashboard, // Set the initial route
      routes: Routes.routes,
    );
  }
}
