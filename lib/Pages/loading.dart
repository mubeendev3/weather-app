import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:weathery/Functionality/assistantBrain.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? city = "Islamabad";
  late Functionality getWeather;

  Future<void> runApp() async {
    Timer(
      const Duration(seconds: 3),
      () async {
        await getWeather.getData();
        if (!mounted) return;
        Navigator.pushReplacementNamed(
          context,
          "/home",
          arguments: {
            "temp": getWeather.weatherTemprature,
            "humidity": getWeather.weatherHumidity,
            "airSpeed": getWeather.weatherAirSpeed,
            "description": getWeather.weatherDescription,
            "city": getWeather.userCityLocation,
            "icon": getWeather.weatherIcon,
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    runApp();
  }

  @override
  Widget build(BuildContext context) {
    final search =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    city = search?["searchText"] ?? "Islamabad";
    getWeather = Functionality(userCityLocation: city);

    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/weatheryLogo.png",
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Weathery",
              style: TextStyle(
                  letterSpacing: 2,
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  fontFamily: "Sans"),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              "Made By Mubeen",
              style: TextStyle(
                letterSpacing: 2,
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SpinKitSpinningLines(
              color: Color(0xFF4793FF),
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
