import 'dart:math';

import 'package:flutter/material.dart';
import 'package:space_defenders/lobby/widges/lobby_row_element.dart';
import 'package:space_defenders/lobby/widges/stars.dart';

class LobbyMainView extends StatefulWidget {
  @override
  State<LobbyMainView> createState() => _LobbyMainViewState();
}

class _LobbyMainViewState extends State<LobbyMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          StarryBackground(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: LobbyRowElement());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () => print("create lobby pressed"),
                      child: Text(
                        "Create Lobby",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
