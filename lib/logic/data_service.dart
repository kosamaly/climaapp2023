import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'cac04a9fbd567e6ffb23f01981662ecf';

class DataService {
  double temp = 0;
  String cityName = "";
  String condition = "";
  int humidity = 0;
  double windSpeed = 0;

  Future<void> getData(double lat, double lon) async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey"));

    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      temp = decodedData['main']['temp'];
      condition = decodedData['weather'][0]['description'];
      cityName = decodedData['name'];
      humidity = decodedData['main']['humidity'];
      windSpeed = decodedData['wind']['speed'];

      print(temp);
      print(condition);
      print(cityName);
    } else {
      print(response.statusCode);
    }
  }
}
