
import 'package:flutter/material.dart';

import 'package:movies_app_clean/core/utils/app_router.dart';
import 'package:movies_app_clean/core/utils/constant.dart';



Future<void> main() async {

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies App",
      theme: myThemeData(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesConstants.homeScreen,
    );
  }

  ThemeData myThemeData() {
    return ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: ColorConstants.primary),
        scaffoldBackgroundColor: ColorConstants.primary,
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.grey,
            fontSize: 15

          )
        ));
  }
}
