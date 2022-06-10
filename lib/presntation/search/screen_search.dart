import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presntation/mainpage/widgets/bottom_nav.dart';
import 'package:netflix_clone/presntation/search/search_result.dart';
import 'package:netflix_clone/presntation/search/widgets/search_idle.dart';

class ScreenSearch extends StatelessWidget {
   ScreenSearch({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              onSubmitted: ((value) {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>SearchResultWidget(value:value) ,));
              }),
              backgroundColor: Colors.grey.withOpacity(0.3),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Color.fromARGB(255, 106, 99, 99),
              ),
              style: const TextStyle(color: kWhiteColor),
            ),
            kHieght,
           Expanded(child: SearchIdle()),
          // Expanded(child: SearchResultWidget(value,)),
            kHieght,
          ],
        ),
      )),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}
