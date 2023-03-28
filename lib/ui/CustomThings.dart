import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/movies.dart';
import '../model/question.dart';
import '../movie_ui/movies_ui.dart';
import 'util/hexcolor.dart';

class listview extends StatelessWidget {
  final List<Movie> movieslist = Movie.getMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("movies list"),
        ),
        body: ListView.builder(
          itemCount: movieslist.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                moviecard(movieslist[index], context),
                Positioned(
                    top: 10.0, child: movieImage(movieslist[index].images[0])),
              ],
            );
            /* return Card(
                elevation: 3.2,
                color: Colors.black12,
                child: ListTile(
                    leading: CircleAvatar(
                        child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(movieslist[index].images[0]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(14.0)),
                      child: null,
                    )),
                    title: Text(movieslist[index].title),
                    subtitle: Text(movieslist[index].title),
                    //onLongPress: () => debugPrint("press"),
                    trailing: Text(".."),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => back(
                                  movieslist[index].title, movieslist[index])));
                    }));*/
          },
        ));
  }

  Widget moviecard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 35.0, right: 35.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            movie.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: Colors.white),
                          ),
                        ),
                        Text("Rating: ${movie.imdbRating} / 10",
                            style: mainstyle()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(movie.runtime, style: mainstyle()),
                        Text(movie.released, style: mainstyle()),
                        Text(movie.rated, style: mainstyle()),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => movieDetailsPage(movie.title, movie)))
      },
    );
  }

  TextStyle mainstyle() {
    return TextStyle(fontSize: 15.0, color: Colors.grey);
  }

  Widget movieImage(String imageURL) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageURL ??
                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.esquire.com%2Fentertainment%2Fmovies%2Fg39654001%2Fbest-action-movies-2022%2F&psig=AOvVaw1PnjsZYm7ycBT3PSEWxeVM&ust=1679844115380000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCPCpxZrg9_0CFQAAAAAdAAAAABAJ"),
              fit: BoxFit.cover,
            )));
  }
}

class movieDetailsPage extends StatelessWidget {
  final String name;
  final Movie movie;

  movieDetailsPage(this.name, this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          movieDitailsThumbnail(movie.images[0]),
          Row(
            children: [
              MoviePosters(movie.images[0]),
              SizedBox(width: 16.0),
              Expanded(
                child: movieDitailsHeder(
                  movie: movie,
                ),
              ),
            ],
          ),
          HorizontalLine(),
          MovieDetailCast(
            movie: movie,
          ),
          HorizontalLine(),
          MovieExtraPoster(
            poster: movie.images,
          )
        ],
      ),
      // body: Container(
      //     child: Center(
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Text(movie.director),
      //   ),
      // )));
      //}
    );
  }
}

//END of movie list app

class customButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snakBar = SnackBar(
          content: Text("hello ther"),
          backgroundColor: Colors.blueGrey,
        );

        ScaffoldMessenger.of(context).showSnackBar(snakBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Text(
          "ok!",
        ),
      ),
    );
  }
}

class BillSplitter extends StatefulWidget {
  @override
  State<BillSplitter> createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPrecent = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  Color _co = HexColor("#FFA5D6A7");
  Color _coo = HexColor("#FF1B5e20");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.4),
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _co.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12.5),
              ),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Totla Per Person",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: _coo,
                            fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                            "\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPrecent)}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _coo,
                                fontSize: 45.0)),
                      ),
                    ]),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: _co.withOpacity(0.9),
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(children: [
                  TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(
                        color: _coo,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        // prefixIcon: Icon(Icons.attach_money),
                        prefixText: "Price : ",
                      ),
                      onChanged: (String value) {
                        try {
                          _billAmount = double.parse(value);
                        } catch (e) {
                          _billAmount = 0.0;
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Splite:",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (_personCounter > 1) {
                                    _personCounter--;
                                  }
                                });
                              },
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _co,
                                ),
                                child: Center(
                                  child: Text("-",
                                      style: TextStyle(
                                        color: _coo,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0,
                                      )),
                                ),
                              )),
                          Text("$_personCounter",
                              style: TextStyle(
                                color: _coo,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              )),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _personCounter++;
                                });
                              },
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _co,
                                ),
                                child: Center(
                                  child: Text("+",
                                      style: TextStyle(
                                        color: _coo,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0,
                                      )),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tip : ",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(right: 45.0),
                          child: Text(
                            "\$ ${(calculatTotalTip(_billAmount, _personCounter, _tipPrecent)).toStringAsFixed(2)}",
                            style: TextStyle(
                              color: _coo,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                      ]),
                  Column(
                    children: [
                      Text("$_tipPrecent %",
                          style: TextStyle(
                              color: _coo,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0)),
                      Slider(
                          min: 0.0,
                          max: 100.0,
                          activeColor: _coo,
                          inactiveColor: Colors.grey,
                          divisions: 20,
                          value: _tipPrecent.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPrecent = value.round();
                            });
                          }),
                    ],
                  )
                ]))
          ],
        ),
      ),
    );
  }
}

calculateTotalPerPerson(double bill, int split, int tip) {
  var totalperperson = (calculatTotalTip(bill, split, tip) + bill) / split;
  return totalperperson.toStringAsFixed(2);
}

calculatTotalTip(double bill, int split, int tip) {
  double totaltip = 0.0;
  if (bill < 0 || bill.toString().isEmpty || bill == null) {
    //erore
  } else {
    totaltip = (bill * tip) / 100;
  }
  return totaltip;
}

class wisdom extends StatefulWidget {
  @override
  State<wisdom> createState() => _wisdomState();
}

