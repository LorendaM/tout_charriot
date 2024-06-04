import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DepartureLocationController extends GetxController {

  late CameraPosition center;
  TextEditingController searchController = TextEditingController();

  GoogleMapController? mapController;
  double latitude = 0;
  double longitude = 0;
  Location location = Location();
  final Map<String, Marker> markers = {};
  late LatLng? initLatLong;

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
  getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {//check if thelocation service was enable or not
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      //if the location was denied it will ask next time the user enter the screen
      if (permissionGranted != PermissionStatus.granted) {
        //in case of denied you can add any thing here like error message or something else
        return;
      }
    }
    LocationData currentPosition = await location.getLocation();
    latitude = currentPosition.latitude!;
    longitude = currentPosition.longitude!;
    final marker = Marker(
      markerId: const MarkerId('myLocation'),
      position: LatLng(latitude, longitude),
      infoWindow: const InfoWindow(
        title: 'Effectuer une recherche',
      ),
    );
      markers['myLocation'] = marker;
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(latitude, longitude), zoom: 15),
        ),
      );
  }

}
