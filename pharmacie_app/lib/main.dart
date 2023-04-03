import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacie',
      debugShowCheckedModeBanner: false,
      home: mainPage(),
    );
  }
}

class mainPage extends StatefulWidget {
  mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  double long = 49.5;
  double lat = -0.09;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Union Station"),
        ),
        body: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(36.737232, 3.086472),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            MarkerLayerOptions(markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: latLng.LatLng(36.737232, 3.086472),
                builder: (ctx) => Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.place_rounded),
                    color: Color(0xff620000),
                    iconSize: 45.0,
                  ),
                ),
              ),
            ])
          ],
        ));
  }
}
