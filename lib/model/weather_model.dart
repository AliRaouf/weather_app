class WeatherModel {
  String? cityName;
  String? date;
  String? image;
  int? temp;
  String? condition;
  int? visibility;
  int? humidity;
  int? uvIndex;

  WeatherModel({this.cityName,
    this.date,
    this.image,
    this.temp,
    this.condition,
    this.visibility,
    this.humidity,
    this.uvIndex});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    String conditionText = json['current']['condition']['text'];
    String imageCondition;
    if (conditionText == "Sunny") {
      imageCondition =
      "https://i.pinimg.com/564x/cb/16/43/cb164349f47dd6daaa9e7c9f362f4252.jpg";
    } else if (conditionText == "Partly cloudy") {
      imageCondition=
      "https://i.pinimg.com/564x/46/a1/e7/46a1e7adc73c27600803e7ac203b7c85.jpg";
    } else if (conditionText == "Cloudy") {
      imageCondition =
      "https://i.pinimg.com/564x/c6/8a/f9/c68af91494d377a3aab0e9415c806f96.jpg";
    } else if (conditionText == "Overcast") {
      imageCondition =
      "https://i.pinimg.com/564x/0e/5d/72/0e5d726463f9b7d6955267c01e7ad34b.jpg";
    }
    else if (conditionText == "Mist") {
      imageCondition =
      "https://i.pinimg.com/564x/24/8b/8c/248b8c93ec73cf3ce52e992d8ce22204.jpg";
    } else if (conditionText == "Fog") {
      imageCondition =
      "https://i.pinimg.com/564x/44/25/f9/4425f960eca27bd28cff237926c2c94f.jpg";
    } else if (conditionText == "Freezing fog") {
      imageCondition =
      "https://i.pinimg.com/564x/0a/e3/ff/0ae3ff8b67d4f3cd0c200d19e01b0598.jpg";
    } else if (conditionText == "Light rain") {
      imageCondition =
      "https://i.pinimg.com/564x/97/7b/dd/977bddc197dd44a505e2647da8638ef4.jpg";
    } else if (conditionText == "Moderate rain at times") {
      imageCondition = "https://i.pinimg.com/564x/e2/c4/67/e2c4674309bf44be79b46fe0250d8f32.jpg";
    }else if (conditionText == "Clear") {
      imageCondition = "https://i.pinimg.com/564x/11/c0/55/11c0559c1affa71806d69def6c1463ff.jpg";
    }
    else {
      imageCondition= "https://i.pinimg.com/236x/4e/22/57/4e2257ce54d1359137c6f15b0d16b3ec.jpg";
    }
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      temp: json['current']['temp_c'].toInt(),
      condition: conditionText,
      image:imageCondition,
      visibility: json['current']['vis_km'].toInt(),
      humidity: json['current']['humidity'].toInt(),
      uvIndex: json['current']['uv'].toInt(),
    );
  }
}

