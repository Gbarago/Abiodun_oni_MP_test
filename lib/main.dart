import 'package:abiodun_mobile/providers/nav_provider.dart';
import 'package:abiodun_mobile/routes.dart';
import 'package:abiodun_mobile/theme.dart';
import 'package:abiodun_mobile/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => TabProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Dev Test',
      theme: AppTheme.lightTheme(context),
      initialRoute: Routes.dashboard,
      routes: Routes.routes,
    );
  }
}
