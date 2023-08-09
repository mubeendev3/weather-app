import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

// Get weather from latitude and longitude
const myApiKey =
    "https://api.openweathermap.org/data/2.5/weather?lat=33.6297984&lon=72.9972736&appid=df9bd3c7b801c58957e56394105ec93a";
// Get weather data from city name
const apiKeyCity =
    "https://api.openweathermap.org/data/2.5/weather?appid=df9bd3c7b801c58957e56394105ec93a&q=Islamabad";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    print("This is Method from init state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set State Called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed Counter Reset");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Column(
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
