import 'package:flutter/material.dart';

import 'CustomThings.dart';

class ScatffoldExample extends StatelessWidget {

  _iconpress(){
    debugPrint("alarm press");
  }

 @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      title: Text("welcome"),
      centerTitle: false,
      backgroundColor: Colors.black54,
    actions: [
      IconButton(onPressed: () => debugPrint("press"), icon: Icon(Icons.email) , color: Colors.amber,),
      IconButton(onPressed: _iconpress, icon: Icon(Icons.access_alarm) ,color: Colors.amber,),
      IconButton(onPressed: () => debugPrint("search press"), icon: Icon(Icons.saved_search),color: Colors.amber,)
    ],),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.pets), label: "pet"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
      ], onTap: (int index) => debugPrint("tap : $index"),),
      floatingActionButton: FloatingActionButton(
        backgroundColor : Colors.lightBlue,
        child: Icon(Icons.arrow_back_outlined),
        onPressed: ()=>debugPrint("press it  "),
        ),
      backgroundColor: Colors.greenAccent,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButton(),
       /*     InkWell(
              child: Text("click", style: TextStyle(fontSize: 34.2, fontStyle: FontStyle.italic),),
              onDoubleTap: () => debugPrint("tap..."),

            )
            */
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.greenAccent,
      child: Center(child: Text("Hello Haniyeh", textDirection: TextDirection.ltr)),
      textStyle: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 45.6,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}