

import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../../infrastructure/models/datamodel/data_model.dart';
import '../../home/screen_home.dart';
import 'coming_soon.dart';

class EveryoneWatching extends StatelessWidget {
  List<MovieDataModel> everyone;
  int index;
   EveryoneWatching({
    Key? key,
    required this.index,
    required this.everyone
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHieght,
          Text(
           everyone[index].originalTitle.toString() ,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          kHieght,
          Text(
           everyone[index].overview.toString(),
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 50,
          ),
           VideoWidget(index: index,coming:everyone,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(icon: Icons.share, title: "Share"),
              kWidth,
              CustomButton(icon: Icons.add, title: "My List"),
              kWidth,
              CustomButton(icon: Icons.play_arrow, title: "Play"),
              kWidth
            ],
          )
        ],
      ),
    );
  }
}
