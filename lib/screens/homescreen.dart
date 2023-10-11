import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getWeather(cityName: "Cairo");
  }
  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context);
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${cubit.weatherModel.condition}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    const Text(
                      'updated at 23:46',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '17',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              'Maxtemp: 24',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Mintemp: 16',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      'Light Rain',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ));
    });
  }
}