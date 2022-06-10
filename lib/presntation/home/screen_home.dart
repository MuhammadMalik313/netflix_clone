import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/infrastructure/api.dart';
import 'package:netflix_clone/infrastructure/models/datamodel/data_model.dart';
import 'package:netflix_clone/presntation/home/widgets/main_title_card.dart';
import 'package:netflix_clone/presntation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presntation/mainpage/widgets/bottom_nav.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, index, _) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: ((notification) {
                    final ScrollDirection direction = notification.direction;
                    print(direction);
                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }
                    return true;
                  }),
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Stack(
                            children: [
                              FutureBuilder(
                                  future: MoviesDB().getAllMovies(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<MovieDataModel>>
                                          allmovies) {
                                    if (allmovies.data == null) {
                                      return SizedBox(
                                          height: 500,
                                          width: 500,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 1,
                                          ));
                                    }
                                    return Container(
                                        width: double.infinity,
                                        height: 500,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: NetworkImage(kBaseUrl +
                                              allmovies.data![10].posterPath
                                                  .toString()),
                                        )));
                                  }),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomButton(
                                          icon: Icons.add, title: 'My List'),
                                      const _playButton(),
                                      CustomButton(
                                          icon: Icons.info, title: "Info")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          MainTitleCard(
                            title1: "Released In the past year",
                          ),
                          kHieght,
                          MainTitleCard(
                            title1: "Trending Now",
                          ),
                          kHieght,
                          kHieght,
                          NumberTitleCard(),
                          kHieght,
                          MainTitleCard(
                            title1: "Tense Dramas",
                          ),
                          kHieght,
                          MainTitleCard(
                            title1: "South Indian cinemas",
                          )
                        ],
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 1500),
                              width: double.infinity,
                              height: 80,
                              color: Colors.black.withOpacity(0.5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        "https://play-lh.googleusercontent.com/TBRwjS_qfJCSj1m7zZB93FnpJM5fSpMA_wUlFDLxWAb45T9RmwBvQd5cWR5viJJOhkI",
                                        height: 60,
                                        width: 60,
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.cast,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      kWidth,
                                      Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.blue,
                                      ),
                                      kWidth
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "TV Shows",
                                        style: kHometextStyle,
                                      ),
                                      Text(
                                        "Movies",
                                        style: kHometextStyle,
                                      ),
                                      Text(
                                        "Categories",
                                        style: kHometextStyle,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : kHieght
                    ],
                  ),
                );
              })),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  CustomButton(
      {Key? key,
      required this.icon,
      required this.title,
      this.iconSize = 25,
      this.textSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
        )
      ],
    );
  }
}

class _playButton extends StatelessWidget {
  const _playButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),
        onPressed: () {},
        icon: Icon(
          Icons.play_arrow,
          size: 25,
          color: kBlackColor,
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20, color: kBlackColor),
          ),
        ));
  }
}
