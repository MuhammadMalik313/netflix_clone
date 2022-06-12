import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/infrastructure/api.dart';
import 'package:netflix_clone/infrastructure/models/datamodel/data_model.dart';
import 'package:netflix_clone/presntation/mainpage/widgets/bottom_nav.dart';
import 'package:netflix_clone/presntation/newandhot/widget/coming_soon.dart';
import 'package:netflix_clone/presntation/newandhot/widget/everyone_watchin.dart';

import '../../core/constants.dart';
import '../home/screen_home.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "New & Hot",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              Icon(
                Icons.cast,
                size: 30,
                color: Colors.white,
              ),
              kWidth,
             
              kWidth,
            ],
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: kWhiteColor,
                labelColor: kBlackColor,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(30)),
                tabs: [
                  Tab(text: "🍿 Coming Soon"),
                  Tab(
                    text: "👀 Evryone's Watching",
                  )
                ]),
          ),
          backgroundColor: backgroundColor,
          body: Center(
              child: TabBarView(children: [
            _buildComingSoon(),
            _buildWatching(),
          ])),
          bottomNavigationBar: const BottomNavigationWidgets(),
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return FutureBuilder(
        future: MoviesDB().getTVShow(),
        builder: (BuildContext context,
            AsyncSnapshot<List<MovieDataModel>> heading) {
          if (heading.data != null) {
             return ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (ctx, index) =>
                  ComingSoonWidget(index: index, heading: heading.data));
           
          }
          return SizedBox(child: Center(child: CircularProgressIndicator()),);
         
        });
  }

  Widget _buildWatching() {
    return FutureBuilder(
        future: MoviesDB().getPopular(),
        builder: (BuildContext context,
            AsyncSnapshot<List<MovieDataModel>> everyone) {
          if (everyone.data == null) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: ((context, index) =>
                  EveryoneWatching(index: index, everyone: everyone.data!)));
        });
  }
}
