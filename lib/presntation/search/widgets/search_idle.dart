import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/infrastructure/api.dart';
import 'package:netflix_clone/presntation/search/widgets/search_title.dart';

import '../../../infrastructure/models/datamodel/data_model.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/qe5YpbG58snbEO3heyn2r3sVfYj.jpg";

class SearchIdle extends StatelessWidget {
  SearchIdle({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SerchTitle(title: "Top Searches"),
        kHieght,
        Expanded(
          child: FutureBuilder(
              future: MoviesDB().getPopular(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<MovieDataModel>> snapshot) {
                // malik = snapshot.data![index].originalTitle;
                {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) =>
                          TopSearchItemTile(index: index),
                      separatorBuilder: (ctx, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: 10);
                }
              }),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  int index;
  dynamic malik;

  TopSearchItemTile({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var snapshot;
    return Row(children: [
      Container(
        width: screenWidth * .35,
        height: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    NetworkImage(kBaseUrl + snapshot[index].posterPath!),
                fit: BoxFit.cover)),
      ),
      kWidth,
      Expanded(
        child: Text(
          "malik.toString()",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      const Icon(
        Icons.play_circle_outline_outlined,
        color: kWhiteColor,
        size: 50,
      )
    ]);
  }
}
