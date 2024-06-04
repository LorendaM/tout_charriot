import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart' as loc;
import 'package:google_maps_webservice/places.dart' as places;
import 'package:google_api_headers/google_api_headers.dart' as header;
import 'package:tout_charriot/app/utils/color.dart';

import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_input.dart';
import '../../../intl/texts.dart';
import '../../../utils/constants/image_constants.dart';
import '../../../utils/constants/network_constants.dart';
import '../../../utils/constants/size_constants.dart';
import '../../../utils/text_theme.dart';
import '../controller/departure_location_controller.dart';

class DepartureLocationView extends GetView<DepartureLocationController> {
  const DepartureLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DepartureLocationController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:AppColor.transparentColor,
        iconTheme: const IconThemeData(
            color: AppColor.blackColor
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController googleMapController) {
              controller.mapController = googleMapController;
            },
            initialCameraPosition: controller.center,
            markers: controller.markers.values.toSet(),
            onTap: (LatLng latlng) {
              controller.latitude = latlng.latitude;
              controller.longitude = latlng.longitude;
              Marker marker = Marker(
                markerId: const MarkerId('myLocation'),
                position: controller.initLatLong ?? LatLng(controller.latitude, controller.longitude),
                infoWindow: const InfoWindow(
                  title: 'Adresse de départ',
                ),
                draggable: true,
                onDragEnd: ((value) {
                  controller.initLatLong = LatLng(value.latitude, value.longitude);
                }),
              );
              controller.markers['myLocation'] = marker;
            },
          ),
          Positioned(
              top: 100,
              left: 10,
              right: 20,
              child: GestureDetector(
                onTap: handleSearch(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(-5,0),
                      ),
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(5,0),
                      )
                    ],
                  ),
                  child: CustomInput(
                    controller: controller.searchController,
                    enable: false,
                    hint: '${frLanguage['chooseAddressOf']}',
                    image: AppImages.search,
                  ),
                ),
              )
          ),
          Positioned(
              bottom: 0,
              left: 0, right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.doublespacePadding, vertical: AppSizes.twentyTwoPadding),
                decoration: const BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppSizes.fourPadding), topRight: Radius.circular(AppSizes.fourPadding)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: AppSizes.ninePadding, bottom: AppSizes.twentyTwoPadding),
                        width: 37,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: AppColor.gris,
                          borderRadius: BorderRadius.all(Radius.circular(AppSizes.fourPadding)),
                        ),
                      ),
                    ),
                    Text("${frLanguage['startAddress']}", style: AppTextStyle.secondTitle(size: 14, color: AppColor.secondGris, fontWeight: FontWeight.w900),),
                    const SizedBox(height: 23,),
                    Text((controller.searchController.text != '') ? controller.searchController.text : "lome select", style: AppTextStyle.secondTitle(size: 20, color: AppColor.secondBlack, fontWeight: FontWeight.w900),),
                    const SizedBox(height: 35,),
                    CustomButton(
                        press: () {},
                        text: "${frLanguage['valideStartAddress']}",
                        style: AppTextStyle.secondtext(size: 14)
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

   handleSearch(BuildContext context) async {
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    places.Prediction? p = await loc.PlacesAutocomplete.show(
        context: context,
        apiKey: NetworkConstants.mapApiKey,
        //onError: onError,
        mode: loc.Mode.overlay,
        language: 'fr',
        strictbounds: false,
        logo: const Image(image: AssetImage(AppImages.logo), width: 0,),
        types: [],
        decoration: InputDecoration(
            hintText: '${frLanguage['chooseAddressOf']}',
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white)
            )
        ),
        components: []// you can determine search for just one country
    );
    displayPrediction(p!, args['parentState']);
  }

  void onError(places.PlacesAutocompleteResponse response,BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red,
      content: Text(response.errorMessage!),
    ));
  }

  Future<void> displayPrediction(places.Prediction p, ScaffoldState? currentState) async {
    places.GoogleMapsPlaces _places = places.GoogleMapsPlaces(
        apiKey: NetworkConstants.mapApiKey,
        apiHeaders: await const header.GoogleApiHeaders().getHeaders()
    );
    places.PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId!);
    // detail will get place details that user chose from Prediction search
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;
    controller.markers.clear(); //clear old marker and set new one
    final marker = Marker(
      markerId: const MarkerId('deliveryMarker'),
      position: LatLng(lat, lng),
      infoWindow: const InfoWindow(
        title: '',
      ),
    );
      controller.markers['myLocation'] = marker;
    controller.mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, lng), zoom: 15),
        ),
      );
      print("ici le cont de detail ${detail.result}");
    controller.searchController.text = "${detail.result.formattedAddress}";
  }


}