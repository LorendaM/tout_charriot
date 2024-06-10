import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:get/get.dart';

class LocationController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();

  final LatLng center = const LatLng(6.1823217, 1.2466907); // sur lome
  final Map<String, dynamic> args = Get.arguments as Map<String, dynamic>;

}
