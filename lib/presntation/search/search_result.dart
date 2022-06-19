import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/infrastructure/api.dart';
import 'package:netflix_clone/presntation/search/widgets/search_title.dart';

import '../../infrastructure/models/datamodel/data_model.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/iwIdajr5Y4zq2ibvq75VnDAJBr.jpg";

class SearchResultWidget extends StatelessWidget {
  String value;
  SearchResultWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHieght,
              // CupertinoSearchTextField(
              //     placeholder: value,
              //     backgroundColor: Color.fromARGB(255, 56, 53, 53).withOpacity(0.3),
              //     prefixIcon: const Icon(
              //       CupertinoIcons.search,
              //       color: Colors.grey,
              //     ),
              //     suffixIcon: const Icon(
              //       CupertinoIcons.xmark_circle_fill,
              //       color: Color.fromARGB(255, 106, 99, 99),
              //     ),
              //     style: const TextStyle(color: kWhiteColor),
              //   ),
            kHieght,
            Expanded(
              child: FutureBuilder(
                future: MoviesDB().search(value),
                builder: (BuildContext context,
                    AsyncSnapshot<List<MovieDataModel>> snapshot) {
                  if (snapshot.data != null) {
                    return GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.2 / 1.4,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: List.generate(20, (index) {
                        return MainCard(
                          index: index,
                          result: snapshot.data!,
                        );
                      }),
                    );
                  }else{
                    return SizedBox(child: Center(child: CircularProgressIndicator()));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  int index;
  List<MovieDataModel> result;
  MainCard({Key? key, required this.index, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(kBaseUrl + result[index].posterPath!),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
