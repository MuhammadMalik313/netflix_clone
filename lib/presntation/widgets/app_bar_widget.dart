import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
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
          decoration: BoxDecoration(image:DecorationImage(image:NetworkImage("https://apkvipo.com/wp-content/uploads/2021/04/Smart-Tv-Cast-for-Android.jpg") ) ),
          // color: Colors.blue,
        ),
        kWidth,
      ],
    );
  }
}
