//kode http_helper.dart
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dbmovie/model/movie.dart';
class HttpHelper{
/*
Kelas ini digunakan untuk mendapatkan data dari themoviedb
dengan metode Upcoming yang memberikan nilai return berupa teks
*/
  final String urlKey = 'api_key=377f20ef15925d794dccfc3a3b96562a'; //1
  final String urlBase = 'https://api.themoviedb.org/3/movie'; //2
  final String urlUpcoming = '/upcoming?'; //3
  final String urlLanguage = '&language=en-US'; //4
  final String urlSearchBase = 'https://api.themoviedb.org/3/search/movie?';
  final String urlTopRated = 'https://api.themoviedb.org/3/movie/top_rated?';


  Future<String> getUpcoming() async{ //5
    final Uri upcoming = Uri.parse(urlBase + urlUpcoming + urlKey + urlLanguage);
//6
    http.Response result = await http.get(upcoming); //7
    if(result.statusCode == HttpStatus.ok){ //8
      String responseBody = result.body;
      return responseBody; //9
    }
    else {
      return '{}'; //10
    }
  }
  Future<List> getUpComingAsList() async {
    final Uri upcoming =
    Uri.parse(urlBase + urlUpcoming + urlKey + urlLanguage);
    http.Response result = await http.get(upcoming);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(result.body); //1
      final movieObjects = jsonResponseBody['results']; //2
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();
//3
      return movies;
    } else {
      return [];
    }
  }
  Future<List> findMovies(String title) async {
    final Uri query =
    Uri.parse(urlSearchBase + title + urlKey + urlLanguage);
    http.Response hasilcari = await http.get(query);
    if (hasilcari.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(hasilcari.body); //1
      final movieObjects = jsonResponseBody['results']; //2
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();
//3
      return movies;
    } else {
      return [];
    }
  }
  Future<List> getTopRatedList() async {
    final Uri topRated =
    Uri.parse(urlTopRated + urlKey + urlLanguage);
    http.Response result = await http.get(topRated);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponseBody = json.decode(result.body); //1
      final movieObjects = jsonResponseBody['results']; //2
      List movies = movieObjects.map((json) => Movie.fromJson(json)).toList();
//3
      return movies;
    } else {
      return [];
    }
  }
}


