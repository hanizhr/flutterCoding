import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";

class map extends StatefulWidget {
  const map({Key? key}) : super(key: key);

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("map"),
        ),
        body: Stack(
          children: [
            FlutterMap(
              options: MapOptions(minZoom: 10.89,),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: () {},
                )
              ],
              children: [
                TileLayer(
                  urlTemplate:
                      'https://basemaps.cartocdn.com/rastertiles/voyager_nolabels/{z}/{x}/{y}.png',
                ),
              ],
            )
          ],
        ));
  }
}
