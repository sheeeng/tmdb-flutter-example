import 'dart:convert';

import 'dart:collection';

//import 'package:json_object/json_object.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmdb/MovieList.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _receivedData = 'Unknown';

  _getIPAddress() async {



    String url = 'https://api.themoviedb.org/3/movie/now_playing?api_key=&language=en-US&page=1';
    dynamic httpClient = createHttpClient();
    dynamic response = await httpClient.read(url);

    print("RESPONE:" + response.toString());



    JsonCodec codec = new JsonCodec();
    Map<String, dynamic> decoded = codec.decode(response);

    MovieList movieList = new MovieList.fromMap(decoded);
    print(movieList.results.toString());
    print(movieList.page.toString());
    print(movieList.total_results.toString());
    print(movieList.dates.toString());
    print(movieList.total_pages.toString());

    for (String key in decoded.keys) {
      print("KEY1: $key | VALUE1: ${decoded[key]}");
      print("KEY1: $key.runtimeType.toString() | VALUE1: ${decoded[key].runtimeType.toString()}" );

      if (key == "results") {
        //List
        List movieList = decoded[key];
        movieList.forEach((element) => print(element));


//        JsonCodec codec = new JsonCodec();
//        Map<String, dynamic> decodedMovie = codec.decode(response["results"]);
//        for (String key in decodedMovie.keys) {
//          print("KEY1: $key | VALUE1: ${decodedMovie[key]}");
//        }

      }

      if (key == "dates") {
        //_InternalLinkedHashMap
        LinkedHashMap lsmDates = decoded[key];
        for (var key in lsmDates.keys) {
          print("KEY3: $key | VALUE3: ${lsmDates[key]}");
        }
      }
    }


    Map decodedMap = JSON.decode(response);
    dynamic parsedResults = decodedMap["results"];

    print("The count is " + parsedResults.length.toString() + ".");
    print("The parsed results are " + parsedResults.toString() + ".");

    dynamic jsonDates = decodedMap['dates'];
    print(jsonDates.toString() + " - " + jsonDates.runtimeType.toString());
    dynamic jsonPage = decodedMap['page'];
    print(jsonPage.toString() + " - " + jsonPage.runtimeType.toString());

    dynamic jsonResults = decodedMap['results'];
    print(jsonResults.toString() + " - " + jsonResults.runtimeType.toString());

    dynamic jsonTotalPages = decodedMap['total_pages'];
    print(jsonTotalPages.toString() + " - " + jsonTotalPages.runtimeType.toString());
    dynamic jsonTotalResults = decodedMap['total_results'];
    print(jsonTotalResults.toString() + " - " + jsonTotalResults.runtimeType.toString());

//    JsonObject data = new JsonObject.fromJsonString(parsedResults);
//    data.forEach((key, value) => print("$key=$value"));


    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _receivedData = parsedResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 160.0);

    return new Scaffold(
      body: new Center(
        child: new ListView(
          children: <Widget>[
            spacer,
            new Text('Your data:'),
            new Text('$_receivedData.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get Data!'),
            ),
          ],
        ),
      ),
    );
  }
}
