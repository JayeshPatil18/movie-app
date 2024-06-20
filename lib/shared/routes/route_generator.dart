import 'package:assessment/shared/routes/route_arguments.dart';
import 'package:flutter/material.dart';

import '../../features/movies/presentation/pages/details.dart';
import '../../features/movies/presentation/pages/home.dart';

class RouteGenerator{
  Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomePage()
        );

      case 'view_details':
        Argument movieModel = settings.arguments as Argument;

        return MaterialPageRoute(
            builder: (_) => ViewDetails(movie: movieModel.movie)
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            body: const Center(
              child: Text("ERROR"),
            ),
          );
        }
    );
  }
}