import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text("Location Page"),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/loading");
            },
            child: const Text("Goto Loading Page"),
          ),
        ],
      )),
    );
  }
}
