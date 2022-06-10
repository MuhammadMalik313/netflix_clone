import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presntation/mainpage/widgets/bottom_nav.dart';
import 'package:netflix_clone/presntation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
     final _widgetList = 
     [SmartDownloads(), Section1(), Section2()];
  
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          ),
        ),
        backgroundColor: backgroundColor,
        body: ListView.separated(
          padding: EdgeInsets.all(10),
            itemBuilder:(ctx,index)=>_widgetList[index],
            separatorBuilder: (ctx,index)=>SizedBox(height: 20,),
            itemCount: _widgetList.length),
        bottomNavigationBar: const BottomNavigationWidgets(),
      ),
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      kWidth,
      Icon(
        Icons.settings,
        color: kWhiteColor,
      ),
      Text("smart Downloads"),
    ]);
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {Key? key,
      required this.size,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      this.radius = 10})
      : super(key: key);

  final Size size;
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            // margin: margin,
            width: size.width,
            height: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                // fit: BoxFit.cover,
                image: NetworkImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List imageList = [
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pTEFqAjLd5YTsMD6NSUxV6Dq7A6.jpg",
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hIkKM1nlzk8DThFT4vxgW1KoofL.jpg",
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uXEqmloGyP7UXAiphJUu2v2pcuE.jpg"
    ];
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHieght,
        const Text(
          "We will download a personalized selection of\nmovies and shows for you so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.55,
                backgroundColor: Colors.grey.withOpacity(.5),
              ),
              DownloadImageWidget(
                margin: EdgeInsets.only(left: 190, top: 50),
                size: Size(size.width * .71, size.width * .58),
                imageList: imageList[1],
                angle: 25,
                radius: 10,
              ),
              DownloadImageWidget(
                margin: EdgeInsets.only(right: 190,top: 50 ),
                size: Size(size.width * .71, size.width * .58),
                imageList: imageList[0],
                angle: -25,
                radius: 20,
              ),
              DownloadImageWidget(
                margin: EdgeInsets.only(left: 0, top: 20),
                size: Size(size.width * .77, size.width * .9),
                imageList: imageList[2],
                radius: 70,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Set Up",
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        kHieght,
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {},
          child: const Text(
            "See What You can download",
            style: TextStyle(
                color: kBlackColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          color: kWhiteColor,
        )
      ],
    );
  }
}
