import 'package:clima202/logic/data_service.dart';
import 'package:clima202/logic/location_service.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String? cityName;
  double? temp;
  String? condition;
  int? humidity;
  double? windSpeed;

  Future<void> fetchWeatherData() async {
    ///object from location service class
    LocationService locationService = LocationService();

    await locationService.getLocation();

    /// object from data service class
    DataService dataService = DataService();
    await dataService.getData(locationService.lat, locationService.lon);
    setState(() {
      cityName = dataService.cityName;
      temp = dataService.temp;
      condition = dataService.condition;
      humidity = dataService.humidity;
      windSpeed = dataService.windSpeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              "City Name:$cityName",
              style: TextStyle(fontSize: 27),
            ),
            SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "City Name:$temp",
              style: TextStyle(fontSize: 27),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "City Name:$condition",
              style: TextStyle(fontSize: 27),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Humidity:$humidity",
              style: TextStyle(fontSize: 27),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Wind Speed:$windSpeed",
              style: TextStyle(fontSize: 27),
            ),
            ElevatedButton(
              onPressed: () async {
                await fetchWeatherData();
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.green,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                minimumSize: const Size(50, 50),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Get Location",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
