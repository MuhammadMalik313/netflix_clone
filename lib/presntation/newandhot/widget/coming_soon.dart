import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/infrastructure/api.dart';

import '../../../infrastructure/models/datamodel/data_model.dart';
import '../../home/screen_home.dart';

class ComingSoonWidget extends StatelessWidget {
  final int index;
  List<MovieDataModel>? heading;
  ComingSoonWidget({
    Key? key,
    required this.index,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Row(
      children: [
        kHieght,
        SizedBox(
          width: 50,
          height: 435,
          child: Column(
            children: const [
              kHieght,
              Text(
                "FEB",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(index: index, coming: heading),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    return Expanded(
                      child: Text(
                        heading![index].originalTitle.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "font1"),
                      ),
                    );
                  }),
                  Spacer(),
                  Row(
                    children: [
                      CustomButton(
                        icon: Icons.alarm_on,
                        title: "Remind me",
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kWidth,
                      CustomButton(
                        icon: Icons.info,
                        title: "info",
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kWidth
                    ],
                  )
                ],
              ),
              kHieght,
              Text("Coming On friday"),
              kHieght,
              Expanded(
                child: Text(
                  heading![index].title.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  heading![index].overview.toString(),
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class VideoWidget extends StatelessWidget {
  final int index;
  List<MovieDataModel>? coming;
  VideoWidget({
    Key? key,
    required this.index,
    required this.coming,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            // height: 250,
            // width: 500,
            child: Image.network(
                kBaseUrl + coming![index].backdropPath.toString())),
        Positioned(
          bottom: 10,
          right: 9,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black.withOpacity(.5),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_off,
                  size: 30,
                )),
          ),
        ),
      ],
    );
  }
}
