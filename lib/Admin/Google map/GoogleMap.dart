// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:resortbooking/User/Common/Color.dart';

class GMap_Address extends StatefulWidget {
  const GMap_Address({Key? key}) : super(key: key);

  @override
  State<GMap_Address> createState() => _GMap_AddressState();
}

class _GMap_AddressState extends State<GMap_Address> {
  late GoogleMapController mapController;
  late CameraPosition cameraPosition;
  LatLng startLocation = LatLng(21.1702, 72.8311);
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
            style:
                TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
          ),
        ),
        body: Stack(children: [
          GoogleMap(
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: startLocation,
              zoom: 14.0,
            ),
            mapToolbarEnabled: true,
            myLocationEnabled: true,
            mapType: MapType.normal,
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
            onCameraMove: (cameraPositiona) {
              cameraPosition = cameraPositiona;
            },
            onCameraIdle: () async {
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition.target.latitude,
                  cameraPosition.target.longitude);
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
          Center(child: Icon(Icons.location_on)),
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
              ))
        ]));
  }
}
