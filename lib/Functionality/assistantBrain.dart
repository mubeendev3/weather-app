import 'dart:convert';
import 'package:http/http.dart';

class Functionality {
  String? userCityLocation;

  Functionality({this.userCityLocation});

  String? weatherTemprature;
  String? weatherHumidity;
  String? weatherAirSpeed;
  String? weatherDescription;
  String? weatherIcon;

  Future<void> getData() async {
    try {
      //Parsing my url to uri to overcome this error "The argument type ‘String’ can’t be assigned to the parameter type ‘Uri’"
      final Uri url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?appid=df9bd3c7b801c58957e56394105ec93a&q=$userCityLocation");
      Response response = await get(url);
      if (response.statusCode == 200) {
        Map apiData = jsonDecode(response.body);

        //Getting temprature
        Map tempData = apiData["main"];
        // double temp = tempData["temp"];
        double tempInCel = _convertKelvinToCel(tempData["temp"] as double);

        //Getting Humidity
        Map humidityData = apiData["main"];
        String humidity = tempData["humidity"].toString();

        //Getting Air Speed
        Map airSpeedData = apiData["wind"];
        double airSpeed =
            _convertSpeedToKmPerHour(airSpeedData["speed"] as double);

        //Getting Weather Description
        List climateDescription = apiData["weather"];
        Map climaDesc = climateDescription[0];
        String description = climaDesc["description"].toString();

        //Getting Weather Icon
        List climaIcon = apiData["weather"];
        Map climateIcon = climaIcon[0];
        String icon = climateIcon["icon"];

        //Getting City Name / Location Name
        String locationName = apiData["name"];

        //Assigning All The Values
        userCityLocation = locationName;
        weatherTemprature = tempInCel.toString();
        weatherAirSpeed = airSpeed.toString();
        weatherDescription = description;
        weatherHumidity = humidity;
        weatherIcon = icon;
      }
    } catch (e) {
      weatherTemprature = "Please Spell Your City Correctly";
    }
  }

  double _convertKelvinToCel(double kelvinTemp) {
    return kelvinTemp - 273.15;
  }

  double _convertSpeedToKmPerHour(double speed) {
    return speed * 3.6;
  }
}
