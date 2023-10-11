class WeatherModel{
  final String cityName;
  final String date;
  final String image;
  final double temp;
  final String condition;
  final double visibility;
  final double humidity;
  final double uvIndex;

  WeatherModel(
      { required this.cityName,
        required this.date,
        required this.image,
        required this.temp,
        required this.condition,
        required this.visibility,
        required this.humidity,
        required this.uvIndex});

factory WeatherModel.fromJson(json)
{
  return WeatherModel(
    cityName:json['location']['name'],
    date: json['current']['last_updated'](),
    temp: json['current']['temp_c'],
    condition:json['current']['condition']['text'],
    image:json['current']['condition']['icon'],
    visibility:json['current']['vis_km'] ,
    humidity:json['current']['humidity'],
    uvIndex:json['current']['uv'],

  );
}
}