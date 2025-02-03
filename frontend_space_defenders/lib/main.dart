import 'package:flutter/material.dart';
import 'package:space_defenders/lobby/pages/lobby_main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Space Defenders',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LobbyMainView(),
    );
  }
}
