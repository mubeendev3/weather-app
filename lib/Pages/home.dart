import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

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
  TextEditingController searchController = TextEditingController();

  String capitilize(String text) {
    if (text.isEmpty) return text;
    String firstLetter = text[0].toUpperCase();
    String restLetters = text.substring(1);
    return "$firstLetter$restLetters";
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF101820),
      body: SafeArea(
        // ------------------------------------------ Search Bar Starts From Here ----------------------------------------------------
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
                      onTap: _onSearchSubmitted,
                      child: const Icon(
                        Icons.search,
                        color: Colors.black26,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        onSubmitted: (searchText) => _onSearchSubmitted(),
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: "Enter Your City Name...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //---------------------------------- Search Bar End ----------------------------------------------------->
              Container(
                // height: containerHeight,
                child: Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            // color: Colors.white38.withOpacity(0.3),
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              if (data?["icon"] != null)
                                Image.network(
                                    "https://openweathermap.org/img/wn/${data?["icon"]}@2x.png"),
                              const SizedBox(
                                width: 70,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    capitilize("${data?["description"]}"),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "In ${data?["city"]}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                WeatherIcons.thermometer,
                                color: Colors.white,
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    double.parse("${data?["temp"]}")
                                        .toInt()
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 150,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    "C",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.only(left: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(
                                          WeatherIcons.wind_beaufort_0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      double.parse("${data?["airSpeed"]}")
                                          .toInt()
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "Km/Hour",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  // color: Colors.white38.withOpacity(0.3),
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.only(right: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: double.infinity,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(
                                          WeatherIcons.humidity,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      double.parse("${data?["humidity"]}")
                                          .toInt()
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "Percent",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Forecasting Your World",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                      ),
                      const Text(
                        "Crafted by Mubeen.",
                        style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSearchSubmitted() {
    Navigator.pushReplacementNamed(
      context,
      "/loading",
      arguments: {
        "searchText": searchController.text,
      },
    );
  }
}
