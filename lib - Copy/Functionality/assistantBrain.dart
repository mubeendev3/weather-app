import 'dart:convert';
import 'package:http/http.dart';

class Functionality {
  String? userCityLocation;

  Functionality({this.userCityLocation});

  String? weatherTemprature;
  String? weatherHumidity;
  String? weatherAirSpeed;
  String? weatherDescription;

  Future<void> getData() async {
    try {
      //Parsing my url to uri to overcome this error "The argument type ‘String’ can’t be assigned to the parameter type ‘Uri’"
      final Uri url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?appid=df9bd3c7b801c58957e56394105ec93a&q=$userCityLocation");
      Response response = await get(url);
      Map apiData = jsonDecode(response.body);

      //Getting temprature
      Map tempData = apiData["main"];
      String temp = tempData["temp"].toString();

      //Getting Humidity
      Map humidityData = apiData["main"];
      String humidity = tempData["humidity"].toString();

      //Getting Air Speed
      Map airSpeedData = apiData["wind"];
      String airSpeed = airSpeedData["speed"].toString();

      //Getting Weather Description
      List climateDescription = apiData["weather"];
      Map climaDesc = climateDescription[0];
      String description = climaDesc["description"].toString();

      //Getting City Name / Location Name
      String locationName = apiData["name"];

      //Assigning All The Values
      userCityLocation = locationName;
      weatherTemprature = temp;
      weatherAirSpeed = airSpeed;
      weatherDescription = description;
      weatherHumidity = humidity;
    } catch (e) {
      weatherTemprature = "Please Spell Your City Correctly";
    }
  }
}
