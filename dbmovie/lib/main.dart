import 'package:dbmovie/screen/movie_list_view.dart';
import 'package:flutter/material.dart';
import 'package:dbmovie/screen/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieDB',
      home: MovieListView(),
    );
  }
}




