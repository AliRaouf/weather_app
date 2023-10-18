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
            SizedBox(height: screenHeight,width: screenWidth,
                child:Image(image: NetworkImage(cubit.weatherModel!.image!),fit: BoxFit.cover,)
            ),Column(children:[
              Row(
                children: [
                  Container(margin: EdgeInsets.only(left: screenWidth*0.05,top: screenHeight*0.07),
                      child: Text(cubit.weatherModel!.cityName!,style: TextStyle(color: Colors.white,fontSize: 30))),
                ],
              ),
              Container(margin: EdgeInsets.only(left: screenWidth*0.05,top: screenHeight*0.02,bottom: screenWidth*0.95),
                  child: Row(
                    children: [
                      Text("${cubit.weatherModel!.temp!}°",style: TextStyle(color: Colors.white,fontSize: 100)),
                    ],
                  )),
              Center(
                child: Container(width: screenWidth*0.9,height: screenHeight*0.1,decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15),color: const Color(0x3FFFFFFF),border: Border.all(color: Colors.white)),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("  ${cubit.weatherModel!.humidity!}%",style: const TextStyle(color: Colors.white,fontSize: 18),),
                          Text("   ${cubit.weatherModel!.visibility!} km",style: const TextStyle(color: Colors.white,fontSize: 18)),
                          Text(" ${cubit.weatherModel!.uvScale!} ${cubit.weatherModel!.uvIndex!}",style: const TextStyle(color: Colors.white,fontSize: 18))

                        ],
                      ),
                      const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Humidity",style: TextStyle(color: Colors.white,fontSize: 13)),
                          Text("Visibility",style: TextStyle(color: Colors.white,fontSize: 13)),
                          Text("uVindex",style: TextStyle(color: Colors.white,fontSize: 13))

                        ],
                      )
                    ],
                  ),),
              )
            ],
      )
          ,Container(margin: EdgeInsets.only(left: screenWidth*0.85,top: screenHeight*0.05),
                child: RotatedBox(quarterTurns: 3,child: Text(cubit.weatherModel!.condition!,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20))))
          ,
          ]
          ));
    });
  }
}