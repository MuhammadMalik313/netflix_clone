
import 'package:flutter/material.dart';
import 'package:netflix_clone/infrastructure/api.dart';
import 'package:netflix_clone/infrastructure/models/datamodel/data_model.dart';

import '../../../core/constants.dart';
import '../../search/widgets/search_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
   NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SerchTitle(
          title: "Top 10 tv shows India Today",
        ),
        kHieght,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: MoviesDB().getAllMovies(),
            builder: (BuildContext context, AsyncSnapshot<List<MovieDataModel>> action) {
              print(action.data!.length);
             if (action.data==null){
            return CircularProgressIndicator();
              }
             return  ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    action.data!.length,
                    (index) => NumberCard(
                      index: index,url: action.data![index].posterPath!,
                    ),
                  ));
           
            }
          ),
        )
      ],
    );
  }
}

