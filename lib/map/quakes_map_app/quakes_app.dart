import 'package:first_flutter_app/map/quakes_map_app/model/Quakes.dart';
import 'package:first_flutter_app/map/quakes_map_app/network/network.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class QuakesApp extends StatefulWidget {
  const QuakesApp({Key? key}) : super(key: key);

  @override
  State<QuakesApp> createState() => _QuakesAppState();
}

class _QuakesAppState extends State<QuakesApp> {
  late Future<Quake> _quakeData;
  @override
  void initState() {
    // TODO: implement initState
    _quakeData = Network().getAllQuakes();
    _quakeData.then((value) =>{
      print("place: ${value.features![0].properties?.place}")
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
