import 'package:flutter/material.dart';
import 'package:groupb/models/contact.dart';
import 'package:groupb/screens/addContact.dart';
import 'package:groupb/screens/contactDetail.dart';

import 'screens/homeScreen.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(builder: (context) => HomePage());
    case AddContact.routeName:
      return MaterialPageRoute(builder: (context) => AddContact());
    case ContactDetail.routeName:
      return MaterialPageRoute(
          builder: (context) => ContactDetail(settings.arguments as int));
    // case SecondPage.routeName:
    //   return MaterialPageRoute(
    //       builder: (context) => SecondPage(settings.arguments as int));
    // case ThirdPage.routeName:
    //   return MaterialPageRoute(builder: (context) => ThirdPage());
    default:
      return MaterialPageRoute(
          builder: (context) => Scaffold(
                body: Center(child: Text('Not found')),
              ));
  }
}
