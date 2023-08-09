import 'package:flutter/material.dart';
import 'package:weathery/Pages/home.dart';
import 'package:weathery/Pages/location.dart';
import 'package:weathery/Pages/loading.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/location": (context) => const Location(),
        "/loading": (context) => const Loading(),
      },
    ),
  );
}
