import 'package:flutter/material.dart';
import 'package:weathery/Functionality/assistantBrain.dart';
import 'package:weathery/Pages/home.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Functionality getWeather = Functionality(userCityLocation: "Islamabad");
  String? temp;
  String? hum;
  String? airSpeed;
  String? description;
  String? city;

  Future<void> runApp() async {
    await getWeather.getData();
  }

  @override
  void initState() {
    runApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Text("Loading"),
            ),
          ],
        ),
      ),
    );
  }
}
