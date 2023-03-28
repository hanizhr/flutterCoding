//import 'dart:html';

import 'package:flutter/material.dart';

import 'ui/CustomThings.dart';

final ThemeData _appthem = _buildappthem();

ThemeData _buildappthem() {
  final ThemeData base =ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.orange,
    primaryColor:Colors.red,
    scaffoldBackgroundColor: Colors.blueGrey ,
    backgroundColor:Colors.green,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: "Alkatra",
        fontSize: 20,
        color: Colors.white,
      ),
    ).apply(
      fontFamily: "Alkatra"
    ),
   // textTheme: _appTextTheme(base.textTheme),
  );
}

// TextTheme _appTextTheme(TextTheme base) {
//   return base.copyWith(
//     headlineMedium: base.headlineMedium?.copyWith(
//       fontWeight: FontWeight.w500,
//     ),
//     titleMedium: base.titleMedium?.copyWith(
//       fontSize: 18.0,
//     ),
//     caption: base.caption?.copyWith(
//       fontWeight: FontWeight.w400,
//       fontSize: 14,
//     ),
//     bodyMedium: base.bodyMedium?.copyWith(
//       fontSize: 30.9,
//       color: Colors.white,
//     )
//   );
// }


//void main() => runApp(Home());
void main() => runApp(MaterialApp(
  theme: _appthem,
      // theme: ThemeData(
      //     brightness: Brightness.dark,
      //     // primaryColor: Colors.orange[900],
      //     textTheme: TextTheme(
      //         headlineMedium:
      //             TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
      //         bodyMedium: TextStyle(
      //             fontSize: 24,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.orange))),
      home: question(),
    ));
