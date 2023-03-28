import 'package:first_flutter_app/model/movies.dart';
import 'package:flutter/material.dart';

class movieDitailsThumbnail extends StatelessWidget {
  String thumbnail;

  movieDitailsThumbnail(this.thumbnail);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Icon(Icons.play_circle_outline_rounded,
                size: 70, color: Colors.white)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          height: 60,
        )
      ],
    );
  }
}

class moviePoster extends StatelessWidget {
  final Movie movie;

  moviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          MoviePosters(movie.images[2].toString()),
        ],
      ),
    );
  }
}

class MoviePosters extends StatelessWidget {
  final String poster;

  MoviePosters(this.poster);

  @override
  Widget build(BuildContext context) {
    var borderRaius = BorderRadius.circular(10);
    return Card(
        child: ClipRRect(
          borderRadius: borderRaius,
          child: SizedBox(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 160,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(poster), fit: BoxFit.cover)),
            ),
          ),
        ));
  }
}

class movieDitailsHeder extends StatelessWidget {
  final Movie movie;

  const movieDitailsHeder({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${movie.year} . ${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          movie.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.orange,
          ),
        ),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: movie.plot,
              ),
              TextSpan(
                text: "More...",
                style: TextStyle(color: Colors.blue),
              )
            ]))
      ],
    );
  }
}

class MovieDetailCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailCast({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            MovieField("Cast", movie.actor),
            MovieField("Director", movie.director),
            MovieField("Awards", movie.awards),
          ],
        ));
  }
}

class MovieField extends StatelessWidget {
  final String field;

  MovieField(
      this.field,
      this.value,
      );

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        "$field : ",
        style: TextStyle(
            color: Colors.black45, fontSize: 12, fontWeight: FontWeight.w500),
      ),
      Expanded(
        child: Text(
          value,
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
        ),
      )
    ]);
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieExtraPoster extends StatelessWidget {
  final List<String> poster;

  const MovieExtraPoster({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "More movie posters".toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.black38,
            ),
          ),
        ),
        Container(
            height: 170,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 18,
              ),
              itemCount: poster.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            poster[index],
                          ),
                          fit: BoxFit.cover,
                        ))),
              ),
            ))
      ],
    );
  }
}
