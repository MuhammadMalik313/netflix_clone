import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/infrastructure/models/alldata/data_all.dart';
import 'models/datamodel/data_model.dart';

abstract class ApiCalls {
  Future getAllMovies();
  Future getTrending();
  Future getPopular();
  Future getTVShow();
  Future getAction();
  Future search(String value);
}

class MoviesDB extends ApiCalls {
  @override
  Future<List<MovieDataModel>> getAllMovies() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/trending/all/day?api_key=cd675c551c80cf0a7bbc8e02cfdddd8d"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<MovieDataModel>> getPopular() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&page=1"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<MovieDataModel>> getTrending() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/account/{account_id}/rated/movies?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&sort_by=created_at.asc&page=1"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<MovieDataModel>> getTVShow() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&page=1"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<MovieDataModel>> getAction() async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/{movie_id}/lists?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&page=1"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  @override
  Future<List<MovieDataModel>> search(String value) async {
    final result = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=f88b478026037712e036ac5db7fe2109&language=en-US&query=$value&page=1&include_adult=false"));
    Map<String, dynamic> map = json.decode(result.body);
    final data = AllDataModel.fromJson(map);
    return data.results;
  }

  // @override
  // Future<List<Genre>> categories() async{
  //    final result = await http.get(Uri.parse(
  //       "https://api.themoviedb.org/3/genre/movie/list?api_key=f88b478026037712e036ac5db7fe2109&language=en-US"));
  //   Map<String, dynamic> map = json.decode(result.body);
  //   final data = Category.fromJson(map);
  //   return data.genres!;
  // }

}
