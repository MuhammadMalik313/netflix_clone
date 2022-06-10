import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/strings.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final String url;
  NumberCard({Key? key, required this.index,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(kBaseUrl+url),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            left: 10,
            bottom: -20,
            child: BorderedText(
              strokeWidth: 10.0,
              strokeColor: kWhiteColor,
              child: Text(
                "${index + 1}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    decorationColor: Color.fromARGB(255, 254, 254, 254)),
              ),
            ))
      ],
    );
  }
}
