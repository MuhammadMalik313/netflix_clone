import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/infrastructure/api.dart';
import 'package:netflix_clone/presntation/search/widgets/search_title.dart';

import '../../../infrastructure/models/datamodel/data_model.dart';



class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           
              kHieght,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SerchTitle(
                    title: "Top Searches",
                  ),
                  kHieght,
                  FutureBuilder(
                      future: MoviesDB().getPopular(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<MovieDataModel>> searchIdle) {
                        if (searchIdle.data != null) {
                          return Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (ctx, index) => TopSearchItemTile(
                                  idleData: searchIdle.data![index]),
                              separatorBuilder: (ctx, index) => kHieght,
                              itemCount: searchIdle.data!.length,
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      })
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}



class TopSearchItemTile extends StatelessWidget {

 MovieDataModel idleData;
  TopSearchItemTile({Key? key, required this.idleData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(children: [
      Container(
        width: screenWidth * 0.35,
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("$kBaseUrl${idleData.posterPath}"),
          ),
        ),
      ),
      SizedBox(width: 10,),
      Expanded(
        child: Text(
          idleData.title!,
          style: TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      CircleAvatar(
        backgroundColor: kWhiteColor,
        radius: 23,
        child: CircleAvatar(
          backgroundColor: kBlackColor,
          radius: 21,
          child: Icon(
            CupertinoIcons.play_fill,
            color: kWhiteColor,
          ),
        ),
      ),
    ]);
  }
}
