import 'package:flutter/material.dart';

import '../screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const QuestionListScreen());
      case '/question_30':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const QuestionThirtyScreen());
      case '/references':
        return MaterialPageRoute(
            settings: settings, builder: (_) => const ReferencesScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Route'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Sorry no route was found!',
              style: TextStyle(color: Colors.red, fontSize: 17.0)),
        ),
      );
    });
  }
}
