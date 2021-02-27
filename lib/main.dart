import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/material_white.dart';
import 'package:instagram_clone_code/screens/auth_screen.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthScreen(),
      theme: ThemeData(primarySwatch: white),
    );
  }
}


