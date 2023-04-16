import 'package:flutter/material.dart';
import 'package:structurehack2023/screens/about_app_screen.dart';
import 'package:structurehack2023/screens/new_card.dart';

import '../screens/cardList_page.dart';
import '../screens/home_page.dart';



Route getPageByIndex(int index) {
  switch (index) {
    case 0:
      return MaterialPageRoute(
        builder: (context) => const NewCard(),
      );
    case 1:
      return MaterialPageRoute(
        builder: (context) => const CardListPage(),
      );
    case 2:
      return MaterialPageRoute(
        builder: (context) => AboutScreen(),
      );
    default:
      throw ArgumentError('Invalid index: $index');
  }
}

class CustomPageTransitionsTheme extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
      Route<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}


