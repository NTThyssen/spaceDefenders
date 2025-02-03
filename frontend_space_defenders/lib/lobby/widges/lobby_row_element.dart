import 'package:flutter/material.dart';

class LobbyRowElement extends StatefulWidget {
  const LobbyRowElement({super.key});

  @override
  State<LobbyRowElement> createState() => _LobbyRowElementState();
}

class _LobbyRowElementState extends State<LobbyRowElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Lobby Name", style: TextStyle(color: Colors.blue)),
          Text("1/4", style: TextStyle(color: Colors.blue)),
          Text("Ping", style: TextStyle(color: Colors.blue)),
          TextButton(
              style:
                  TextButton.styleFrom(),
              onPressed: () => print("qwe"),
              child: Text(
                "Join Lobby",
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
    );
  }
}
