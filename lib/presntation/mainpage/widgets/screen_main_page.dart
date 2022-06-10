import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presntation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone/presntation/fastlaughs/fast_laugh.dart';
import 'package:netflix_clone/presntation/home/screen_home.dart';
import 'package:netflix_clone/presntation/mainpage/widgets/bottom_nav.dart';
import 'package:netflix_clone/presntation/newandhot/new_and_hot.dart';
import 'package:netflix_clone/presntation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({Key? key}) : super(key: key);
  List _pages=[
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ValueListenableBuilder(valueListenable:indexChangeNotifier , builder: (ctx,int index,_){
     return _pages[index];
      }),
    );
  }
}
