import 'package:bloc_weather_app/data/repository/weather_repository.dart';
import 'package:bloc_weather_app/models/weather_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherEvent>(_onFetchWeather);
  }
  void _onFetchWeather(
      FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weatherModel = await WeatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailure(err: e.toString()));
    }
  }
}
