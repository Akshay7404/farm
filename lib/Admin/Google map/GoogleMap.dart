// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_final_fields, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:location/location.dart';

class GMap_Address extends StatefulWidget {
  const GMap_Address({Key? key}) : super(key: key);

  @override
  State<GMap_Address> createState() => _GMap_AddressState();
}

class _GMap_AddressState extends State<GMap_Address> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(21.1702, 72.8311), zoom: 14);

  late CameraPosition cameraPosition;

  String location = "Location Name:";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0,
        centerTitle: true,
        title: const Text(
          "Select Address",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            mapToolbarEnabled: true,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onCameraMove: (Positiona) {
              cameraPosition = Positiona;
            },
            onCameraIdle: () async {
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition.target.longitude,
                  cameraPosition.target.latitude);
              setState(() {
                location = placemarks.first.street.toString() +
                    ", " +
                    placemarks.first.subLocality.toString() +
                    " " +
                    placemarks.first.thoroughfare.toString() +
                    ", " +
                    placemarks.first.name.toString() +
                    ", " +
                    placemarks.first.administrativeArea.toString() +
                    ", " +
                    placemarks.first.postalCode.toString() +
                    ", " +
                    placemarks.first.country.toString();
              });
            },
          ),
          Center(child: Icon(Icons.location_on, size: 30)),
          Positioned(
              bottom: 100,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: ListTile(
                        leading: TextButton(
                            child: Text("ok",
                                style: TextStyle(color: rPrimarycolor)),
                            onPressed: () {
                              Navigator.pop(context, location);
                            }),
                        title: Text(location, style: TextStyle(fontSize: 18)),
                        dense: true,
                      )),
                ),
              )),
        ],
      ),
    );
  }
}
