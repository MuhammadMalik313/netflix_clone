import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/infrastructure/api.dart';
import 'package:netflix_clone/presntation/search/widgets/search_title.dart';

import '../../infrastructure/models/datamodel/data_model.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/iwIdajr5Y4zq2ibvq75VnDAJBr.jpg";

class SearchResultWidget extends StatelessWidget {
  String value;
   SearchResultWidget({Key? key,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        kHieght,
        Expanded(
          child: FutureBuilder(
            future: MoviesDB().search(value),
            builder: (BuildContext context, AsyncSnapshot<List<MovieDataModel>> snapshot){
             
   return  GridView.count(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(20, (index) {
                return MainCard(index: index,result: snapshot.data!,);
              }),
            );
            },
            
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  int index;
  List <MovieDataModel> result;
   MainCard({Key? key,required this.index,required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
     
      
       Container(
          decoration: BoxDecoration(
            image:  DecorationImage(
              image: NetworkImage(kBaseUrl+result[index].posterPath!),
              fit: BoxFit.cover,
            ),
            borderRadius:BorderRadius.circular(8) 
          ),
        );
      }
    
  }

