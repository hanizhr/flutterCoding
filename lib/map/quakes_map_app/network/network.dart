import 'dart:convert';

import 'package:first_flutter_app/map/quakes_map_app/model/Quakes.dart';
import 'package:http/http.dart';

class Network{
  Future<Quake> getAllQuakes() async {
    var apiUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_day.geojson#" ;
    final response = await get(Uri.parse(apiUrl));

    if(response.statusCode == 200){
      print("Quakes data: ${response.body}");
      return Quake.fromJson((json.decode(response.body)));
    }else{
      throw Exception("Error getting quakes");
    }
  }
}