import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/post.dart';

class jsonParsingMap extends StatefulWidget {
  const jsonParsingMap({Key? key}) : super(key: key);

  @override
  State<jsonParsingMap> createState() => _jsonParsingMapState();
}

class _jsonParsingMapState extends State<jsonParsingMap> {
  late Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Network network = Network("https://jsonplaceholder.typicode.com/posts");
    data = network.loadPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing Map PODO"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: data,
            builder: (context , AsyncSnapshot<PostList> snapshot){
              List<Post> allPosts ;
              if(snapshot.hasData) {
                allPosts = snapshot.data!.posts;
                return creatListview(allPosts,context);
              }else{
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
  Widget creatListview(List<Post> data, BuildContext context){
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Divider(height:5.0),
              ListTile(
                title: Text("${data[index].title}"),
                subtitle: Text("${data[index].body}"),
                leading: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor:Colors.green,
                      radius: 23,
                      child:Text("${data[index].id}")
                    )
                  ],
                )
              )
            ],
          );
        },

      ),
    );
  }
}

class Network{
  final String url;

  Network(this.url);
  
  Future<PostList>loadPosts() async{
    final response = await get(Uri.parse(url));

    if(response.statusCode == 200){
      //ok
      return PostList.fromJson(json.decode(response.body)); //we get json object
    }else{
      throw Exception("Failed to get post");
    }
  }

}