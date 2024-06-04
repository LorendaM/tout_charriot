import 'package:flutter/material.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:tout_charriot/app/data/services/location_services.dart';

import '../../../utils/constants/network_constants.dart';

class LocationServicesImpl extends LocationServices {
  final List<Prediction> _predictionList = [];
  Future<List<Prediction>> searchLocation(BuildContext context, String text)async {
    /*if(text != null && text.isNotEmpty) {
      http.Response response = await getLocationData(text);
      Map data = jsonDecode(response.body.toString());
      if(data['status'] == 'OK') {
        data['predictions'].forEach((prediction) => _predictionList.add(Prediction.fromJson(prediction)));
      }
      else {

      }
    }*/
    return _predictionList;
  }

  void placeAutoComplete(String query) {
    Uri uri = Uri.https(NetworkConstants.appPolicy);
  }
}