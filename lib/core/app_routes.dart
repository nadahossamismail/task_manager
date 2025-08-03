import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/features/home/presentation/home_view.dart';
import 'package:task_manager/features/home/presentation/home_viewmodel.dart';

class Routes {
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder:
              (_) => HomeView(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(body: Center(child: Text("Not Found"))),
    );
  }
}
