import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
ValueNotifier<int> indexChangeNotifier=ValueNotifier(0) ;

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (ctx,int newIndex,_){
    return  BottomNavigationBar(
        currentIndex: newIndex,
        onTap: (index){
          indexChangeNotifier.value=index;
        },
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.collections), label: "New&hot"),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: "Fast Laughs"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.download_for_offline), label: "Downloads"),
        ],
      );
      },
      
    );
  }
}
