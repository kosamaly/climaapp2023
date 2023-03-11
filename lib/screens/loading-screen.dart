import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

void getLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low);
  print(position);
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

// backgroundColor: Colors.white54,
// body: Center(
// child: ElevatedButton(
// onPressed: () {
// print("toto");
// getLocation();
// },
// style: ElevatedButton.styleFrom(
// elevation: 5,
// backgroundColor: Colors.green,
// shape: const RoundedRectangleBorder(
// borderRadius: BorderRadius.all(Radius.circular(8))),
// minimumSize: const Size(50, 50),
// ),
// child: const Padding(
// padding: EdgeInsets.all(8.0),
// child: Text(
// "Get Location",
// style: TextStyle(
// fontSize: 20,
// color: Colors.white,
// fontWeight: FontWeight.bold),
// ),
// ),
// ),
// ),
