import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean/presentation/logic/home/home_screen_cubit.dart';
import 'package:movies_app_clean/presentation/screens/details_screen.dart';
import 'package:movies_app_clean/presentation/screens/home_screen.dart';

import 'constant.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<HomeScreenCubit>(
                  create: (BuildContext context) {
                    return HomeScreenCubit()..init();
                  },
              child: const HomeScreen(),
                ));

      case RoutesConstants.detailsScreen:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text("error"),
            ),
            body: const Center(
              child: Text("no routes found "),
            )));
  }
}
