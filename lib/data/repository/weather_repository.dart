import 'dart:convert';

import 'package:bloc_weather_app/data/data_provider/weather_data_provider.dart';
import 'package:bloc_weather_app/models/weather_models.dart';

class WeatherRepository {
  static Future<WeatherModel> getCurrentWeather() async {
    String cityName = 'Kerala';

    final weatherData = await WeatherDataProvider.getCurrentWeather(cityName);
    final data = jsonDecode(weatherData);

    if (data['cod'] != '200') {
      throw 'An unexpected error occurred';
    }

    return WeatherModel.fromMap(data);
  }
}
