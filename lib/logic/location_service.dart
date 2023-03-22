import 'package:geolocator/geolocator.dart';

class LocationService {
  double lat = 0;
  double lon = 0;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      lon = position.longitude;
      print(position);
    } catch (e) {
      print("Error in getting location $e");
    }
  }
}
