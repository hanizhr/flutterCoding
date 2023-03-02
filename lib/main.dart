//import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.lightBlueAccent,
      child: Center(child: Text("hello", textDirection: TextDirection.ltr)),
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 45.3,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
