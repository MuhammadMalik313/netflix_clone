import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presntation/fastlaughs/widgets/video_list_generator.dart';
import 'package:netflix_clone/presntation/mainpage/widgets/bottom_nav.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: PageView(
            scrollDirection: Axis.vertical,
        children: List.generate(20, ((index) {
          return VideoListGenerator(
            index: index,
          );
        })),
      )),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}
