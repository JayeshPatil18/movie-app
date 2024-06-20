import 'package:assessment/features/wallet/presentation/pages/details.dart';
import 'package:flutter/material.dart';
import '../../features/wallet/presentation/pages/home.dart';

class RouteGenerator{
  Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomePage()
        );

      case 'view_details':
        return MaterialPageRoute(
            builder: (_) => const ViewDetails()
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