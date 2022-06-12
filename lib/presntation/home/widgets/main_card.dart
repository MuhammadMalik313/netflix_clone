import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/infrastructure/api.dart';
import 'package:netflix_clone/infrastructure/models/datamodel/data_model.dart';

class MainCard2 extends StatelessWidget {
  final int index;
  final String title;
  const MainCard2({
    Key? key,
    required this.index,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:getData(title),
        builder: (BuildContext context,
            AsyncSnapshot<List<MovieDataModel>> snapshot) {
          if (snapshot.data == null) {
            return SizedBox(
              width: 130,
              child: Center(child: CircularProgressIndicator()));
          }
          return Container(
            margin: EdgeInsets.all(8),
            width: 130,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "$kBaseUrl${snapshot.data![index].posterPath}"),
              ),
            ),
          );
        });


  }
  
Future <List<MovieDataModel>> getData(String title)async{
  switch(title){
     case "Released In the past year":
     return await MoviesDB().getPopular();
     case "Trending Now":
     return await MoviesDB().getAllMovies();
 case "Tense Dramas":
     return await MoviesDB().getTVShow();

       case "South Indian cinemas":
     return await MoviesDB().getAllMovies();


default:return[];
  } 

}

}

