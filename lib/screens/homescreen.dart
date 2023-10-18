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
  Widget build(BuildContext context) {
    double screenHeight=MediaQuery.of(context).size.height;
    double screenWidth=MediaQuery.of(context).size.width;
    var cubit= WeatherCubit.get(context);
    return BlocConsumer<WeatherCubit,WeatherState>(listener: (context,state){},
        builder: (context,state){
      return cubit.weatherModel==null?
      const Center(child: CircularProgressIndicator())
          : Scaffold(
          body: Stack(children: [
            Container(height: screenHeight,width: screenWidth,
                child:Image(image: NetworkImage(cubit.weatherModel!.image!),fit: BoxFit.cover,)
            )
          ],
          ),
      );
    });
  }
}