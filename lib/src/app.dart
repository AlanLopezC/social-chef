import 'package:flutter/material.dart';
import 'screens/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan,
        accentColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
