import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import 'package:homebank/ui/style/colors.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(51.169392, 71.449074),
    zoom: 11,
  );

  Marker _marker(double longitude, latitude) {
    return Marker(
      markerId: MarkerId("id"), // a string for marker unique id

      position: LatLng(longitude, latitude), // lat and long doubles

      onTap: () {
        //this is what you're looking for!
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Партнеры',
          style: TextStyle(color: HomeBankColor.red),
        ),
        backgroundColor: HomeBankColor.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: {
          _marker(51.119392, 71.419074),
          _marker(51.199392, 71.459074),
          _marker(51.189392, 71.489074),
          _marker(51.179392, 71.429074),
          _marker(51.169392, 71.439074),
          _marker(51.129392, 71.449074),
          _marker(51.149392, 71.439074),
          _marker(51.139392, 71.429074),
          _marker(51.129392, 71.439074),
          _marker(51.139392, 71.449074),
          _marker(51.109392, 71.459074),
          _marker(51.199392, 71.469074),
          _marker(51.149392, 71.459074),
          _marker(51.179392, 71.489074),
          _marker(51.169392, 71.499074),
          _marker(51.139392, 71.469074),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
