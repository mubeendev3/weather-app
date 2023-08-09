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
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                margin: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 20.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
                child: Row(
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.search,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        print("Search Me");
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Your City Name...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: const Text("Text"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.5),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: const Text("Text"),
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
