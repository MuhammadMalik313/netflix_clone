
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../search/widgets/search_title.dart';
import 'main_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,required this.title1
  }) : super(key: key);
  final title1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SerchTitle(
          title: title1,
        ),
        kHieght,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => MainCard2(index:index,title: title1
                ,),
              )),
        )
      ],
    );
  }
}
