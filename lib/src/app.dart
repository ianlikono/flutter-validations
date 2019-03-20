import 'package:flutter/material.dart';

import './BLoC/screens/login_screen.dart';
// import './statefullwidgets/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log Me In',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