class _wisdomState extends State<wisdom> {
  int _index = 0;
  List qoeut = [
    "Just one small positive thought in the morning can change your whole day",
    "Opportunities don't happen, you create them",
    "Love your family, work super hard, live your passion",
    "It is never too late to be what you might have been",
    "You do not find the happy life. You make it.",
    "The most wasted of days is one without laughter.",
    "Stay close to anything that makes you glad you are alive.",
    "Make each day your masterpiece.",
    "Happiness often sneaks in through a door you didn’t know you left open.",
    "Happiness is not by chance, but by choice",
    "Life changes very quickly, in a very positive way, if you let it",
    "Keep your face to the sunshine and you cannot see a shadow.",
    "Impossible is for the unwilling.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quots"), backgroundColor: Colors.black54,
        // centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(23.3),
                    ),
                    child: Center(
                        child: Text(
                      qoeut[_index % qoeut.length],
                      style: TextStyle(
                        fontSize: 25.4,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                    ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    fixedSize: Size.fromWidth(100),
                    padding: EdgeInsets.all(10),
                  ),
                  child: Text("NEXT"),
                  onPressed: _showquoet,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _showquoet() {
    setState(() {
      _index++;
    });
  }
}

class question extends StatefulWidget {
  @override
  State<question> createState() => _question();
}

class _question extends State<question> {
  int _index = 0;
  int _rating = 0;
  List questionBank = [
    // Question.name("آیا سیب میوه است؟", false),
    // Question.name("آیا ایران در آسیا قرار دارد؟", false),
    // Question.name("آیا سارا اسم پسر است؟", true),
    // Question.name("آیا ریاضی یک زبان است؟", true),
    // Question.name("آیا پرتقال سیاه است؟", true),
    // Question.name("آیا خورشید در شب است؟", true),
    // Question.name("آیا سیگار برای بدن ضرر دارد؟", false),
    // Question.name("آیا سگ از گربه می ترسد؟", true),
    // Question.name("آیا تابستان یکی از ماه های سال است؟", false),
    // Question.name("آیا پاییز بعد از بهار می آید؟", true),
    // Question.name("آیا برف در زمستان می بارد؟", false),
    // Question.name("آیا سعید اسم پسر است؟", false),
    // Question.name("آیا ترکیه یک کشور است؟", false),
    // Question.name("آیا ساری پایتخت گیلان است؟", false),
    // Question.name("آیا ما جوراب را روی کفش می پوشیم؟", true),
    // Question.name("آیا ما در بشقاب آب می خوریم؟", true),
    // Question.name("آیا سگ یک پرنده است؟", true),
    // Question.name("آیا آسمان آبی است؟", false),
    // Question.name("آیا زمین گرد نیست؟", true),
    // Question.name("آیا کولر گرم می کند؟", true),
    Question.name("Sharks are mammals ?", false),
    Question.name("Sea otters have a favorite rock they use to break open food ?", true),
    Question.name("The blue whale is the biggest animal to have ever lived ?", true),
    Question.name("Bats are blind?", false),
    Question.name("A dog sweats by panting its tongue?", false),
    Question.name("It takes a sloth two weeks  to digest a meal ?", true),
    Question.name("An ant can lift 1,000 times its body weigh ?", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.blueGrey,
        title: Text(
          "SCORE : $_rating ",
          style: TextStyle(color: Colors.white,),

        ),
      ),
     // backgroundColor: Colors.blueGrey,
      body: Builder(builder: (context) {
        return Container(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "images/bullseye.png",
                  width: 350,
                  height: 250,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.9),
                      border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid,
                      )),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_index].questiontext,
                      // style: TextStyle(
                      //   fontSize: 20,
                      //   color: Colors.orange,
                      // ),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /* TextButton(
                      onPressed: () => _backquestion(),
                      child: Icon(Icons.arrow_back),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      )),*/
                  TextButton(
                      onPressed: () => _checkanswer(true, context),
                      child: Text("TRUE"),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      )),
                  TextButton(
                      onPressed: () => _checkanswer(false, context),
                      child: Text("FALSE"),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      )),
                  TextButton(
                      onPressed: () => _nextquestion(),
                      child: Icon(Icons.arrow_forward),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      )),
                ],
              ),
              Spacer(),
            ],
          ),
        );
      }),
    );
  }

  _nextquestion() {
    setState(() {
      _index++;
      if (_index > questionBank.length - 1) {
        _index = 0;
      }
    });
  }

  _checkanswer(bool userchoice, BuildContext context) {
    if (questionBank[_index].answer == userchoice) {
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 800),
        content: Text("درست"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {
        _rating++;
      });
      _nextquestion();
    } else {
      final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 800),
        content: Text("نادرست"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      _nextquestion();
    }
  }

/*_backquestion() {
    setState(() {
      _index--;
      if (_index < 0) {
        _index = questionBank.length - 1;
      }
    });
  }*/
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepOrangeAccent,
        child: Center(
          child: Text("hello", textDirection: TextDirection.ltr),
        ));
  }
}

class bizcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bizcard"), backgroundColor: Colors.black,
          // centerTitle: true,
        ),
        backgroundColor: Colors.black12,
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _getCard(),
              _getAvatar(),
            ],
          ),
        ));
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.4),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(14.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Haniyeh Zahraee",
              style: TextStyle(
                  fontSize: 25.3,
                  fontWeight: FontWeight.w500,
                  fontFamily: AutofillHints.birthdayDay,
                  color: Colors.black)),
          Text("haniyehzahraee@gmail.com",
              style: TextStyle(
                fontSize: 17.3,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.perm_identity),
              Text("GitHub: @hanizhr", style: TextStyle(fontSize: 17.3))
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(color: Colors.black, width: 1.2),
            image: DecorationImage(
                image: NetworkImage("https://picsum.photos/id/1/200/300"),
                fit: BoxFit.cover)));
  }
}


